; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97324 () Bool)

(assert start!97324)

(declare-fun b_free!23295 () Bool)

(declare-fun b_next!23295 () Bool)

(assert (=> start!97324 (= b_free!23295 (not b_next!23295))))

(declare-fun tp!82184 () Bool)

(declare-fun b_and!37423 () Bool)

(assert (=> start!97324 (= tp!82184 b_and!37423)))

(declare-fun b!1108757 () Bool)

(declare-fun e!632487 () Bool)

(declare-datatypes ((V!41867 0))(
  ( (V!41868 (val!13834 Int)) )
))
(declare-datatypes ((tuple2!17482 0))(
  ( (tuple2!17483 (_1!8752 (_ BitVec 64)) (_2!8752 V!41867)) )
))
(declare-datatypes ((List!24166 0))(
  ( (Nil!24163) (Cons!24162 (h!25371 tuple2!17482) (t!34507 List!24166)) )
))
(declare-datatypes ((ListLongMap!15451 0))(
  ( (ListLongMap!15452 (toList!7741 List!24166)) )
))
(declare-fun call!46581 () ListLongMap!15451)

(declare-fun call!46582 () ListLongMap!15451)

(assert (=> b!1108757 (= e!632487 (= call!46581 call!46582))))

(declare-fun b!1108758 () Bool)

(declare-fun res!739932 () Bool)

(declare-fun e!632486 () Bool)

(assert (=> b!1108758 (=> (not res!739932) (not e!632486))))

(declare-datatypes ((array!72027 0))(
  ( (array!72028 (arr!34666 (Array (_ BitVec 32) (_ BitVec 64))) (size!35202 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72027)

(declare-datatypes ((List!24167 0))(
  ( (Nil!24164) (Cons!24163 (h!25372 (_ BitVec 64)) (t!34508 List!24167)) )
))
(declare-fun arrayNoDuplicates!0 (array!72027 (_ BitVec 32) List!24167) Bool)

(assert (=> b!1108758 (= res!739932 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24164))))

(declare-fun b!1108759 () Bool)

(declare-fun res!739942 () Bool)

(assert (=> b!1108759 (=> (not res!739942) (not e!632486))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108759 (= res!739942 (validKeyInArray!0 k0!934))))

(declare-fun b!1108760 () Bool)

(declare-fun res!739937 () Bool)

(assert (=> b!1108760 (=> (not res!739937) (not e!632486))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108760 (= res!739937 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35202 _keys!1208))))))

(declare-fun res!739938 () Bool)

(assert (=> start!97324 (=> (not res!739938) (not e!632486))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97324 (= res!739938 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35202 _keys!1208))))))

(assert (=> start!97324 e!632486))

(declare-fun tp_is_empty!27555 () Bool)

(assert (=> start!97324 tp_is_empty!27555))

(declare-fun array_inv!26678 (array!72027) Bool)

(assert (=> start!97324 (array_inv!26678 _keys!1208)))

(assert (=> start!97324 true))

(assert (=> start!97324 tp!82184))

