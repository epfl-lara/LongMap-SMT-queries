; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97954 () Bool)

(assert start!97954)

(declare-fun b_free!23655 () Bool)

(declare-fun b_next!23655 () Bool)

(assert (=> start!97954 (= b_free!23655 (not b_next!23655))))

(declare-fun tp!83669 () Bool)

(declare-fun b_and!38093 () Bool)

(assert (=> start!97954 (= tp!83669 b_and!38093)))

(declare-fun b!1122741 () Bool)

(declare-fun e!639203 () Bool)

(declare-fun tp_is_empty!28185 () Bool)

(assert (=> b!1122741 (= e!639203 tp_is_empty!28185)))

(declare-fun b!1122742 () Bool)

(declare-fun e!639200 () Bool)

(declare-fun e!639207 () Bool)

(assert (=> b!1122742 (= e!639200 e!639207)))

(declare-fun res!750090 () Bool)

(assert (=> b!1122742 (=> res!750090 e!639207)))

(declare-datatypes ((array!73245 0))(
  ( (array!73246 (arr!35275 (Array (_ BitVec 32) (_ BitVec 64))) (size!35811 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73245)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1122742 (= res!750090 (not (= (select (arr!35275 _keys!1208) from!1455) k0!934)))))

(declare-fun e!639201 () Bool)

(assert (=> b!1122742 e!639201))

(declare-fun c!109473 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122742 (= c!109473 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!42707 0))(
  ( (V!42708 (val!14149 Int)) )
))
(declare-datatypes ((ValueCell!13383 0))(
  ( (ValueCellFull!13383 (v!16782 V!42707)) (EmptyCell!13383) )
))
(declare-datatypes ((array!73247 0))(
  ( (array!73248 (arr!35276 (Array (_ BitVec 32) ValueCell!13383)) (size!35812 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73247)

(declare-fun minValue!944 () V!42707)

(declare-datatypes ((Unit!36824 0))(
  ( (Unit!36825) )
))
(declare-fun lt!498832 () Unit!36824)

(declare-fun zeroValue!944 () V!42707)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!339 (array!73245 array!73247 (_ BitVec 32) (_ BitVec 32) V!42707 V!42707 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36824)

(assert (=> b!1122742 (= lt!498832 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122743 () Bool)

(declare-fun res!750095 () Bool)

(declare-fun e!639199 () Bool)

(assert (=> b!1122743 (=> (not res!750095) (not e!639199))))

(declare-datatypes ((List!24548 0))(
  ( (Nil!24545) (Cons!24544 (h!25753 (_ BitVec 64)) (t!35195 List!24548)) )
))
(declare-fun arrayNoDuplicates!0 (array!73245 (_ BitVec 32) List!24548) Bool)

(assert (=> b!1122743 (= res!750095 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24545))))

(declare-fun lt!498828 () array!73247)

(declare-datatypes ((tuple2!17768 0))(
  ( (tuple2!17769 (_1!8895 (_ BitVec 64)) (_2!8895 V!42707)) )
))
(declare-datatypes ((List!24549 0))(
  ( (Nil!24546) (Cons!24545 (h!25754 tuple2!17768) (t!35196 List!24549)) )
))
(declare-datatypes ((ListLongMap!15737 0))(
  ( (ListLongMap!15738 (toList!7884 List!24549)) )
))
(declare-fun call!47247 () ListLongMap!15737)

(declare-fun bm!47244 () Bool)

(declare-fun lt!498833 () array!73245)

(declare-fun getCurrentListMapNoExtraKeys!4373 (array!73245 array!73247 (_ BitVec 32) (_ BitVec 32) V!42707 V!42707 (_ BitVec 32) Int) ListLongMap!15737)

(assert (=> bm!47244 (= call!47247 (getCurrentListMapNoExtraKeys!4373 lt!498833 lt!498828 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122744 () Bool)

(declare-fun res!750094 () Bool)

(assert (=> b!1122744 (=> (not res!750094) (not e!639199))))

(assert (=> b!1122744 (= res!750094 (= (select (arr!35275 _keys!1208) i!673) k0!934))))

(declare-fun call!47248 () ListLongMap!15737)

(declare-fun bm!47245 () Bool)

(assert (=> bm!47245 (= call!47248 (getCurrentListMapNoExtraKeys!4373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122745 () Bool)

(declare-fun e!639204 () Bool)

(declare-fun mapRes!44095 () Bool)

(assert (=> b!1122745 (= e!639204 (and e!639203 mapRes!44095))))

(declare-fun condMapEmpty!44095 () Bool)

(declare-fun mapDefault!44095 () ValueCell!13383)

(assert (=> b!1122745 (= condMapEmpty!44095 (= (arr!35276 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13383)) mapDefault!44095)))))

(declare-fun b!1122746 () Bool)

(declare-fun e!639206 () Bool)

(declare-fun e!639198 () Bool)

(assert (=> b!1122746 (= e!639206 (not e!639198))))

(declare-fun res!750093 () Bool)

(assert (=> b!1122746 (=> res!750093 e!639198)))

(assert (=> b!1122746 (= res!750093 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122746 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498831 () Unit!36824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73245 (_ BitVec 64) (_ BitVec 32)) Unit!36824)

(assert (=> b!1122746 (= lt!498831 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122747 () Bool)

(declare-fun res!750096 () Bool)

(assert (=> b!1122747 (=> (not res!750096) (not e!639199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122747 (= res!750096 (validKeyInArray!0 k0!934))))

(declare-fun b!1122749 () Bool)

(assert (=> b!1122749 (= e!639198 e!639200)))

(declare-fun res!750086 () Bool)

(assert (=> b!1122749 (=> res!750086 e!639200)))

(assert (=> b!1122749 (= res!750086 (not (= from!1455 i!673)))))

(declare-fun lt!498829 () ListLongMap!15737)

(assert (=> b!1122749 (= lt!498829 (getCurrentListMapNoExtraKeys!4373 lt!498833 lt!498828 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2469 (Int (_ BitVec 64)) V!42707)

(assert (=> b!1122749 (= lt!498828 (array!73248 (store (arr!35276 _values!996) i!673 (ValueCellFull!13383 (dynLambda!2469 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35812 _values!996)))))

(declare-fun lt!498827 () ListLongMap!15737)

(assert (=> b!1122749 (= lt!498827 (getCurrentListMapNoExtraKeys!4373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44095 () Bool)

(assert (=> mapIsEmpty!44095 mapRes!44095))

(declare-fun b!1122750 () Bool)

(declare-fun res!750087 () Bool)

(assert (=> b!1122750 (=> (not res!750087) (not e!639199))))

(assert (=> b!1122750 (= res!750087 (and (= (size!35812 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35811 _keys!1208) (size!35812 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1122751 () Bool)

(assert (=> b!1122751 (= e!639199 e!639206)))

(declare-fun res!750088 () Bool)

(assert (=> b!1122751 (=> (not res!750088) (not e!639206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73245 (_ BitVec 32)) Bool)

(assert (=> b!1122751 (= res!750088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498833 mask!1564))))

(assert (=> b!1122751 (= lt!498833 (array!73246 (store (arr!35275 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35811 _keys!1208)))))

(declare-fun b!1122752 () Bool)

(declare-fun res!750085 () Bool)

(assert (=> b!1122752 (=> (not res!750085) (not e!639199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122752 (= res!750085 (validMask!0 mask!1564))))

(declare-fun b!1122753 () Bool)

(declare-fun e!639202 () Bool)

(assert (=> b!1122753 (= e!639202 tp_is_empty!28185)))

(declare-fun res!750092 () Bool)

(assert (=> start!97954 (=> (not res!750092) (not e!639199))))

(assert (=> start!97954 (= res!750092 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35811 _keys!1208))))))

(assert (=> start!97954 e!639199))

(assert (=> start!97954 tp_is_empty!28185))

(declare-fun array_inv!27084 (array!73245) Bool)

(assert (=> start!97954 (array_inv!27084 _keys!1208)))

(assert (=> start!97954 true))

(assert (=> start!97954 tp!83669))

(declare-fun array_inv!27085 (array!73247) Bool)

(assert (=> start!97954 (and (array_inv!27085 _values!996) e!639204)))

(declare-fun b!1122748 () Bool)

(assert (=> b!1122748 (= e!639207 true)))

(declare-fun lt!498830 () Bool)

(declare-fun contains!6426 (ListLongMap!15737 (_ BitVec 64)) Bool)

(assert (=> b!1122748 (= lt!498830 (contains!6426 (getCurrentListMapNoExtraKeys!4373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1122754 () Bool)

(declare-fun res!750091 () Bool)

(assert (=> b!1122754 (=> (not res!750091) (not e!639206))))

(assert (=> b!1122754 (= res!750091 (arrayNoDuplicates!0 lt!498833 #b00000000000000000000000000000000 Nil!24545))))

(declare-fun b!1122755 () Bool)

(assert (=> b!1122755 (= e!639201 (= call!47247 call!47248))))

(declare-fun b!1122756 () Bool)

(declare-fun res!750089 () Bool)

(assert (=> b!1122756 (=> (not res!750089) (not e!639199))))

(assert (=> b!1122756 (= res!750089 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35811 _keys!1208))))))

(declare-fun mapNonEmpty!44095 () Bool)

(declare-fun tp!83668 () Bool)

(assert (=> mapNonEmpty!44095 (= mapRes!44095 (and tp!83668 e!639202))))

(declare-fun mapKey!44095 () (_ BitVec 32))

(declare-fun mapRest!44095 () (Array (_ BitVec 32) ValueCell!13383))

(declare-fun mapValue!44095 () ValueCell!13383)

(assert (=> mapNonEmpty!44095 (= (arr!35276 _values!996) (store mapRest!44095 mapKey!44095 mapValue!44095))))

(declare-fun b!1122757 () Bool)

(declare-fun -!1090 (ListLongMap!15737 (_ BitVec 64)) ListLongMap!15737)

(assert (=> b!1122757 (= e!639201 (= call!47247 (-!1090 call!47248 k0!934)))))

(declare-fun b!1122758 () Bool)

(declare-fun res!750097 () Bool)

(assert (=> b!1122758 (=> (not res!750097) (not e!639199))))

(assert (=> b!1122758 (= res!750097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97954 res!750092) b!1122752))

(assert (= (and b!1122752 res!750085) b!1122750))

(assert (= (and b!1122750 res!750087) b!1122758))

(assert (= (and b!1122758 res!750097) b!1122743))

(assert (= (and b!1122743 res!750095) b!1122756))

(assert (= (and b!1122756 res!750089) b!1122747))

(assert (= (and b!1122747 res!750096) b!1122744))

(assert (= (and b!1122744 res!750094) b!1122751))

(assert (= (and b!1122751 res!750088) b!1122754))

(assert (= (and b!1122754 res!750091) b!1122746))

(assert (= (and b!1122746 (not res!750093)) b!1122749))

(assert (= (and b!1122749 (not res!750086)) b!1122742))

(assert (= (and b!1122742 c!109473) b!1122757))

(assert (= (and b!1122742 (not c!109473)) b!1122755))

(assert (= (or b!1122757 b!1122755) bm!47244))

(assert (= (or b!1122757 b!1122755) bm!47245))

(assert (= (and b!1122742 (not res!750090)) b!1122748))

(assert (= (and b!1122745 condMapEmpty!44095) mapIsEmpty!44095))

(assert (= (and b!1122745 (not condMapEmpty!44095)) mapNonEmpty!44095))

(get-info :version)

(assert (= (and mapNonEmpty!44095 ((_ is ValueCellFull!13383) mapValue!44095)) b!1122753))

(assert (= (and b!1122745 ((_ is ValueCellFull!13383) mapDefault!44095)) b!1122741))

(assert (= start!97954 b!1122745))

(declare-fun b_lambda!18625 () Bool)

(assert (=> (not b_lambda!18625) (not b!1122749)))

(declare-fun t!35194 () Bool)

(declare-fun tb!8467 () Bool)

(assert (=> (and start!97954 (= defaultEntry!1004 defaultEntry!1004) t!35194) tb!8467))

(declare-fun result!17495 () Bool)

(assert (=> tb!8467 (= result!17495 tp_is_empty!28185)))

(assert (=> b!1122749 t!35194))

(declare-fun b_and!38095 () Bool)

(assert (= b_and!38093 (and (=> t!35194 result!17495) b_and!38095)))

(declare-fun m!1037339 () Bool)

(assert (=> b!1122751 m!1037339))

(declare-fun m!1037341 () Bool)

(assert (=> b!1122751 m!1037341))

(declare-fun m!1037343 () Bool)

(assert (=> b!1122754 m!1037343))

(declare-fun m!1037345 () Bool)

(assert (=> bm!47244 m!1037345))

(declare-fun m!1037347 () Bool)

(assert (=> b!1122758 m!1037347))

(declare-fun m!1037349 () Bool)

(assert (=> b!1122749 m!1037349))

(declare-fun m!1037351 () Bool)

(assert (=> b!1122749 m!1037351))

(declare-fun m!1037353 () Bool)

(assert (=> b!1122749 m!1037353))

(declare-fun m!1037355 () Bool)

(assert (=> b!1122749 m!1037355))

(declare-fun m!1037357 () Bool)

(assert (=> b!1122743 m!1037357))

(declare-fun m!1037359 () Bool)

(assert (=> b!1122752 m!1037359))

(declare-fun m!1037361 () Bool)

(assert (=> b!1122757 m!1037361))

(declare-fun m!1037363 () Bool)

(assert (=> b!1122747 m!1037363))

(declare-fun m!1037365 () Bool)

(assert (=> bm!47245 m!1037365))

(declare-fun m!1037367 () Bool)

(assert (=> start!97954 m!1037367))

(declare-fun m!1037369 () Bool)

(assert (=> start!97954 m!1037369))

(declare-fun m!1037371 () Bool)

(assert (=> b!1122746 m!1037371))

(declare-fun m!1037373 () Bool)

(assert (=> b!1122746 m!1037373))

(declare-fun m!1037375 () Bool)

(assert (=> b!1122744 m!1037375))

(assert (=> b!1122748 m!1037365))

(assert (=> b!1122748 m!1037365))

(declare-fun m!1037377 () Bool)

(assert (=> b!1122748 m!1037377))

(declare-fun m!1037379 () Bool)

(assert (=> mapNonEmpty!44095 m!1037379))

(declare-fun m!1037381 () Bool)

(assert (=> b!1122742 m!1037381))

(declare-fun m!1037383 () Bool)

(assert (=> b!1122742 m!1037383))

(check-sat (not b!1122743) (not b!1122747) b_and!38095 (not bm!47245) (not b!1122757) (not b!1122748) (not b!1122751) (not b!1122742) (not mapNonEmpty!44095) (not bm!47244) (not b!1122746) (not b!1122754) (not b!1122752) (not b_lambda!18625) (not b!1122758) (not b!1122749) (not b_next!23655) (not start!97954) tp_is_empty!28185)
(check-sat b_and!38095 (not b_next!23655))
