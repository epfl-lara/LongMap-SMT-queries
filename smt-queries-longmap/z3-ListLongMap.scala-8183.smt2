; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99958 () Bool)

(assert start!99958)

(declare-fun b_free!25543 () Bool)

(declare-fun b_next!25543 () Bool)

(assert (=> start!99958 (= b_free!25543 (not b_next!25543))))

(declare-fun tp!89343 () Bool)

(declare-fun b_and!41931 () Bool)

(assert (=> start!99958 (= tp!89343 b_and!41931)))

(declare-fun b!1190311 () Bool)

(declare-fun res!791650 () Bool)

(declare-fun e!676682 () Bool)

(assert (=> b!1190311 (=> (not res!791650) (not e!676682))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190311 (= res!791650 (validKeyInArray!0 k0!934))))

(declare-fun b!1190312 () Bool)

(declare-fun res!791653 () Bool)

(assert (=> b!1190312 (=> (not res!791653) (not e!676682))))

(declare-datatypes ((array!76872 0))(
  ( (array!76873 (arr!37086 (Array (_ BitVec 32) (_ BitVec 64))) (size!37624 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76872)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190312 (= res!791653 (= (select (arr!37086 _keys!1208) i!673) k0!934))))

(declare-fun b!1190313 () Bool)

(declare-fun res!791642 () Bool)

(assert (=> b!1190313 (=> (not res!791642) (not e!676682))))

(declare-datatypes ((List!26219 0))(
  ( (Nil!26216) (Cons!26215 (h!27424 (_ BitVec 64)) (t!38745 List!26219)) )
))
(declare-fun arrayNoDuplicates!0 (array!76872 (_ BitVec 32) List!26219) Bool)

(assert (=> b!1190313 (= res!791642 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26216))))

(declare-fun b!1190314 () Bool)

(declare-fun e!676684 () Bool)

(assert (=> b!1190314 (= e!676684 true)))

(declare-datatypes ((V!45225 0))(
  ( (V!45226 (val!15093 Int)) )
))
(declare-fun zeroValue!944 () V!45225)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541258 () array!76872)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14327 0))(
  ( (ValueCellFull!14327 (v!17730 V!45225)) (EmptyCell!14327) )
))
(declare-datatypes ((array!76874 0))(
  ( (array!76875 (arr!37087 (Array (_ BitVec 32) ValueCell!14327)) (size!37625 (_ BitVec 32))) )
))
(declare-fun lt!541255 () array!76874)

(declare-fun _values!996 () array!76874)

(declare-fun minValue!944 () V!45225)

