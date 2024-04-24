; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100152 () Bool)

(assert start!100152)

(declare-fun b_free!25495 () Bool)

(declare-fun b_next!25495 () Bool)

(assert (=> start!100152 (= b_free!25495 (not b_next!25495))))

(declare-fun tp!89198 () Bool)

(declare-fun b_and!41859 () Bool)

(assert (=> start!100152 (= tp!89198 b_and!41859)))

(declare-fun b!1190595 () Bool)

(declare-fun res!791362 () Bool)

(declare-fun e!677015 () Bool)

(assert (=> b!1190595 (=> (not res!791362) (not e!677015))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76887 0))(
  ( (array!76888 (arr!37087 (Array (_ BitVec 32) (_ BitVec 64))) (size!37624 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76887)

(assert (=> b!1190595 (= res!791362 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37624 _keys!1208))))))

(declare-fun b!1190596 () Bool)

(declare-fun e!677011 () Bool)

(declare-fun e!677018 () Bool)

(assert (=> b!1190596 (= e!677011 (not e!677018))))

(declare-fun res!791355 () Bool)

(assert (=> b!1190596 (=> res!791355 e!677018)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1190596 (= res!791355 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190596 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39435 0))(
  ( (Unit!39436) )
))
(declare-fun lt!541499 () Unit!39435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76887 (_ BitVec 64) (_ BitVec 32)) Unit!39435)

