; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99326 () Bool)

(assert start!99326)

(declare-fun b_free!24905 () Bool)

(declare-fun b_next!24905 () Bool)

(assert (=> start!99326 (= b_free!24905 (not b_next!24905))))

(declare-fun tp!87428 () Bool)

(declare-fun b_and!40677 () Bool)

(assert (=> start!99326 (= tp!87428 b_and!40677)))

(declare-fun mapNonEmpty!45980 () Bool)

(declare-fun mapRes!45980 () Bool)

(declare-fun tp!87429 () Bool)

(declare-fun e!665494 () Bool)

(assert (=> mapNonEmpty!45980 (= mapRes!45980 (and tp!87429 e!665494))))

(declare-datatypes ((V!44373 0))(
  ( (V!44374 (val!14774 Int)) )
))
(declare-datatypes ((ValueCell!14008 0))(
  ( (ValueCellFull!14008 (v!17412 V!44373)) (EmptyCell!14008) )
))
(declare-fun mapValue!45980 () ValueCell!14008)

(declare-fun mapRest!45980 () (Array (_ BitVec 32) ValueCell!14008))

(declare-fun mapKey!45980 () (_ BitVec 32))

(declare-datatypes ((array!75689 0))(
  ( (array!75690 (arr!36494 (Array (_ BitVec 32) ValueCell!14008)) (size!37030 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75689)

(assert (=> mapNonEmpty!45980 (= (arr!36494 _values!996) (store mapRest!45980 mapKey!45980 mapValue!45980))))

(declare-fun res!777098 () Bool)

(declare-fun e!665489 () Bool)

(assert (=> start!99326 (=> (not res!777098) (not e!665489))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75691 0))(
  ( (array!75692 (arr!36495 (Array (_ BitVec 32) (_ BitVec 64))) (size!37031 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75691)

(assert (=> start!99326 (= res!777098 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37031 _keys!1208))))))

(assert (=> start!99326 e!665489))

(declare-fun tp_is_empty!29435 () Bool)

(assert (=> start!99326 tp_is_empty!29435))

(declare-fun array_inv!27892 (array!75691) Bool)

(assert (=> start!99326 (array_inv!27892 _keys!1208)))

(assert (=> start!99326 true))

(assert (=> start!99326 tp!87428))

(declare-fun e!665492 () Bool)

(declare-fun array_inv!27893 (array!75689) Bool)

(assert (=> start!99326 (and (array_inv!27893 _values!996) e!665492)))

(declare-fun b!1170838 () Bool)

(declare-fun e!665495 () Bool)

(declare-fun e!665491 () Bool)

(assert (=> b!1170838 (= e!665495 e!665491)))

(declare-fun res!777111 () Bool)

(assert (=> b!1170838 (=> res!777111 e!665491)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1170838 (= res!777111 (not (= (select (arr!36495 _keys!1208) from!1455) k!934)))))

(declare-fun b!1170839 () Bool)

(declare-fun res!777103 () Bool)

(assert (=> b!1170839 (=> (not res!777103) (not e!665489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170839 (= res!777103 (validKeyInArray!0 k!934))))

(declare-fun b!1170840 () Bool)

(declare-fun e!665487 () Bool)

(declare-fun e!665497 () Bool)

(assert (=> b!1170840 (= e!665487 e!665497)))

(declare-fun res!777099 () Bool)

(assert (=> b!1170840 (=> res!777099 e!665497)))

(assert (=> b!1170840 (= res!777099 (not (= (select (arr!36495 _keys!1208) from!1455) k!934)))))

(assert (=> b!1170840 e!665495))

(declare-fun res!777108 () Bool)

(assert (=> b!1170840 (=> (not res!777108) (not e!665495))))

(declare-fun lt!527365 () V!44373)

(declare-datatypes ((tuple2!18870 0))(
  ( (tuple2!18871 (_1!9446 (_ BitVec 64)) (_2!9446 V!44373)) )
))
(declare-datatypes ((List!25605 0))(
  ( (Nil!25602) (Cons!25601 (h!26810 tuple2!18870) (t!37502 List!25605)) )
))
(declare-datatypes ((ListLongMap!16839 0))(
  ( (ListLongMap!16840 (toList!8435 List!25605)) )
))
(declare-fun lt!527357 () ListLongMap!16839)

(declare-fun lt!527364 () ListLongMap!16839)

(declare-fun +!3763 (ListLongMap!16839 tuple2!18870) ListLongMap!16839)

(declare-fun get!18611 (ValueCell!14008 V!44373) V!44373)

(assert (=> b!1170840 (= res!777108 (= lt!527357 (+!3763 lt!527364 (tuple2!18871 (select (arr!36495 _keys!1208) from!1455) (get!18611 (select (arr!36494 _values!996) from!1455) lt!527365)))))))

(declare-fun b!1170841 () Bool)

(declare-fun res!777104 () Bool)

(assert (=> b!1170841 (=> (not res!777104) (not e!665489))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170841 (= res!777104 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37031 _keys!1208))))))

(declare-fun b!1170842 () Bool)

(declare-fun e!665496 () Bool)

(declare-fun e!665486 () Bool)

(assert (=> b!1170842 (= e!665496 (not e!665486))))

(declare-fun res!777106 () Bool)

(assert (=> b!1170842 (=> res!777106 e!665486)))

(assert (=> b!1170842 (= res!777106 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170842 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38624 0))(
  ( (Unit!38625) )
))
(declare-fun lt!527363 () Unit!38624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75691 (_ BitVec 64) (_ BitVec 32)) Unit!38624)

(assert (=> b!1170842 (= lt!527363 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170843 () Bool)

(declare-fun res!777110 () Bool)

(assert (=> b!1170843 (=> (not res!777110) (not e!665496))))

(declare-fun lt!527358 () array!75691)

(declare-datatypes ((List!25606 0))(
  ( (Nil!25603) (Cons!25602 (h!26811 (_ BitVec 64)) (t!37503 List!25606)) )
))
(declare-fun arrayNoDuplicates!0 (array!75691 (_ BitVec 32) List!25606) Bool)

(assert (=> b!1170843 (= res!777110 (arrayNoDuplicates!0 lt!527358 #b00000000000000000000000000000000 Nil!25603))))

(declare-fun b!1170844 () Bool)

(declare-fun res!777109 () Bool)

(assert (=> b!1170844 (=> (not res!777109) (not e!665489))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75691 (_ BitVec 32)) Bool)

(assert (=> b!1170844 (= res!777109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170845 () Bool)

(assert (=> b!1170845 (= e!665494 tp_is_empty!29435)))

(declare-fun b!1170846 () Bool)

(declare-fun res!777097 () Bool)

(assert (=> b!1170846 (=> (not res!777097) (not e!665489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170846 (= res!777097 (validMask!0 mask!1564))))

(declare-fun b!1170847 () Bool)

(assert (=> b!1170847 (= e!665491 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170848 () Bool)

(declare-fun e!665488 () Bool)

(assert (=> b!1170848 (= e!665488 e!665487)))

(declare-fun res!777101 () Bool)

(assert (=> b!1170848 (=> res!777101 e!665487)))

(assert (=> b!1170848 (= res!777101 (not (validKeyInArray!0 (select (arr!36495 _keys!1208) from!1455))))))

(declare-fun lt!527360 () ListLongMap!16839)

(assert (=> b!1170848 (= lt!527360 lt!527364)))

(declare-fun lt!527366 () ListLongMap!16839)

(declare-fun -!1505 (ListLongMap!16839 (_ BitVec 64)) ListLongMap!16839)

(assert (=> b!1170848 (= lt!527364 (-!1505 lt!527366 k!934))))

(declare-fun zeroValue!944 () V!44373)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!527367 () array!75689)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44373)

(declare-fun getCurrentListMapNoExtraKeys!4899 (array!75691 array!75689 (_ BitVec 32) (_ BitVec 32) V!44373 V!44373 (_ BitVec 32) Int) ListLongMap!16839)

(assert (=> b!1170848 (= lt!527360 (getCurrentListMapNoExtraKeys!4899 lt!527358 lt!527367 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170848 (= lt!527366 (getCurrentListMapNoExtraKeys!4899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527362 () Unit!38624)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!732 (array!75691 array!75689 (_ BitVec 32) (_ BitVec 32) V!44373 V!44373 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38624)

(assert (=> b!1170848 (= lt!527362 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!732 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170849 () Bool)

(declare-fun e!665493 () Bool)

(assert (=> b!1170849 (= e!665493 tp_is_empty!29435)))

(declare-fun b!1170850 () Bool)

(declare-fun res!777100 () Bool)

(assert (=> b!1170850 (=> (not res!777100) (not e!665489))))

(assert (=> b!1170850 (= res!777100 (and (= (size!37030 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37031 _keys!1208) (size!37030 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170851 () Bool)

(assert (=> b!1170851 (= e!665486 e!665488)))

(declare-fun res!777102 () Bool)

(assert (=> b!1170851 (=> res!777102 e!665488)))

(assert (=> b!1170851 (= res!777102 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170851 (= lt!527357 (getCurrentListMapNoExtraKeys!4899 lt!527358 lt!527367 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170851 (= lt!527367 (array!75690 (store (arr!36494 _values!996) i!673 (ValueCellFull!14008 lt!527365)) (size!37030 _values!996)))))

(declare-fun dynLambda!2875 (Int (_ BitVec 64)) V!44373)

(assert (=> b!1170851 (= lt!527365 (dynLambda!2875 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527359 () ListLongMap!16839)

(assert (=> b!1170851 (= lt!527359 (getCurrentListMapNoExtraKeys!4899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45980 () Bool)

(assert (=> mapIsEmpty!45980 mapRes!45980))

(declare-fun b!1170852 () Bool)

(assert (=> b!1170852 (= e!665489 e!665496)))

(declare-fun res!777105 () Bool)

(assert (=> b!1170852 (=> (not res!777105) (not e!665496))))

(assert (=> b!1170852 (= res!777105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527358 mask!1564))))

(assert (=> b!1170852 (= lt!527358 (array!75692 (store (arr!36495 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37031 _keys!1208)))))

(declare-fun b!1170853 () Bool)

(declare-fun res!777112 () Bool)

(assert (=> b!1170853 (=> (not res!777112) (not e!665489))))

(assert (=> b!1170853 (= res!777112 (= (select (arr!36495 _keys!1208) i!673) k!934))))

(declare-fun b!1170854 () Bool)

(declare-fun res!777107 () Bool)

(assert (=> b!1170854 (=> (not res!777107) (not e!665489))))

(assert (=> b!1170854 (= res!777107 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25603))))

(declare-fun b!1170855 () Bool)

(assert (=> b!1170855 (= e!665497 true)))

(assert (=> b!1170855 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527361 () Unit!38624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75691 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38624)

(assert (=> b!1170855 (= lt!527361 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170856 () Bool)

(assert (=> b!1170856 (= e!665492 (and e!665493 mapRes!45980))))

(declare-fun condMapEmpty!45980 () Bool)

(declare-fun mapDefault!45980 () ValueCell!14008)