(declare-datatypes ((tuple2!19504 0))(
  ( (tuple2!19505 (_1!9763 (_ BitVec 64)) (_2!9763 V!45225)) )
))
(declare-datatypes ((List!26220 0))(
  ( (Nil!26217) (Cons!26216 (h!27425 tuple2!19504) (t!38746 List!26220)) )
))
(declare-datatypes ((ListLongMap!17473 0))(
  ( (ListLongMap!17474 (toList!8752 List!26220)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5202 (array!76872 array!76874 (_ BitVec 32) (_ BitVec 32) V!45225 V!45225 (_ BitVec 32) Int) ListLongMap!17473)

(declare-fun -!1697 (ListLongMap!17473 (_ BitVec 64)) ListLongMap!17473)

(assert (=> b!1190314 (= (getCurrentListMapNoExtraKeys!5202 lt!541258 lt!541255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1697 (getCurrentListMapNoExtraKeys!5202 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39367 0))(
  ( (Unit!39368) )
))
(declare-fun lt!541259 () Unit!39367)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!947 (array!76872 array!76874 (_ BitVec 32) (_ BitVec 32) V!45225 V!45225 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39367)

(assert (=> b!1190314 (= lt!541259 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190315 () Bool)

(declare-fun e!676678 () Bool)

(declare-fun e!676683 () Bool)

(declare-fun mapRes!46937 () Bool)

(assert (=> b!1190315 (= e!676678 (and e!676683 mapRes!46937))))

(declare-fun condMapEmpty!46937 () Bool)

(declare-fun mapDefault!46937 () ValueCell!14327)

(assert (=> b!1190315 (= condMapEmpty!46937 (= (arr!37087 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14327)) mapDefault!46937)))))

(declare-fun mapIsEmpty!46937 () Bool)

(assert (=> mapIsEmpty!46937 mapRes!46937))

(declare-fun b!1190316 () Bool)

(declare-fun e!676681 () Bool)

(declare-fun e!676680 () Bool)

(assert (=> b!1190316 (= e!676681 (not e!676680))))

(declare-fun res!791652 () Bool)

(assert (=> b!1190316 (=> res!791652 e!676680)))

(assert (=> b!1190316 (= res!791652 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190316 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541260 () Unit!39367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76872 (_ BitVec 64) (_ BitVec 32)) Unit!39367)

(assert (=> b!1190316 (= lt!541260 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!791648 () Bool)

(assert (=> start!99958 (=> (not res!791648) (not e!676682))))

(assert (=> start!99958 (= res!791648 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37624 _keys!1208))))))

(assert (=> start!99958 e!676682))

(declare-fun tp_is_empty!30073 () Bool)

(assert (=> start!99958 tp_is_empty!30073))

(declare-fun array_inv!28412 (array!76872) Bool)

(assert (=> start!99958 (array_inv!28412 _keys!1208)))

(assert (=> start!99958 true))

(assert (=> start!99958 tp!89343))

(declare-fun array_inv!28413 (array!76874) Bool)

(assert (=> start!99958 (and (array_inv!28413 _values!996) e!676678)))

(declare-fun b!1190310 () Bool)

(declare-fun res!791644 () Bool)

(assert (=> b!1190310 (=> (not res!791644) (not e!676682))))

(assert (=> b!1190310 (= res!791644 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37624 _keys!1208))))))

(declare-fun b!1190317 () Bool)

(assert (=> b!1190317 (= e!676683 tp_is_empty!30073)))

(declare-fun b!1190318 () Bool)

(declare-fun res!791645 () Bool)

(assert (=> b!1190318 (=> (not res!791645) (not e!676681))))

(assert (=> b!1190318 (= res!791645 (arrayNoDuplicates!0 lt!541258 #b00000000000000000000000000000000 Nil!26216))))

(declare-fun b!1190319 () Bool)

(declare-fun res!791651 () Bool)

(assert (=> b!1190319 (=> (not res!791651) (not e!676682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190319 (= res!791651 (validMask!0 mask!1564))))

(declare-fun b!1190320 () Bool)

(declare-fun res!791649 () Bool)

(assert (=> b!1190320 (=> (not res!791649) (not e!676682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76872 (_ BitVec 32)) Bool)

(assert (=> b!1190320 (= res!791649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190321 () Bool)

(declare-fun res!791647 () Bool)

(assert (=> b!1190321 (=> (not res!791647) (not e!676682))))

(assert (=> b!1190321 (= res!791647 (and (= (size!37625 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37624 _keys!1208) (size!37625 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190322 () Bool)

(declare-fun e!676679 () Bool)

(assert (=> b!1190322 (= e!676679 tp_is_empty!30073)))

(declare-fun b!1190323 () Bool)

(assert (=> b!1190323 (= e!676680 e!676684)))

(declare-fun res!791646 () Bool)

(assert (=> b!1190323 (=> res!791646 e!676684)))

(assert (=> b!1190323 (= res!791646 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541256 () ListLongMap!17473)

(assert (=> b!1190323 (= lt!541256 (getCurrentListMapNoExtraKeys!5202 lt!541258 lt!541255 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3094 (Int (_ BitVec 64)) V!45225)

(assert (=> b!1190323 (= lt!541255 (array!76875 (store (arr!37087 _values!996) i!673 (ValueCellFull!14327 (dynLambda!3094 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37625 _values!996)))))

(declare-fun lt!541257 () ListLongMap!17473)

(assert (=> b!1190323 (= lt!541257 (getCurrentListMapNoExtraKeys!5202 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190324 () Bool)

(assert (=> b!1190324 (= e!676682 e!676681)))

(declare-fun res!791643 () Bool)

(assert (=> b!1190324 (=> (not res!791643) (not e!676681))))

(assert (=> b!1190324 (= res!791643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541258 mask!1564))))

(assert (=> b!1190324 (= lt!541258 (array!76873 (store (arr!37086 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37624 _keys!1208)))))

(declare-fun mapNonEmpty!46937 () Bool)

(declare-fun tp!89342 () Bool)

(assert (=> mapNonEmpty!46937 (= mapRes!46937 (and tp!89342 e!676679))))

(declare-fun mapKey!46937 () (_ BitVec 32))

(declare-fun mapValue!46937 () ValueCell!14327)

(declare-fun mapRest!46937 () (Array (_ BitVec 32) ValueCell!14327))

(assert (=> mapNonEmpty!46937 (= (arr!37087 _values!996) (store mapRest!46937 mapKey!46937 mapValue!46937))))

(assert (= (and start!99958 res!791648) b!1190319))

(assert (= (and b!1190319 res!791651) b!1190321))

(assert (= (and b!1190321 res!791647) b!1190320))

(assert (= (and b!1190320 res!791649) b!1190313))

(assert (= (and b!1190313 res!791642) b!1190310))

(assert (= (and b!1190310 res!791644) b!1190311))

(assert (= (and b!1190311 res!791650) b!1190312))

(assert (= (and b!1190312 res!791653) b!1190324))

(assert (= (and b!1190324 res!791643) b!1190318))

(assert (= (and b!1190318 res!791645) b!1190316))

(assert (= (and b!1190316 (not res!791652)) b!1190323))

(assert (= (and b!1190323 (not res!791646)) b!1190314))

(assert (= (and b!1190315 condMapEmpty!46937) mapIsEmpty!46937))

(assert (= (and b!1190315 (not condMapEmpty!46937)) mapNonEmpty!46937))

(get-info :version)

(assert (= (and mapNonEmpty!46937 ((_ is ValueCellFull!14327) mapValue!46937)) b!1190322))

(assert (= (and b!1190315 ((_ is ValueCellFull!14327) mapDefault!46937)) b!1190317))

(assert (= start!99958 b!1190315))

(declare-fun b_lambda!20669 () Bool)

(assert (=> (not b_lambda!20669) (not b!1190323)))

(declare-fun t!38744 () Bool)

(declare-fun tb!10347 () Bool)

(assert (=> (and start!99958 (= defaultEntry!1004 defaultEntry!1004) t!38744) tb!10347))

(declare-fun result!21269 () Bool)

(assert (=> tb!10347 (= result!21269 tp_is_empty!30073)))

(assert (=> b!1190323 t!38744))

(declare-fun b_and!41933 () Bool)

(assert (= b_and!41931 (and (=> t!38744 result!21269) b_and!41933)))

(declare-fun m!1098395 () Bool)

(assert (=> b!1190312 m!1098395))

(declare-fun m!1098397 () Bool)

(assert (=> mapNonEmpty!46937 m!1098397))

(declare-fun m!1098399 () Bool)

(assert (=> b!1190323 m!1098399))

(declare-fun m!1098401 () Bool)

(assert (=> b!1190323 m!1098401))

(declare-fun m!1098403 () Bool)

(assert (=> b!1190323 m!1098403))

(declare-fun m!1098405 () Bool)

(assert (=> b!1190323 m!1098405))

(declare-fun m!1098407 () Bool)

(assert (=> b!1190316 m!1098407))

(declare-fun m!1098409 () Bool)

(assert (=> b!1190316 m!1098409))

(declare-fun m!1098411 () Bool)

(assert (=> start!99958 m!1098411))

(declare-fun m!1098413 () Bool)

(assert (=> start!99958 m!1098413))

(declare-fun m!1098415 () Bool)

(assert (=> b!1190324 m!1098415))

(declare-fun m!1098417 () Bool)

(assert (=> b!1190324 m!1098417))

(declare-fun m!1098419 () Bool)

(assert (=> b!1190314 m!1098419))

(declare-fun m!1098421 () Bool)

(assert (=> b!1190314 m!1098421))

(assert (=> b!1190314 m!1098421))

(declare-fun m!1098423 () Bool)

(assert (=> b!1190314 m!1098423))

(declare-fun m!1098425 () Bool)

(assert (=> b!1190314 m!1098425))

(declare-fun m!1098427 () Bool)

(assert (=> b!1190319 m!1098427))

(declare-fun m!1098429 () Bool)

(assert (=> b!1190311 m!1098429))

(declare-fun m!1098431 () Bool)

(assert (=> b!1190318 m!1098431))

(declare-fun m!1098433 () Bool)

(assert (=> b!1190313 m!1098433))

(declare-fun m!1098435 () Bool)

(assert (=> b!1190320 m!1098435))

(check-sat (not b!1190316) b_and!41933 (not b_next!25543) (not b_lambda!20669) tp_is_empty!30073 (not b!1190318) (not b!1190324) (not b!1190323) (not b!1190313) (not b!1190311) (not mapNonEmpty!46937) (not b!1190314) (not b!1190319) (not start!99958) (not b!1190320))
(check-sat b_and!41933 (not b_next!25543))