(assert (=> b!1190596 (= lt!541499 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190597 () Bool)

(declare-fun e!677012 () Bool)

(declare-fun tp_is_empty!30025 () Bool)

(assert (=> b!1190597 (= e!677012 tp_is_empty!30025)))

(declare-fun b!1190598 () Bool)

(declare-fun e!677016 () Bool)

(assert (=> b!1190598 (= e!677016 true)))

(declare-datatypes ((V!45161 0))(
  ( (V!45162 (val!15069 Int)) )
))
(declare-fun zeroValue!944 () V!45161)

(declare-fun lt!541500 () array!76887)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14303 0))(
  ( (ValueCellFull!14303 (v!17703 V!45161)) (EmptyCell!14303) )
))
(declare-datatypes ((array!76889 0))(
  ( (array!76890 (arr!37088 (Array (_ BitVec 32) ValueCell!14303)) (size!37625 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76889)

(declare-fun lt!541503 () array!76889)

(declare-fun minValue!944 () V!45161)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19386 0))(
  ( (tuple2!19387 (_1!9704 (_ BitVec 64)) (_2!9704 V!45161)) )
))
(declare-datatypes ((List!26129 0))(
  ( (Nil!26126) (Cons!26125 (h!27343 tuple2!19386) (t!38608 List!26129)) )
))
(declare-datatypes ((ListLongMap!17363 0))(
  ( (ListLongMap!17364 (toList!8697 List!26129)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5165 (array!76887 array!76889 (_ BitVec 32) (_ BitVec 32) V!45161 V!45161 (_ BitVec 32) Int) ListLongMap!17363)

(declare-fun -!1713 (ListLongMap!17363 (_ BitVec 64)) ListLongMap!17363)

(assert (=> b!1190598 (= (getCurrentListMapNoExtraKeys!5165 lt!541500 lt!541503 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1713 (getCurrentListMapNoExtraKeys!5165 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541504 () Unit!39435)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!928 (array!76887 array!76889 (_ BitVec 32) (_ BitVec 32) V!45161 V!45161 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39435)

(assert (=> b!1190598 (= lt!541504 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!928 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190599 () Bool)

(declare-fun res!791353 () Bool)

(assert (=> b!1190599 (=> (not res!791353) (not e!677015))))

(assert (=> b!1190599 (= res!791353 (and (= (size!37625 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37624 _keys!1208) (size!37625 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!791358 () Bool)

(assert (=> start!100152 (=> (not res!791358) (not e!677015))))

(assert (=> start!100152 (= res!791358 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37624 _keys!1208))))))

(assert (=> start!100152 e!677015))

(assert (=> start!100152 tp_is_empty!30025))

(declare-fun array_inv!28356 (array!76887) Bool)

(assert (=> start!100152 (array_inv!28356 _keys!1208)))

(assert (=> start!100152 true))

(assert (=> start!100152 tp!89198))

(declare-fun e!677014 () Bool)

(declare-fun array_inv!28357 (array!76889) Bool)

(assert (=> start!100152 (and (array_inv!28357 _values!996) e!677014)))

(declare-fun b!1190600 () Bool)

(declare-fun res!791354 () Bool)

(assert (=> b!1190600 (=> (not res!791354) (not e!677015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190600 (= res!791354 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46865 () Bool)

(declare-fun mapRes!46865 () Bool)

(declare-fun tp!89199 () Bool)

(declare-fun e!677013 () Bool)

(assert (=> mapNonEmpty!46865 (= mapRes!46865 (and tp!89199 e!677013))))

(declare-fun mapRest!46865 () (Array (_ BitVec 32) ValueCell!14303))

(declare-fun mapKey!46865 () (_ BitVec 32))

(declare-fun mapValue!46865 () ValueCell!14303)

(assert (=> mapNonEmpty!46865 (= (arr!37088 _values!996) (store mapRest!46865 mapKey!46865 mapValue!46865))))

(declare-fun b!1190601 () Bool)

(declare-fun res!791352 () Bool)

(assert (=> b!1190601 (=> (not res!791352) (not e!677011))))

(declare-datatypes ((List!26130 0))(
  ( (Nil!26127) (Cons!26126 (h!27344 (_ BitVec 64)) (t!38609 List!26130)) )
))
(declare-fun arrayNoDuplicates!0 (array!76887 (_ BitVec 32) List!26130) Bool)

(assert (=> b!1190601 (= res!791352 (arrayNoDuplicates!0 lt!541500 #b00000000000000000000000000000000 Nil!26127))))

(declare-fun mapIsEmpty!46865 () Bool)

(assert (=> mapIsEmpty!46865 mapRes!46865))

(declare-fun b!1190602 () Bool)

(declare-fun res!791357 () Bool)

(assert (=> b!1190602 (=> (not res!791357) (not e!677015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190602 (= res!791357 (validKeyInArray!0 k0!934))))

(declare-fun b!1190603 () Bool)

(declare-fun res!791363 () Bool)

(assert (=> b!1190603 (=> (not res!791363) (not e!677015))))

(assert (=> b!1190603 (= res!791363 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26127))))

(declare-fun b!1190604 () Bool)

(declare-fun res!791356 () Bool)

(assert (=> b!1190604 (=> (not res!791356) (not e!677015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76887 (_ BitVec 32)) Bool)

(assert (=> b!1190604 (= res!791356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190605 () Bool)

(declare-fun res!791359 () Bool)

(assert (=> b!1190605 (=> (not res!791359) (not e!677015))))

(assert (=> b!1190605 (= res!791359 (= (select (arr!37087 _keys!1208) i!673) k0!934))))

(declare-fun b!1190606 () Bool)

(assert (=> b!1190606 (= e!677014 (and e!677012 mapRes!46865))))

(declare-fun condMapEmpty!46865 () Bool)

(declare-fun mapDefault!46865 () ValueCell!14303)

(assert (=> b!1190606 (= condMapEmpty!46865 (= (arr!37088 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14303)) mapDefault!46865)))))

(declare-fun b!1190607 () Bool)

(assert (=> b!1190607 (= e!677013 tp_is_empty!30025)))

(declare-fun b!1190608 () Bool)

(assert (=> b!1190608 (= e!677015 e!677011)))

(declare-fun res!791361 () Bool)

(assert (=> b!1190608 (=> (not res!791361) (not e!677011))))

(assert (=> b!1190608 (= res!791361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541500 mask!1564))))

(assert (=> b!1190608 (= lt!541500 (array!76888 (store (arr!37087 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37624 _keys!1208)))))

(declare-fun b!1190609 () Bool)

(assert (=> b!1190609 (= e!677018 e!677016)))

(declare-fun res!791360 () Bool)

(assert (=> b!1190609 (=> res!791360 e!677016)))

(assert (=> b!1190609 (= res!791360 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541501 () ListLongMap!17363)

(assert (=> b!1190609 (= lt!541501 (getCurrentListMapNoExtraKeys!5165 lt!541500 lt!541503 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3122 (Int (_ BitVec 64)) V!45161)

(assert (=> b!1190609 (= lt!541503 (array!76890 (store (arr!37088 _values!996) i!673 (ValueCellFull!14303 (dynLambda!3122 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37625 _values!996)))))

(declare-fun lt!541502 () ListLongMap!17363)

(assert (=> b!1190609 (= lt!541502 (getCurrentListMapNoExtraKeys!5165 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100152 res!791358) b!1190600))

(assert (= (and b!1190600 res!791354) b!1190599))

(assert (= (and b!1190599 res!791353) b!1190604))

(assert (= (and b!1190604 res!791356) b!1190603))

(assert (= (and b!1190603 res!791363) b!1190595))

(assert (= (and b!1190595 res!791362) b!1190602))

(assert (= (and b!1190602 res!791357) b!1190605))

(assert (= (and b!1190605 res!791359) b!1190608))

(assert (= (and b!1190608 res!791361) b!1190601))

(assert (= (and b!1190601 res!791352) b!1190596))

(assert (= (and b!1190596 (not res!791355)) b!1190609))

(assert (= (and b!1190609 (not res!791360)) b!1190598))

(assert (= (and b!1190606 condMapEmpty!46865) mapIsEmpty!46865))

(assert (= (and b!1190606 (not condMapEmpty!46865)) mapNonEmpty!46865))

(get-info :version)

(assert (= (and mapNonEmpty!46865 ((_ is ValueCellFull!14303) mapValue!46865)) b!1190607))

(assert (= (and b!1190606 ((_ is ValueCellFull!14303) mapDefault!46865)) b!1190597))

(assert (= start!100152 b!1190606))

(declare-fun b_lambda!20633 () Bool)

(assert (=> (not b_lambda!20633) (not b!1190609)))

(declare-fun t!38607 () Bool)

(declare-fun tb!10299 () Bool)

(assert (=> (and start!100152 (= defaultEntry!1004 defaultEntry!1004) t!38607) tb!10299))

(declare-fun result!21173 () Bool)

(assert (=> tb!10299 (= result!21173 tp_is_empty!30025)))

(assert (=> b!1190609 t!38607))

(declare-fun b_and!41861 () Bool)

(assert (= b_and!41859 (and (=> t!38607 result!21173) b_and!41861)))

(declare-fun m!1099569 () Bool)

(assert (=> b!1190609 m!1099569))

(declare-fun m!1099571 () Bool)

(assert (=> b!1190609 m!1099571))

(declare-fun m!1099573 () Bool)

(assert (=> b!1190609 m!1099573))

(declare-fun m!1099575 () Bool)

(assert (=> b!1190609 m!1099575))

(declare-fun m!1099577 () Bool)

(assert (=> b!1190598 m!1099577))

(declare-fun m!1099579 () Bool)

(assert (=> b!1190598 m!1099579))

(assert (=> b!1190598 m!1099579))

(declare-fun m!1099581 () Bool)

(assert (=> b!1190598 m!1099581))

(declare-fun m!1099583 () Bool)

(assert (=> b!1190598 m!1099583))

(declare-fun m!1099585 () Bool)

(assert (=> b!1190600 m!1099585))

(declare-fun m!1099587 () Bool)

(assert (=> b!1190596 m!1099587))

(declare-fun m!1099589 () Bool)

(assert (=> b!1190596 m!1099589))

(declare-fun m!1099591 () Bool)

(assert (=> mapNonEmpty!46865 m!1099591))

(declare-fun m!1099593 () Bool)

(assert (=> start!100152 m!1099593))

(declare-fun m!1099595 () Bool)

(assert (=> start!100152 m!1099595))

(declare-fun m!1099597 () Bool)

(assert (=> b!1190601 m!1099597))

(declare-fun m!1099599 () Bool)

(assert (=> b!1190603 m!1099599))

(declare-fun m!1099601 () Bool)

(assert (=> b!1190608 m!1099601))

(declare-fun m!1099603 () Bool)

(assert (=> b!1190608 m!1099603))

(declare-fun m!1099605 () Bool)

(assert (=> b!1190602 m!1099605))

(declare-fun m!1099607 () Bool)

(assert (=> b!1190605 m!1099607))

(declare-fun m!1099609 () Bool)

(assert (=> b!1190604 m!1099609))

(check-sat (not b!1190604) b_and!41861 (not b!1190600) (not b!1190603) (not b!1190601) (not b!1190608) (not b_next!25495) (not b!1190598) (not b!1190609) tp_is_empty!30025 (not b!1190596) (not start!100152) (not mapNonEmpty!46865) (not b!1190602) (not b_lambda!20633))
(check-sat b_and!41861 (not b_next!25495))
