; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97280 () Bool)

(assert start!97280)

(declare-fun b_free!23257 () Bool)

(declare-fun b_next!23257 () Bool)

(assert (=> start!97280 (= b_free!23257 (not b_next!23257))))

(declare-fun tp!82069 () Bool)

(declare-fun b_and!37323 () Bool)

(assert (=> start!97280 (= tp!82069 b_and!37323)))

(declare-fun mapIsEmpty!43093 () Bool)

(declare-fun mapRes!43093 () Bool)

(assert (=> mapIsEmpty!43093 mapRes!43093))

(declare-fun mapNonEmpty!43093 () Bool)

(declare-fun tp!82070 () Bool)

(declare-fun e!631942 () Bool)

(assert (=> mapNonEmpty!43093 (= mapRes!43093 (and tp!82070 e!631942))))

(declare-datatypes ((V!41817 0))(
  ( (V!41818 (val!13815 Int)) )
))
(declare-datatypes ((ValueCell!13049 0))(
  ( (ValueCellFull!13049 (v!16447 V!41817)) (EmptyCell!13049) )
))
(declare-fun mapValue!43093 () ValueCell!13049)

(declare-fun mapRest!43093 () (Array (_ BitVec 32) ValueCell!13049))

(declare-fun mapKey!43093 () (_ BitVec 32))

(declare-datatypes ((array!71852 0))(
  ( (array!71853 (arr!34579 (Array (_ BitVec 32) ValueCell!13049)) (size!35117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71852)

(assert (=> mapNonEmpty!43093 (= (arr!34579 _values!996) (store mapRest!43093 mapKey!43093 mapValue!43093))))

(declare-fun b!1107674 () Bool)

(declare-fun e!631947 () Bool)

(declare-fun e!631949 () Bool)

(assert (=> b!1107674 (= e!631947 e!631949)))

(declare-fun res!739246 () Bool)

(assert (=> b!1107674 (=> (not res!739246) (not e!631949))))

(declare-datatypes ((array!71854 0))(
  ( (array!71855 (arr!34580 (Array (_ BitVec 32) (_ BitVec 64))) (size!35118 (_ BitVec 32))) )
))
(declare-fun lt!495494 () array!71854)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71854 (_ BitVec 32)) Bool)

(assert (=> b!1107674 (= res!739246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495494 mask!1564))))

(declare-fun _keys!1208 () array!71854)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107674 (= lt!495494 (array!71855 (store (arr!34580 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35118 _keys!1208)))))

(declare-fun b!1107675 () Bool)

(declare-fun res!739236 () Bool)

(assert (=> b!1107675 (=> (not res!739236) (not e!631947))))

(assert (=> b!1107675 (= res!739236 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35118 _keys!1208))))))

(declare-fun e!631950 () Bool)

(declare-datatypes ((tuple2!17506 0))(
  ( (tuple2!17507 (_1!8764 (_ BitVec 64)) (_2!8764 V!41817)) )
))
(declare-datatypes ((List!24165 0))(
  ( (Nil!24162) (Cons!24161 (h!25370 tuple2!17506) (t!34459 List!24165)) )
))
(declare-datatypes ((ListLongMap!15475 0))(
  ( (ListLongMap!15476 (toList!7753 List!24165)) )
))
(declare-fun call!46445 () ListLongMap!15475)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!46444 () ListLongMap!15475)

(declare-fun b!1107676 () Bool)

(declare-fun -!976 (ListLongMap!15475 (_ BitVec 64)) ListLongMap!15475)

(assert (=> b!1107676 (= e!631950 (= call!46445 (-!976 call!46444 k0!934)))))

(declare-fun b!1107677 () Bool)

(declare-fun res!739241 () Bool)

(assert (=> b!1107677 (=> (not res!739241) (not e!631949))))

(declare-datatypes ((List!24166 0))(
  ( (Nil!24163) (Cons!24162 (h!25371 (_ BitVec 64)) (t!34460 List!24166)) )
))
(declare-fun arrayNoDuplicates!0 (array!71854 (_ BitVec 32) List!24166) Bool)

