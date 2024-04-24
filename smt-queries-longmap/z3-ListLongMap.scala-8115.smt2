; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99792 () Bool)

(assert start!99792)

(declare-fun b_free!25135 () Bool)

(declare-fun b_next!25135 () Bool)

(assert (=> start!99792 (= b_free!25135 (not b_next!25135))))

(declare-fun tp!88118 () Bool)

(declare-fun b_and!41139 () Bool)

(assert (=> start!99792 (= tp!88118 b_and!41139)))

(declare-fun b!1179519 () Bool)

(declare-fun res!783211 () Bool)

(declare-fun e!670645 () Bool)

(assert (=> b!1179519 (=> (not res!783211) (not e!670645))))

(declare-datatypes ((array!76183 0))(
  ( (array!76184 (arr!36735 (Array (_ BitVec 32) (_ BitVec 64))) (size!37272 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76183)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1179519 (= res!783211 (= (select (arr!36735 _keys!1208) i!673) k0!934))))

(declare-fun b!1179520 () Bool)

(declare-fun e!670644 () Bool)

(declare-fun e!670643 () Bool)

(declare-fun mapRes!46325 () Bool)

(assert (=> b!1179520 (= e!670644 (and e!670643 mapRes!46325))))

(declare-fun condMapEmpty!46325 () Bool)

(declare-datatypes ((V!44681 0))(
  ( (V!44682 (val!14889 Int)) )
))
(declare-datatypes ((ValueCell!14123 0))(
  ( (ValueCellFull!14123 (v!17523 V!44681)) (EmptyCell!14123) )
))
(declare-datatypes ((array!76185 0))(
  ( (array!76186 (arr!36736 (Array (_ BitVec 32) ValueCell!14123)) (size!37273 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76185)

(declare-fun mapDefault!46325 () ValueCell!14123)

(assert (=> b!1179520 (= condMapEmpty!46325 (= (arr!36736 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14123)) mapDefault!46325)))))

(declare-fun b!1179521 () Bool)

(declare-fun e!670648 () Bool)

(assert (=> b!1179521 (= e!670648 true)))

(declare-fun e!670652 () Bool)

(assert (=> b!1179521 e!670652))

(declare-fun res!783220 () Bool)

(assert (=> b!1179521 (=> (not res!783220) (not e!670652))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179521 (= res!783220 (not (= (select (arr!36735 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38913 0))(
  ( (Unit!38914) )
))
(declare-fun lt!532702 () Unit!38913)

(declare-fun e!670651 () Unit!38913)

(assert (=> b!1179521 (= lt!532702 e!670651)))

(declare-fun c!117224 () Bool)

(assert (=> b!1179521 (= c!117224 (= (select (arr!36735 _keys!1208) from!1455) k0!934))))

(declare-fun e!670641 () Bool)

(assert (=> b!1179521 e!670641))

(declare-fun res!783209 () Bool)

(assert (=> b!1179521 (=> (not res!783209) (not e!670641))))

(declare-datatypes ((tuple2!19098 0))(
  ( (tuple2!19099 (_1!9560 (_ BitVec 64)) (_2!9560 V!44681)) )
))
(declare-fun lt!532698 () tuple2!19098)

(declare-datatypes ((List!25829 0))(
  ( (Nil!25826) (Cons!25825 (h!27043 tuple2!19098) (t!37948 List!25829)) )
))
(declare-datatypes ((ListLongMap!17075 0))(
  ( (ListLongMap!17076 (toList!8553 List!25829)) )
))
(declare-fun lt!532700 () ListLongMap!17075)

(declare-fun lt!532688 () ListLongMap!17075)

(declare-fun +!3878 (ListLongMap!17075 tuple2!19098) ListLongMap!17075)

(assert (=> b!1179521 (= res!783209 (= lt!532700 (+!3878 lt!532688 lt!532698)))))

(declare-fun lt!532695 () V!44681)

(declare-fun get!18805 (ValueCell!14123 V!44681) V!44681)

(assert (=> b!1179521 (= lt!532698 (tuple2!19099 (select (arr!36735 _keys!1208) from!1455) (get!18805 (select (arr!36736 _values!996) from!1455) lt!532695)))))

(declare-fun mapIsEmpty!46325 () Bool)

(assert (=> mapIsEmpty!46325 mapRes!46325))

(declare-fun b!1179522 () Bool)

(declare-fun e!670646 () Bool)

(assert (=> b!1179522 (= e!670641 e!670646)))

(declare-fun res!783221 () Bool)

(assert (=> b!1179522 (=> res!783221 e!670646)))

(assert (=> b!1179522 (= res!783221 (not (= (select (arr!36735 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1179523 () Bool)

(declare-fun e!670650 () Bool)

(assert (=> b!1179523 (= e!670650 e!670648)))

(declare-fun res!783216 () Bool)

(assert (=> b!1179523 (=> res!783216 e!670648)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179523 (= res!783216 (not (validKeyInArray!0 (select (arr!36735 _keys!1208) from!1455))))))

(declare-fun lt!532690 () ListLongMap!17075)

(assert (=> b!1179523 (= lt!532690 lt!532688)))

(declare-fun lt!532696 () ListLongMap!17075)

(declare-fun -!1585 (ListLongMap!17075 (_ BitVec 64)) ListLongMap!17075)

(assert (=> b!1179523 (= lt!532688 (-!1585 lt!532696 k0!934))))

(declare-fun zeroValue!944 () V!44681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532699 () array!76185)

(declare-fun lt!532691 () array!76183)

(declare-fun minValue!944 () V!44681)

(declare-fun getCurrentListMapNoExtraKeys!5032 (array!76183 array!76185 (_ BitVec 32) (_ BitVec 32) V!44681 V!44681 (_ BitVec 32) Int) ListLongMap!17075)

(assert (=> b!1179523 (= lt!532690 (getCurrentListMapNoExtraKeys!5032 lt!532691 lt!532699 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179523 (= lt!532696 (getCurrentListMapNoExtraKeys!5032 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532693 () Unit!38913)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!810 (array!76183 array!76185 (_ BitVec 32) (_ BitVec 32) V!44681 V!44681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38913)

(assert (=> b!1179523 (= lt!532693 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!810 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179524 () Bool)

(declare-fun res!783217 () Bool)

(assert (=> b!1179524 (=> (not res!783217) (not e!670645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179524 (= res!783217 (validMask!0 mask!1564))))

(declare-fun b!1179525 () Bool)

(declare-fun res!783215 () Bool)

(assert (=> b!1179525 (=> (not res!783215) (not e!670645))))

(assert (=> b!1179525 (= res!783215 (validKeyInArray!0 k0!934))))

(declare-fun b!1179526 () Bool)

(declare-fun res!783214 () Bool)

(assert (=> b!1179526 (=> (not res!783214) (not e!670645))))

(declare-datatypes ((List!25830 0))(
  ( (Nil!25827) (Cons!25826 (h!27044 (_ BitVec 64)) (t!37949 List!25830)) )
))
(declare-fun arrayNoDuplicates!0 (array!76183 (_ BitVec 32) List!25830) Bool)

(assert (=> b!1179526 (= res!783214 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25827))))

(declare-fun b!1179528 () Bool)

(declare-fun tp_is_empty!29665 () Bool)

(assert (=> b!1179528 (= e!670643 tp_is_empty!29665)))

(declare-fun mapNonEmpty!46325 () Bool)

(declare-fun tp!88119 () Bool)

(declare-fun e!670647 () Bool)

(assert (=> mapNonEmpty!46325 (= mapRes!46325 (and tp!88119 e!670647))))

(declare-fun mapKey!46325 () (_ BitVec 32))

(declare-fun mapValue!46325 () ValueCell!14123)

(declare-fun mapRest!46325 () (Array (_ BitVec 32) ValueCell!14123))

(assert (=> mapNonEmpty!46325 (= (arr!36736 _values!996) (store mapRest!46325 mapKey!46325 mapValue!46325))))

(declare-fun b!1179529 () Bool)

(declare-fun e!670640 () Bool)

(assert (=> b!1179529 (= e!670640 e!670650)))

(declare-fun res!783207 () Bool)

(assert (=> b!1179529 (=> res!783207 e!670650)))

(assert (=> b!1179529 (= res!783207 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179529 (= lt!532700 (getCurrentListMapNoExtraKeys!5032 lt!532691 lt!532699 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179529 (= lt!532699 (array!76186 (store (arr!36736 _values!996) i!673 (ValueCellFull!14123 lt!532695)) (size!37273 _values!996)))))

(declare-fun dynLambda!3003 (Int (_ BitVec 64)) V!44681)

(assert (=> b!1179529 (= lt!532695 (dynLambda!3003 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532697 () ListLongMap!17075)

(assert (=> b!1179529 (= lt!532697 (getCurrentListMapNoExtraKeys!5032 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179530 () Bool)

(declare-fun Unit!38915 () Unit!38913)

(assert (=> b!1179530 (= e!670651 Unit!38915)))

(declare-fun lt!532689 () Unit!38913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76183 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38913)

(assert (=> b!1179530 (= lt!532689 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179530 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532701 () Unit!38913)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76183 (_ BitVec 32) (_ BitVec 32)) Unit!38913)

(assert (=> b!1179530 (= lt!532701 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179530 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25827)))

(declare-fun lt!532692 () Unit!38913)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76183 (_ BitVec 64) (_ BitVec 32) List!25830) Unit!38913)

(assert (=> b!1179530 (= lt!532692 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25827))))

(assert (=> b!1179530 false))

(declare-fun b!1179531 () Bool)

(declare-fun e!670642 () Bool)

(assert (=> b!1179531 (= e!670642 (not e!670640))))

(declare-fun res!783219 () Bool)

(assert (=> b!1179531 (=> res!783219 e!670640)))

(assert (=> b!1179531 (= res!783219 (bvsgt from!1455 i!673))))

(assert (=> b!1179531 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532694 () Unit!38913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76183 (_ BitVec 64) (_ BitVec 32)) Unit!38913)

(assert (=> b!1179531 (= lt!532694 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179532 () Bool)

(declare-fun res!783213 () Bool)

(assert (=> b!1179532 (=> (not res!783213) (not e!670642))))

(assert (=> b!1179532 (= res!783213 (arrayNoDuplicates!0 lt!532691 #b00000000000000000000000000000000 Nil!25827))))

(declare-fun b!1179533 () Bool)

(assert (=> b!1179533 (= e!670645 e!670642)))

(declare-fun res!783208 () Bool)

(assert (=> b!1179533 (=> (not res!783208) (not e!670642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76183 (_ BitVec 32)) Bool)

(assert (=> b!1179533 (= res!783208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532691 mask!1564))))

(assert (=> b!1179533 (= lt!532691 (array!76184 (store (arr!36735 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37272 _keys!1208)))))

(declare-fun b!1179534 () Bool)

(declare-fun res!783212 () Bool)

(assert (=> b!1179534 (=> (not res!783212) (not e!670645))))

(assert (=> b!1179534 (= res!783212 (and (= (size!37273 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37272 _keys!1208) (size!37273 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179535 () Bool)

(declare-fun res!783206 () Bool)

(assert (=> b!1179535 (=> (not res!783206) (not e!670645))))

(assert (=> b!1179535 (= res!783206 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37272 _keys!1208))))))

(declare-fun res!783210 () Bool)

(assert (=> start!99792 (=> (not res!783210) (not e!670645))))

(assert (=> start!99792 (= res!783210 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37272 _keys!1208))))))

(assert (=> start!99792 e!670645))

(assert (=> start!99792 tp_is_empty!29665))

(declare-fun array_inv!28122 (array!76183) Bool)

(assert (=> start!99792 (array_inv!28122 _keys!1208)))

(assert (=> start!99792 true))

(assert (=> start!99792 tp!88118))

(declare-fun array_inv!28123 (array!76185) Bool)

(assert (=> start!99792 (and (array_inv!28123 _values!996) e!670644)))

(declare-fun b!1179527 () Bool)

(assert (=> b!1179527 (= e!670647 tp_is_empty!29665)))

(declare-fun b!1179536 () Bool)

(assert (=> b!1179536 (= e!670652 (= lt!532697 (+!3878 lt!532696 lt!532698)))))

(declare-fun b!1179537 () Bool)

(declare-fun res!783218 () Bool)

(assert (=> b!1179537 (=> (not res!783218) (not e!670645))))

(assert (=> b!1179537 (= res!783218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179538 () Bool)

(assert (=> b!1179538 (= e!670646 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179539 () Bool)

(declare-fun Unit!38916 () Unit!38913)

(assert (=> b!1179539 (= e!670651 Unit!38916)))

(assert (= (and start!99792 res!783210) b!1179524))

(assert (= (and b!1179524 res!783217) b!1179534))

(assert (= (and b!1179534 res!783212) b!1179537))

(assert (= (and b!1179537 res!783218) b!1179526))

(assert (= (and b!1179526 res!783214) b!1179535))

(assert (= (and b!1179535 res!783206) b!1179525))

(assert (= (and b!1179525 res!783215) b!1179519))

(assert (= (and b!1179519 res!783211) b!1179533))

(assert (= (and b!1179533 res!783208) b!1179532))

(assert (= (and b!1179532 res!783213) b!1179531))

(assert (= (and b!1179531 (not res!783219)) b!1179529))

(assert (= (and b!1179529 (not res!783207)) b!1179523))

(assert (= (and b!1179523 (not res!783216)) b!1179521))

(assert (= (and b!1179521 res!783209) b!1179522))

(assert (= (and b!1179522 (not res!783221)) b!1179538))

(assert (= (and b!1179521 c!117224) b!1179530))

(assert (= (and b!1179521 (not c!117224)) b!1179539))

(assert (= (and b!1179521 res!783220) b!1179536))

(assert (= (and b!1179520 condMapEmpty!46325) mapIsEmpty!46325))

(assert (= (and b!1179520 (not condMapEmpty!46325)) mapNonEmpty!46325))

(get-info :version)

(assert (= (and mapNonEmpty!46325 ((_ is ValueCellFull!14123) mapValue!46325)) b!1179527))

(assert (= (and b!1179520 ((_ is ValueCellFull!14123) mapDefault!46325)) b!1179528))

(assert (= start!99792 b!1179520))

(declare-fun b_lambda!20273 () Bool)

(assert (=> (not b_lambda!20273) (not b!1179529)))

(declare-fun t!37947 () Bool)

(declare-fun tb!9939 () Bool)

(assert (=> (and start!99792 (= defaultEntry!1004 defaultEntry!1004) t!37947) tb!9939))

(declare-fun result!20453 () Bool)

(assert (=> tb!9939 (= result!20453 tp_is_empty!29665)))

(assert (=> b!1179529 t!37947))

(declare-fun b_and!41141 () Bool)

(assert (= b_and!41139 (and (=> t!37947 result!20453) b_and!41141)))

(declare-fun m!1087761 () Bool)

(assert (=> b!1179530 m!1087761))

(declare-fun m!1087763 () Bool)

(assert (=> b!1179530 m!1087763))

(declare-fun m!1087765 () Bool)

(assert (=> b!1179530 m!1087765))

(declare-fun m!1087767 () Bool)

(assert (=> b!1179530 m!1087767))

(declare-fun m!1087769 () Bool)

(assert (=> b!1179530 m!1087769))

(declare-fun m!1087771 () Bool)

(assert (=> b!1179519 m!1087771))

(declare-fun m!1087773 () Bool)

(assert (=> b!1179532 m!1087773))

(declare-fun m!1087775 () Bool)

(assert (=> b!1179523 m!1087775))

(declare-fun m!1087777 () Bool)

(assert (=> b!1179523 m!1087777))

(declare-fun m!1087779 () Bool)

(assert (=> b!1179523 m!1087779))

(declare-fun m!1087781 () Bool)

(assert (=> b!1179523 m!1087781))

(declare-fun m!1087783 () Bool)

(assert (=> b!1179523 m!1087783))

(declare-fun m!1087785 () Bool)

(assert (=> b!1179523 m!1087785))

(assert (=> b!1179523 m!1087783))

(declare-fun m!1087787 () Bool)

(assert (=> b!1179526 m!1087787))

(declare-fun m!1087789 () Bool)

(assert (=> b!1179531 m!1087789))

(declare-fun m!1087791 () Bool)

(assert (=> b!1179531 m!1087791))

(declare-fun m!1087793 () Bool)

(assert (=> b!1179525 m!1087793))

(declare-fun m!1087795 () Bool)

(assert (=> b!1179537 m!1087795))

(declare-fun m!1087797 () Bool)

(assert (=> b!1179533 m!1087797))

(declare-fun m!1087799 () Bool)

(assert (=> b!1179533 m!1087799))

(declare-fun m!1087801 () Bool)

(assert (=> b!1179529 m!1087801))

(declare-fun m!1087803 () Bool)

(assert (=> b!1179529 m!1087803))

(declare-fun m!1087805 () Bool)

(assert (=> b!1179529 m!1087805))

(declare-fun m!1087807 () Bool)

(assert (=> b!1179529 m!1087807))

(declare-fun m!1087809 () Bool)

(assert (=> mapNonEmpty!46325 m!1087809))

(declare-fun m!1087811 () Bool)

(assert (=> b!1179538 m!1087811))

(declare-fun m!1087813 () Bool)

(assert (=> b!1179536 m!1087813))

(declare-fun m!1087815 () Bool)

(assert (=> start!99792 m!1087815))

(declare-fun m!1087817 () Bool)

(assert (=> start!99792 m!1087817))

(declare-fun m!1087819 () Bool)

(assert (=> b!1179524 m!1087819))

(assert (=> b!1179521 m!1087783))

(declare-fun m!1087821 () Bool)

(assert (=> b!1179521 m!1087821))

(declare-fun m!1087823 () Bool)

(assert (=> b!1179521 m!1087823))

(assert (=> b!1179521 m!1087823))

(declare-fun m!1087825 () Bool)

(assert (=> b!1179521 m!1087825))

(assert (=> b!1179522 m!1087783))

(check-sat (not b!1179529) (not b!1179536) (not b!1179538) (not b!1179530) (not mapNonEmpty!46325) b_and!41141 tp_is_empty!29665 (not b!1179523) (not b_lambda!20273) (not b!1179526) (not start!99792) (not b!1179537) (not b_next!25135) (not b!1179531) (not b!1179533) (not b!1179525) (not b!1179524) (not b!1179521) (not b!1179532))
(check-sat b_and!41141 (not b_next!25135))
