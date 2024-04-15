; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101458 () Bool)

(assert start!101458)

(declare-fun b_free!26281 () Bool)

(declare-fun b_next!26281 () Bool)

(assert (=> start!101458 (= b_free!26281 (not b_next!26281))))

(declare-fun tp!91877 () Bool)

(declare-fun b_and!43733 () Bool)

(assert (=> start!101458 (= tp!91877 b_and!43733)))

(declare-fun b!1219378 () Bool)

(declare-fun res!809914 () Bool)

(declare-fun e!692355 () Bool)

(assert (=> b!1219378 (=> (not res!809914) (not e!692355))))

(declare-datatypes ((array!78668 0))(
  ( (array!78669 (arr!37965 (Array (_ BitVec 32) (_ BitVec 64))) (size!38503 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78668)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46441 0))(
  ( (V!46442 (val!15549 Int)) )
))
(declare-datatypes ((ValueCell!14783 0))(
  ( (ValueCellFull!14783 (v!18205 V!46441)) (EmptyCell!14783) )
))
(declare-datatypes ((array!78670 0))(
  ( (array!78671 (arr!37966 (Array (_ BitVec 32) ValueCell!14783)) (size!38504 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78670)

(assert (=> b!1219378 (= res!809914 (and (= (size!38504 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38503 _keys!1208) (size!38504 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219379 () Bool)

(declare-fun res!809912 () Bool)

(assert (=> b!1219379 (=> (not res!809912) (not e!692355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219379 (= res!809912 (validMask!0 mask!1564))))

(declare-fun b!1219380 () Bool)

(declare-fun e!692353 () Bool)

(declare-fun e!692352 () Bool)

(assert (=> b!1219380 (= e!692353 (not e!692352))))

(declare-fun res!809915 () Bool)

(assert (=> b!1219380 (=> res!809915 e!692352)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219380 (= res!809915 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219380 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40265 0))(
  ( (Unit!40266) )
))
(declare-fun lt!554284 () Unit!40265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78668 (_ BitVec 64) (_ BitVec 32)) Unit!40265)

(assert (=> b!1219380 (= lt!554284 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219381 () Bool)

(declare-fun res!809904 () Bool)

(assert (=> b!1219381 (=> (not res!809904) (not e!692355))))

(assert (=> b!1219381 (= res!809904 (= (select (arr!37965 _keys!1208) i!673) k0!934))))

(declare-fun b!1219382 () Bool)

(declare-fun e!692348 () Bool)

(assert (=> b!1219382 (= e!692352 e!692348)))

(declare-fun res!809908 () Bool)

(assert (=> b!1219382 (=> res!809908 e!692348)))

(assert (=> b!1219382 (= res!809908 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46441)

(declare-datatypes ((tuple2!20092 0))(
  ( (tuple2!20093 (_1!10057 (_ BitVec 64)) (_2!10057 V!46441)) )
))
(declare-datatypes ((List!26872 0))(
  ( (Nil!26869) (Cons!26868 (h!28077 tuple2!20092) (t!40124 List!26872)) )
))
(declare-datatypes ((ListLongMap!18061 0))(
  ( (ListLongMap!18062 (toList!9046 List!26872)) )
))
(declare-fun lt!554277 () ListLongMap!18061)

(declare-fun lt!554283 () array!78670)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46441)

(declare-fun lt!554275 () array!78668)

(declare-fun getCurrentListMapNoExtraKeys!5484 (array!78668 array!78670 (_ BitVec 32) (_ BitVec 32) V!46441 V!46441 (_ BitVec 32) Int) ListLongMap!18061)

(assert (=> b!1219382 (= lt!554277 (getCurrentListMapNoExtraKeys!5484 lt!554275 lt!554283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554280 () V!46441)

(assert (=> b!1219382 (= lt!554283 (array!78671 (store (arr!37966 _values!996) i!673 (ValueCellFull!14783 lt!554280)) (size!38504 _values!996)))))

(declare-fun dynLambda!3334 (Int (_ BitVec 64)) V!46441)

(assert (=> b!1219382 (= lt!554280 (dynLambda!3334 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554276 () ListLongMap!18061)

(assert (=> b!1219382 (= lt!554276 (getCurrentListMapNoExtraKeys!5484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219383 () Bool)

(declare-fun res!809913 () Bool)

(assert (=> b!1219383 (=> (not res!809913) (not e!692355))))

(assert (=> b!1219383 (= res!809913 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38503 _keys!1208))))))

(declare-fun b!1219384 () Bool)

(declare-fun res!809902 () Bool)

(assert (=> b!1219384 (=> (not res!809902) (not e!692355))))

(declare-datatypes ((List!26873 0))(
  ( (Nil!26870) (Cons!26869 (h!28078 (_ BitVec 64)) (t!40125 List!26873)) )
))
(declare-fun arrayNoDuplicates!0 (array!78668 (_ BitVec 32) List!26873) Bool)

(assert (=> b!1219384 (= res!809902 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26870))))

(declare-fun b!1219385 () Bool)

(declare-fun res!809907 () Bool)

(assert (=> b!1219385 (=> (not res!809907) (not e!692353))))

(assert (=> b!1219385 (= res!809907 (arrayNoDuplicates!0 lt!554275 #b00000000000000000000000000000000 Nil!26870))))

(declare-fun b!1219386 () Bool)

(declare-fun e!692350 () Bool)

(declare-fun e!692357 () Bool)

(assert (=> b!1219386 (= e!692350 e!692357)))

(declare-fun res!809909 () Bool)

(assert (=> b!1219386 (=> res!809909 e!692357)))

(assert (=> b!1219386 (= res!809909 (not (= (select (arr!37965 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692349 () Bool)

(assert (=> b!1219386 e!692349))

(declare-fun res!809906 () Bool)

(assert (=> b!1219386 (=> (not res!809906) (not e!692349))))

(declare-fun lt!554285 () ListLongMap!18061)

(declare-fun +!4113 (ListLongMap!18061 tuple2!20092) ListLongMap!18061)

(declare-fun get!19374 (ValueCell!14783 V!46441) V!46441)

(assert (=> b!1219386 (= res!809906 (= lt!554277 (+!4113 lt!554285 (tuple2!20093 (select (arr!37965 _keys!1208) from!1455) (get!19374 (select (arr!37966 _values!996) from!1455) lt!554280)))))))

(declare-fun b!1219387 () Bool)

(declare-fun res!809910 () Bool)

(assert (=> b!1219387 (=> (not res!809910) (not e!692355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219387 (= res!809910 (validKeyInArray!0 k0!934))))

(declare-fun b!1219388 () Bool)

(assert (=> b!1219388 (= e!692348 e!692350)))

(declare-fun res!809905 () Bool)

(assert (=> b!1219388 (=> res!809905 e!692350)))

(assert (=> b!1219388 (= res!809905 (not (validKeyInArray!0 (select (arr!37965 _keys!1208) from!1455))))))

(declare-fun lt!554278 () ListLongMap!18061)

(assert (=> b!1219388 (= lt!554278 lt!554285)))

(declare-fun lt!554279 () ListLongMap!18061)

(declare-fun -!1878 (ListLongMap!18061 (_ BitVec 64)) ListLongMap!18061)

(assert (=> b!1219388 (= lt!554285 (-!1878 lt!554279 k0!934))))

(assert (=> b!1219388 (= lt!554278 (getCurrentListMapNoExtraKeys!5484 lt!554275 lt!554283 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219388 (= lt!554279 (getCurrentListMapNoExtraKeys!5484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554282 () Unit!40265)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1113 (array!78668 array!78670 (_ BitVec 32) (_ BitVec 32) V!46441 V!46441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40265)

(assert (=> b!1219388 (= lt!554282 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1113 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219389 () Bool)

(assert (=> b!1219389 (= e!692355 e!692353)))

(declare-fun res!809911 () Bool)

(assert (=> b!1219389 (=> (not res!809911) (not e!692353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78668 (_ BitVec 32)) Bool)

(assert (=> b!1219389 (= res!809911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554275 mask!1564))))

(assert (=> b!1219389 (= lt!554275 (array!78669 (store (arr!37965 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38503 _keys!1208)))))

(declare-fun b!1219390 () Bool)

(assert (=> b!1219390 (= e!692357 (or (bvsge (size!38503 _keys!1208) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!38503 _keys!1208))))))

(assert (=> b!1219390 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554281 () Unit!40265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40265)

(assert (=> b!1219390 (= lt!554281 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219391 () Bool)

(declare-fun e!692354 () Bool)

(declare-fun tp_is_empty!30985 () Bool)

(assert (=> b!1219391 (= e!692354 tp_is_empty!30985)))

(declare-fun res!809900 () Bool)

(assert (=> start!101458 (=> (not res!809900) (not e!692355))))

(assert (=> start!101458 (= res!809900 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38503 _keys!1208))))))

(assert (=> start!101458 e!692355))

(assert (=> start!101458 tp_is_empty!30985))

(declare-fun array_inv!29016 (array!78668) Bool)

(assert (=> start!101458 (array_inv!29016 _keys!1208)))

(assert (=> start!101458 true))

(assert (=> start!101458 tp!91877))

(declare-fun e!692359 () Bool)

(declare-fun array_inv!29017 (array!78670) Bool)

(assert (=> start!101458 (and (array_inv!29017 _values!996) e!692359)))

(declare-fun b!1219392 () Bool)

(declare-fun res!809903 () Bool)

(assert (=> b!1219392 (=> (not res!809903) (not e!692355))))

(assert (=> b!1219392 (= res!809903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219393 () Bool)

(declare-fun e!692358 () Bool)

(assert (=> b!1219393 (= e!692349 e!692358)))

(declare-fun res!809901 () Bool)

(assert (=> b!1219393 (=> res!809901 e!692358)))

(assert (=> b!1219393 (= res!809901 (not (= (select (arr!37965 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!48364 () Bool)

(declare-fun mapRes!48364 () Bool)

(assert (=> mapIsEmpty!48364 mapRes!48364))

(declare-fun b!1219394 () Bool)

(assert (=> b!1219394 (= e!692358 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48364 () Bool)

(declare-fun tp!91876 () Bool)

(assert (=> mapNonEmpty!48364 (= mapRes!48364 (and tp!91876 e!692354))))

(declare-fun mapKey!48364 () (_ BitVec 32))

(declare-fun mapRest!48364 () (Array (_ BitVec 32) ValueCell!14783))

(declare-fun mapValue!48364 () ValueCell!14783)

(assert (=> mapNonEmpty!48364 (= (arr!37966 _values!996) (store mapRest!48364 mapKey!48364 mapValue!48364))))

(declare-fun b!1219395 () Bool)

(declare-fun e!692351 () Bool)

(assert (=> b!1219395 (= e!692351 tp_is_empty!30985)))

(declare-fun b!1219396 () Bool)

(assert (=> b!1219396 (= e!692359 (and e!692351 mapRes!48364))))

(declare-fun condMapEmpty!48364 () Bool)

(declare-fun mapDefault!48364 () ValueCell!14783)

(assert (=> b!1219396 (= condMapEmpty!48364 (= (arr!37966 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14783)) mapDefault!48364)))))

(assert (= (and start!101458 res!809900) b!1219379))

(assert (= (and b!1219379 res!809912) b!1219378))

(assert (= (and b!1219378 res!809914) b!1219392))

(assert (= (and b!1219392 res!809903) b!1219384))

(assert (= (and b!1219384 res!809902) b!1219383))

(assert (= (and b!1219383 res!809913) b!1219387))

(assert (= (and b!1219387 res!809910) b!1219381))

(assert (= (and b!1219381 res!809904) b!1219389))

(assert (= (and b!1219389 res!809911) b!1219385))

(assert (= (and b!1219385 res!809907) b!1219380))

(assert (= (and b!1219380 (not res!809915)) b!1219382))

(assert (= (and b!1219382 (not res!809908)) b!1219388))

(assert (= (and b!1219388 (not res!809905)) b!1219386))

(assert (= (and b!1219386 res!809906) b!1219393))

(assert (= (and b!1219393 (not res!809901)) b!1219394))

(assert (= (and b!1219386 (not res!809909)) b!1219390))

(assert (= (and b!1219396 condMapEmpty!48364) mapIsEmpty!48364))

(assert (= (and b!1219396 (not condMapEmpty!48364)) mapNonEmpty!48364))

(get-info :version)

(assert (= (and mapNonEmpty!48364 ((_ is ValueCellFull!14783) mapValue!48364)) b!1219391))

(assert (= (and b!1219396 ((_ is ValueCellFull!14783) mapDefault!48364)) b!1219395))

(assert (= start!101458 b!1219396))

(declare-fun b_lambda!22099 () Bool)

(assert (=> (not b_lambda!22099) (not b!1219382)))

(declare-fun t!40123 () Bool)

(declare-fun tb!11073 () Bool)

(assert (=> (and start!101458 (= defaultEntry!1004 defaultEntry!1004) t!40123) tb!11073))

(declare-fun result!22759 () Bool)

(assert (=> tb!11073 (= result!22759 tp_is_empty!30985)))

(assert (=> b!1219382 t!40123))

(declare-fun b_and!43735 () Bool)

(assert (= b_and!43733 (and (=> t!40123 result!22759) b_and!43735)))

(declare-fun m!1123703 () Bool)

(assert (=> b!1219386 m!1123703))

(declare-fun m!1123705 () Bool)

(assert (=> b!1219386 m!1123705))

(assert (=> b!1219386 m!1123705))

(declare-fun m!1123707 () Bool)

(assert (=> b!1219386 m!1123707))

(declare-fun m!1123709 () Bool)

(assert (=> b!1219386 m!1123709))

(declare-fun m!1123711 () Bool)

(assert (=> b!1219382 m!1123711))

(declare-fun m!1123713 () Bool)

(assert (=> b!1219382 m!1123713))

(declare-fun m!1123715 () Bool)

(assert (=> b!1219382 m!1123715))

(declare-fun m!1123717 () Bool)

(assert (=> b!1219382 m!1123717))

(declare-fun m!1123719 () Bool)

(assert (=> b!1219384 m!1123719))

(declare-fun m!1123721 () Bool)

(assert (=> b!1219394 m!1123721))

(declare-fun m!1123723 () Bool)

(assert (=> b!1219381 m!1123723))

(declare-fun m!1123725 () Bool)

(assert (=> mapNonEmpty!48364 m!1123725))

(declare-fun m!1123727 () Bool)

(assert (=> b!1219387 m!1123727))

(declare-fun m!1123729 () Bool)

(assert (=> start!101458 m!1123729))

(declare-fun m!1123731 () Bool)

(assert (=> start!101458 m!1123731))

(assert (=> b!1219393 m!1123703))

(declare-fun m!1123733 () Bool)

(assert (=> b!1219379 m!1123733))

(declare-fun m!1123735 () Bool)

(assert (=> b!1219388 m!1123735))

(declare-fun m!1123737 () Bool)

(assert (=> b!1219388 m!1123737))

(declare-fun m!1123739 () Bool)

(assert (=> b!1219388 m!1123739))

(declare-fun m!1123741 () Bool)

(assert (=> b!1219388 m!1123741))

(assert (=> b!1219388 m!1123703))

(declare-fun m!1123743 () Bool)

(assert (=> b!1219388 m!1123743))

(assert (=> b!1219388 m!1123703))

(declare-fun m!1123745 () Bool)

(assert (=> b!1219380 m!1123745))

(declare-fun m!1123747 () Bool)

(assert (=> b!1219380 m!1123747))

(declare-fun m!1123749 () Bool)

(assert (=> b!1219389 m!1123749))

(declare-fun m!1123751 () Bool)

(assert (=> b!1219389 m!1123751))

(declare-fun m!1123753 () Bool)

(assert (=> b!1219392 m!1123753))

(declare-fun m!1123755 () Bool)

(assert (=> b!1219390 m!1123755))

(declare-fun m!1123757 () Bool)

(assert (=> b!1219390 m!1123757))

(declare-fun m!1123759 () Bool)

(assert (=> b!1219385 m!1123759))

(check-sat (not b!1219380) (not b!1219385) (not b!1219392) (not b!1219384) (not b!1219387) b_and!43735 (not mapNonEmpty!48364) (not start!101458) tp_is_empty!30985 (not b!1219388) (not b!1219386) (not b_next!26281) (not b!1219394) (not b_lambda!22099) (not b!1219382) (not b!1219379) (not b!1219390) (not b!1219389))
(check-sat b_and!43735 (not b_next!26281))