(assert (=> b!1107677 (= res!739241 (arrayNoDuplicates!0 lt!495494 #b00000000000000000000000000000000 Nil!24163))))

(declare-fun b!1107678 () Bool)

(declare-fun res!739243 () Bool)

(assert (=> b!1107678 (=> (not res!739243) (not e!631947))))

(assert (=> b!1107678 (= res!739243 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24163))))

(declare-fun b!1107679 () Bool)

(declare-fun e!631946 () Bool)

(assert (=> b!1107679 (= e!631946 true)))

(assert (=> b!1107679 e!631950))

(declare-fun c!109044 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1107679 (= c!109044 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41817)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36169 0))(
  ( (Unit!36170) )
))
(declare-fun lt!495495 () Unit!36169)

(declare-fun minValue!944 () V!41817)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!250 (array!71854 array!71852 (_ BitVec 32) (_ BitVec 32) V!41817 V!41817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36169)

(assert (=> b!1107679 (= lt!495495 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!250 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107680 () Bool)

(declare-fun res!739238 () Bool)

(assert (=> b!1107680 (=> (not res!739238) (not e!631947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107680 (= res!739238 (validKeyInArray!0 k0!934))))

(declare-fun b!1107682 () Bool)

(declare-fun res!739240 () Bool)

(assert (=> b!1107682 (=> (not res!739240) (not e!631947))))

(assert (=> b!1107682 (= res!739240 (= (select (arr!34580 _keys!1208) i!673) k0!934))))

(declare-fun b!1107683 () Bool)

(assert (=> b!1107683 (= e!631950 (= call!46444 call!46445))))

(declare-fun b!1107684 () Bool)

(declare-fun res!739242 () Bool)

(assert (=> b!1107684 (=> (not res!739242) (not e!631947))))

(assert (=> b!1107684 (= res!739242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107685 () Bool)

(declare-fun e!631948 () array!71852)

(assert (=> b!1107685 (= e!631948 _values!996)))

(declare-fun b!1107686 () Bool)

(declare-fun e!631943 () Bool)

(declare-fun e!631945 () Bool)

(assert (=> b!1107686 (= e!631943 (and e!631945 mapRes!43093))))

(declare-fun condMapEmpty!43093 () Bool)

(declare-fun mapDefault!43093 () ValueCell!13049)

(assert (=> b!1107686 (= condMapEmpty!43093 (= (arr!34579 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13049)) mapDefault!43093)))))

(declare-fun b!1107687 () Bool)

(declare-fun e!631941 () array!71852)

(assert (=> b!1107687 (= e!631941 _values!996)))

(declare-fun b!1107688 () Bool)

(declare-fun res!739237 () Bool)

(assert (=> b!1107688 (=> (not res!739237) (not e!631947))))

(assert (=> b!1107688 (= res!739237 (and (= (size!35117 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35118 _keys!1208) (size!35117 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107689 () Bool)

(assert (=> b!1107689 (= e!631949 (not e!631946))))

(declare-fun res!739239 () Bool)

(assert (=> b!1107689 (=> res!739239 e!631946)))

(assert (=> b!1107689 (= res!739239 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35118 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107689 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495493 () Unit!36169)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71854 (_ BitVec 64) (_ BitVec 32)) Unit!36169)

(assert (=> b!1107689 (= lt!495493 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107690 () Bool)

(declare-fun tp_is_empty!27517 () Bool)

(assert (=> b!1107690 (= e!631942 tp_is_empty!27517)))

(declare-fun bm!46441 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4270 (array!71854 array!71852 (_ BitVec 32) (_ BitVec 32) V!41817 V!41817 (_ BitVec 32) Int) ListLongMap!15475)

(assert (=> bm!46441 (= call!46445 (getCurrentListMapNoExtraKeys!4270 (ite c!109044 lt!495494 _keys!1208) e!631941 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!109043 () Bool)

(assert (=> bm!46441 (= c!109043 c!109044)))

(declare-fun b!1107691 () Bool)

(assert (=> b!1107691 (= e!631945 tp_is_empty!27517)))

(declare-fun bm!46442 () Bool)

(assert (=> bm!46442 (= call!46444 (getCurrentListMapNoExtraKeys!4270 (ite c!109044 _keys!1208 lt!495494) e!631948 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!109042 () Bool)

(assert (=> bm!46442 (= c!109042 c!109044)))

(declare-fun b!1107692 () Bool)

(declare-fun dynLambda!2338 (Int (_ BitVec 64)) V!41817)

(assert (=> b!1107692 (= e!631941 (array!71853 (store (arr!34579 _values!996) i!673 (ValueCellFull!13049 (dynLambda!2338 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35117 _values!996)))))

(declare-fun b!1107693 () Bool)

(declare-fun res!739245 () Bool)

(assert (=> b!1107693 (=> (not res!739245) (not e!631947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107693 (= res!739245 (validMask!0 mask!1564))))

(declare-fun res!739244 () Bool)

(assert (=> start!97280 (=> (not res!739244) (not e!631947))))

(assert (=> start!97280 (= res!739244 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35118 _keys!1208))))))

(assert (=> start!97280 e!631947))

(assert (=> start!97280 tp_is_empty!27517))

(declare-fun array_inv!26664 (array!71854) Bool)

(assert (=> start!97280 (array_inv!26664 _keys!1208)))

(assert (=> start!97280 true))

(assert (=> start!97280 tp!82069))

(declare-fun array_inv!26665 (array!71852) Bool)

(assert (=> start!97280 (and (array_inv!26665 _values!996) e!631943)))

(declare-fun b!1107681 () Bool)

(assert (=> b!1107681 (= e!631948 (array!71853 (store (arr!34579 _values!996) i!673 (ValueCellFull!13049 (dynLambda!2338 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35117 _values!996)))))

(assert (= (and start!97280 res!739244) b!1107693))

(assert (= (and b!1107693 res!739245) b!1107688))

(assert (= (and b!1107688 res!739237) b!1107684))

(assert (= (and b!1107684 res!739242) b!1107678))

(assert (= (and b!1107678 res!739243) b!1107675))

(assert (= (and b!1107675 res!739236) b!1107680))

(assert (= (and b!1107680 res!739238) b!1107682))

(assert (= (and b!1107682 res!739240) b!1107674))

(assert (= (and b!1107674 res!739246) b!1107677))

(assert (= (and b!1107677 res!739241) b!1107689))

(assert (= (and b!1107689 (not res!739239)) b!1107679))

(assert (= (and b!1107679 c!109044) b!1107676))

(assert (= (and b!1107679 (not c!109044)) b!1107683))

(assert (= (or b!1107676 b!1107683) bm!46442))

(assert (= (and bm!46442 c!109042) b!1107685))

(assert (= (and bm!46442 (not c!109042)) b!1107681))

(assert (= (or b!1107676 b!1107683) bm!46441))

(assert (= (and bm!46441 c!109043) b!1107692))

(assert (= (and bm!46441 (not c!109043)) b!1107687))

(assert (= (and b!1107686 condMapEmpty!43093) mapIsEmpty!43093))

(assert (= (and b!1107686 (not condMapEmpty!43093)) mapNonEmpty!43093))

(get-info :version)

(assert (= (and mapNonEmpty!43093 ((_ is ValueCellFull!13049) mapValue!43093)) b!1107690))

(assert (= (and b!1107686 ((_ is ValueCellFull!13049) mapDefault!43093)) b!1107691))

(assert (= start!97280 b!1107686))

(declare-fun b_lambda!18257 () Bool)

(assert (=> (not b_lambda!18257) (not b!1107692)))

(declare-fun t!34458 () Bool)

(declare-fun tb!8115 () Bool)

(assert (=> (and start!97280 (= defaultEntry!1004 defaultEntry!1004) t!34458) tb!8115))

(declare-fun result!16799 () Bool)

(assert (=> tb!8115 (= result!16799 tp_is_empty!27517)))

(assert (=> b!1107692 t!34458))

(declare-fun b_and!37325 () Bool)

(assert (= b_and!37323 (and (=> t!34458 result!16799) b_and!37325)))

(declare-fun b_lambda!18259 () Bool)

(assert (=> (not b_lambda!18259) (not b!1107681)))

(assert (=> b!1107681 t!34458))

(declare-fun b_and!37327 () Bool)

(assert (= b_and!37325 (and (=> t!34458 result!16799) b_and!37327)))

(declare-fun m!1025859 () Bool)

(assert (=> b!1107678 m!1025859))

(declare-fun m!1025861 () Bool)

(assert (=> b!1107674 m!1025861))

(declare-fun m!1025863 () Bool)

(assert (=> b!1107674 m!1025863))

(declare-fun m!1025865 () Bool)

(assert (=> mapNonEmpty!43093 m!1025865))

(declare-fun m!1025867 () Bool)

(assert (=> bm!46442 m!1025867))

(declare-fun m!1025869 () Bool)

(assert (=> b!1107693 m!1025869))

(declare-fun m!1025871 () Bool)

(assert (=> b!1107689 m!1025871))

(declare-fun m!1025873 () Bool)

(assert (=> b!1107689 m!1025873))

(declare-fun m!1025875 () Bool)

(assert (=> b!1107677 m!1025875))

(declare-fun m!1025877 () Bool)

(assert (=> b!1107681 m!1025877))

(declare-fun m!1025879 () Bool)

(assert (=> b!1107681 m!1025879))

(declare-fun m!1025881 () Bool)

(assert (=> start!97280 m!1025881))

(declare-fun m!1025883 () Bool)

(assert (=> start!97280 m!1025883))

(declare-fun m!1025885 () Bool)

(assert (=> b!1107676 m!1025885))

(declare-fun m!1025887 () Bool)

(assert (=> b!1107679 m!1025887))

(declare-fun m!1025889 () Bool)

(assert (=> b!1107680 m!1025889))

(declare-fun m!1025891 () Bool)

(assert (=> b!1107684 m!1025891))

(assert (=> b!1107692 m!1025877))

(assert (=> b!1107692 m!1025879))

(declare-fun m!1025893 () Bool)

(assert (=> b!1107682 m!1025893))

(declare-fun m!1025895 () Bool)

(assert (=> bm!46441 m!1025895))

(check-sat (not b!1107677) (not b!1107689) (not b!1107676) (not b!1107693) (not bm!46442) (not b!1107680) (not b!1107679) (not start!97280) (not mapNonEmpty!43093) (not b!1107678) (not b_lambda!18257) (not b_next!23257) (not bm!46441) (not b!1107674) (not b!1107684) b_and!37327 tp_is_empty!27517 (not b_lambda!18259))
(check-sat b_and!37327 (not b_next!23257))