(declare-datatypes ((ValueCell!13068 0))(
  ( (ValueCellFull!13068 (v!16467 V!41867)) (EmptyCell!13068) )
))
(declare-datatypes ((array!72029 0))(
  ( (array!72030 (arr!34667 (Array (_ BitVec 32) ValueCell!13068)) (size!35203 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72029)

(declare-fun e!632485 () Bool)

(declare-fun array_inv!26679 (array!72029) Bool)

(assert (=> start!97324 (and (array_inv!26679 _values!996) e!632485)))

(declare-fun mapNonEmpty!43150 () Bool)

(declare-fun mapRes!43150 () Bool)

(declare-fun tp!82183 () Bool)

(declare-fun e!632482 () Bool)

(assert (=> mapNonEmpty!43150 (= mapRes!43150 (and tp!82183 e!632482))))

(declare-fun mapValue!43150 () ValueCell!13068)

(declare-fun mapRest!43150 () (Array (_ BitVec 32) ValueCell!13068))

(declare-fun mapKey!43150 () (_ BitVec 32))

(assert (=> mapNonEmpty!43150 (= (arr!34667 _values!996) (store mapRest!43150 mapKey!43150 mapValue!43150))))

(declare-fun b!1108761 () Bool)

(declare-fun e!632483 () Bool)

(assert (=> b!1108761 (= e!632483 true)))

(assert (=> b!1108761 e!632487))

(declare-fun c!109128 () Bool)

(assert (=> b!1108761 (= c!109128 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41867)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41867)

(declare-datatypes ((Unit!36388 0))(
  ( (Unit!36389) )
))
(declare-fun lt!495865 () Unit!36388)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!266 (array!72027 array!72029 (_ BitVec 32) (_ BitVec 32) V!41867 V!41867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36388)

(assert (=> b!1108761 (= lt!495865 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!266 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108762 () Bool)

(declare-fun e!632481 () Bool)

(assert (=> b!1108762 (= e!632486 e!632481)))

(declare-fun res!739936 () Bool)

(assert (=> b!1108762 (=> (not res!739936) (not e!632481))))

(declare-fun lt!495866 () array!72027)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72027 (_ BitVec 32)) Bool)

(assert (=> b!1108762 (= res!739936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495866 mask!1564))))

(assert (=> b!1108762 (= lt!495866 (array!72028 (store (arr!34666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35202 _keys!1208)))))

(declare-fun b!1108763 () Bool)

(declare-fun e!632480 () Bool)

(assert (=> b!1108763 (= e!632485 (and e!632480 mapRes!43150))))

(declare-fun condMapEmpty!43150 () Bool)

(declare-fun mapDefault!43150 () ValueCell!13068)

(assert (=> b!1108763 (= condMapEmpty!43150 (= (arr!34667 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13068)) mapDefault!43150)))))

(declare-fun b!1108764 () Bool)

(declare-fun res!739940 () Bool)

(assert (=> b!1108764 (=> (not res!739940) (not e!632486))))

(assert (=> b!1108764 (= res!739940 (= (select (arr!34666 _keys!1208) i!673) k0!934))))

(declare-fun b!1108765 () Bool)

(declare-fun res!739933 () Bool)

(assert (=> b!1108765 (=> (not res!739933) (not e!632486))))

(assert (=> b!1108765 (= res!739933 (and (= (size!35203 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35202 _keys!1208) (size!35203 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108766 () Bool)

(declare-fun res!739935 () Bool)

(assert (=> b!1108766 (=> (not res!739935) (not e!632486))))

(assert (=> b!1108766 (= res!739935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!46578 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4236 (array!72027 array!72029 (_ BitVec 32) (_ BitVec 32) V!41867 V!41867 (_ BitVec 32) Int) ListLongMap!15451)

(declare-fun dynLambda!2368 (Int (_ BitVec 64)) V!41867)

(assert (=> bm!46578 (= call!46581 (getCurrentListMapNoExtraKeys!4236 lt!495866 (array!72030 (store (arr!34667 _values!996) i!673 (ValueCellFull!13068 (dynLambda!2368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35203 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43150 () Bool)

(assert (=> mapIsEmpty!43150 mapRes!43150))

(declare-fun b!1108767 () Bool)

(assert (=> b!1108767 (= e!632482 tp_is_empty!27555)))

(declare-fun b!1108768 () Bool)

(assert (=> b!1108768 (= e!632480 tp_is_empty!27555)))

(declare-fun b!1108769 () Bool)

(declare-fun -!1020 (ListLongMap!15451 (_ BitVec 64)) ListLongMap!15451)

(assert (=> b!1108769 (= e!632487 (= call!46581 (-!1020 call!46582 k0!934)))))

(declare-fun b!1108770 () Bool)

(assert (=> b!1108770 (= e!632481 (not e!632483))))

(declare-fun res!739934 () Bool)

(assert (=> b!1108770 (=> res!739934 e!632483)))

(assert (=> b!1108770 (= res!739934 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35202 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108770 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495864 () Unit!36388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72027 (_ BitVec 64) (_ BitVec 32)) Unit!36388)

(assert (=> b!1108770 (= lt!495864 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!46579 () Bool)

(assert (=> bm!46579 (= call!46582 (getCurrentListMapNoExtraKeys!4236 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108771 () Bool)

(declare-fun res!739941 () Bool)

(assert (=> b!1108771 (=> (not res!739941) (not e!632486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108771 (= res!739941 (validMask!0 mask!1564))))

(declare-fun b!1108772 () Bool)

(declare-fun res!739939 () Bool)

(assert (=> b!1108772 (=> (not res!739939) (not e!632481))))

(assert (=> b!1108772 (= res!739939 (arrayNoDuplicates!0 lt!495866 #b00000000000000000000000000000000 Nil!24164))))

(assert (= (and start!97324 res!739938) b!1108771))

(assert (= (and b!1108771 res!739941) b!1108765))

(assert (= (and b!1108765 res!739933) b!1108766))

(assert (= (and b!1108766 res!739935) b!1108758))

(assert (= (and b!1108758 res!739932) b!1108760))

(assert (= (and b!1108760 res!739937) b!1108759))

(assert (= (and b!1108759 res!739942) b!1108764))

(assert (= (and b!1108764 res!739940) b!1108762))

(assert (= (and b!1108762 res!739936) b!1108772))

(assert (= (and b!1108772 res!739939) b!1108770))

(assert (= (and b!1108770 (not res!739934)) b!1108761))

(assert (= (and b!1108761 c!109128) b!1108769))

(assert (= (and b!1108761 (not c!109128)) b!1108757))

(assert (= (or b!1108769 b!1108757) bm!46578))

(assert (= (or b!1108769 b!1108757) bm!46579))

(assert (= (and b!1108763 condMapEmpty!43150) mapIsEmpty!43150))

(assert (= (and b!1108763 (not condMapEmpty!43150)) mapNonEmpty!43150))

(get-info :version)

(assert (= (and mapNonEmpty!43150 ((_ is ValueCellFull!13068) mapValue!43150)) b!1108767))

(assert (= (and b!1108763 ((_ is ValueCellFull!13068) mapDefault!43150)) b!1108768))

(assert (= start!97324 b!1108763))

(declare-fun b_lambda!18315 () Bool)

(assert (=> (not b_lambda!18315) (not bm!46578)))

(declare-fun t!34506 () Bool)

(declare-fun tb!8161 () Bool)

(assert (=> (and start!97324 (= defaultEntry!1004 defaultEntry!1004) t!34506) tb!8161))

(declare-fun result!16883 () Bool)

(assert (=> tb!8161 (= result!16883 tp_is_empty!27555)))

(assert (=> bm!46578 t!34506))

(declare-fun b_and!37425 () Bool)

(assert (= b_and!37423 (and (=> t!34506 result!16883) b_and!37425)))

(declare-fun m!1027207 () Bool)

(assert (=> b!1108770 m!1027207))

(declare-fun m!1027209 () Bool)

(assert (=> b!1108770 m!1027209))

(declare-fun m!1027211 () Bool)

(assert (=> b!1108761 m!1027211))

(declare-fun m!1027213 () Bool)

(assert (=> b!1108764 m!1027213))

(declare-fun m!1027215 () Bool)

(assert (=> mapNonEmpty!43150 m!1027215))

(declare-fun m!1027217 () Bool)

(assert (=> b!1108769 m!1027217))

(declare-fun m!1027219 () Bool)

(assert (=> b!1108771 m!1027219))

(declare-fun m!1027221 () Bool)

(assert (=> b!1108766 m!1027221))

(declare-fun m!1027223 () Bool)

(assert (=> b!1108762 m!1027223))

(declare-fun m!1027225 () Bool)

(assert (=> b!1108762 m!1027225))

(declare-fun m!1027227 () Bool)

(assert (=> b!1108759 m!1027227))

(declare-fun m!1027229 () Bool)

(assert (=> start!97324 m!1027229))

(declare-fun m!1027231 () Bool)

(assert (=> start!97324 m!1027231))

(declare-fun m!1027233 () Bool)

(assert (=> b!1108758 m!1027233))

(declare-fun m!1027235 () Bool)

(assert (=> bm!46579 m!1027235))

(declare-fun m!1027237 () Bool)

(assert (=> bm!46578 m!1027237))

(declare-fun m!1027239 () Bool)

(assert (=> bm!46578 m!1027239))

(declare-fun m!1027241 () Bool)

(assert (=> bm!46578 m!1027241))

(declare-fun m!1027243 () Bool)

(assert (=> b!1108772 m!1027243))

(check-sat (not b!1108759) (not bm!46579) (not start!97324) (not b!1108766) (not b_next!23295) (not b!1108761) (not b!1108770) tp_is_empty!27555 (not b!1108769) (not b!1108772) (not b!1108762) (not b!1108758) (not mapNonEmpty!43150) b_and!37425 (not b!1108771) (not bm!46578) (not b_lambda!18315))
(check-sat b_and!37425 (not b_next!23295))
