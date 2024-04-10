; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97962 () Bool)

(assert start!97962)

(declare-fun b_free!23663 () Bool)

(declare-fun b_next!23663 () Bool)

(assert (=> start!97962 (= b_free!23663 (not b_next!23663))))

(declare-fun tp!83693 () Bool)

(declare-fun b_and!38109 () Bool)

(assert (=> start!97962 (= tp!83693 b_and!38109)))

(declare-fun b!1122965 () Bool)

(declare-fun res!750244 () Bool)

(declare-fun e!639327 () Bool)

(assert (=> b!1122965 (=> (not res!750244) (not e!639327))))

(declare-datatypes ((array!73259 0))(
  ( (array!73260 (arr!35282 (Array (_ BitVec 32) (_ BitVec 64))) (size!35818 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73259)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42717 0))(
  ( (V!42718 (val!14153 Int)) )
))
(declare-datatypes ((ValueCell!13387 0))(
  ( (ValueCellFull!13387 (v!16786 V!42717)) (EmptyCell!13387) )
))
(declare-datatypes ((array!73261 0))(
  ( (array!73262 (arr!35283 (Array (_ BitVec 32) ValueCell!13387)) (size!35819 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73261)

(assert (=> b!1122965 (= res!750244 (and (= (size!35819 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35818 _keys!1208) (size!35819 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!750251 () Bool)

(assert (=> start!97962 (=> (not res!750251) (not e!639327))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97962 (= res!750251 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35818 _keys!1208))))))

(assert (=> start!97962 e!639327))

(declare-fun tp_is_empty!28193 () Bool)

(assert (=> start!97962 tp_is_empty!28193))

(declare-fun array_inv!27088 (array!73259) Bool)

(assert (=> start!97962 (array_inv!27088 _keys!1208)))

(assert (=> start!97962 true))

(assert (=> start!97962 tp!83693))

(declare-fun e!639324 () Bool)

(declare-fun array_inv!27089 (array!73261) Bool)

(assert (=> start!97962 (and (array_inv!27089 _values!996) e!639324)))

(declare-fun b!1122966 () Bool)

(declare-fun e!639323 () Bool)

(declare-fun e!639322 () Bool)

(assert (=> b!1122966 (= e!639323 (not e!639322))))

(declare-fun res!750252 () Bool)

(assert (=> b!1122966 (=> res!750252 e!639322)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122966 (= res!750252 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122966 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36830 0))(
  ( (Unit!36831) )
))
(declare-fun lt!498913 () Unit!36830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73259 (_ BitVec 64) (_ BitVec 32)) Unit!36830)

(assert (=> b!1122966 (= lt!498913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1122967 () Bool)

(assert (=> b!1122967 (= e!639327 e!639323)))

(declare-fun res!750242 () Bool)

(assert (=> b!1122967 (=> (not res!750242) (not e!639323))))

(declare-fun lt!498911 () array!73259)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73259 (_ BitVec 32)) Bool)

(assert (=> b!1122967 (= res!750242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498911 mask!1564))))

(assert (=> b!1122967 (= lt!498911 (array!73260 (store (arr!35282 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35818 _keys!1208)))))

(declare-fun b!1122968 () Bool)

(declare-fun res!750241 () Bool)

(assert (=> b!1122968 (=> (not res!750241) (not e!639327))))

(declare-datatypes ((List!24553 0))(
  ( (Nil!24550) (Cons!24549 (h!25758 (_ BitVec 64)) (t!35208 List!24553)) )
))
(declare-fun arrayNoDuplicates!0 (array!73259 (_ BitVec 32) List!24553) Bool)

(assert (=> b!1122968 (= res!750241 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24550))))

(declare-fun b!1122969 () Bool)

(declare-fun e!639320 () Bool)

(assert (=> b!1122969 (= e!639322 e!639320)))

(declare-fun res!750253 () Bool)

(assert (=> b!1122969 (=> res!750253 e!639320)))

(assert (=> b!1122969 (= res!750253 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42717)

(declare-fun lt!498912 () array!73261)

(declare-datatypes ((tuple2!17774 0))(
  ( (tuple2!17775 (_1!8898 (_ BitVec 64)) (_2!8898 V!42717)) )
))
(declare-datatypes ((List!24554 0))(
  ( (Nil!24551) (Cons!24550 (h!25759 tuple2!17774) (t!35209 List!24554)) )
))
(declare-datatypes ((ListLongMap!15743 0))(
  ( (ListLongMap!15744 (toList!7887 List!24554)) )
))
(declare-fun lt!498915 () ListLongMap!15743)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42717)

(declare-fun getCurrentListMapNoExtraKeys!4375 (array!73259 array!73261 (_ BitVec 32) (_ BitVec 32) V!42717 V!42717 (_ BitVec 32) Int) ListLongMap!15743)

(assert (=> b!1122969 (= lt!498915 (getCurrentListMapNoExtraKeys!4375 lt!498911 lt!498912 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2471 (Int (_ BitVec 64)) V!42717)

(assert (=> b!1122969 (= lt!498912 (array!73262 (store (arr!35283 _values!996) i!673 (ValueCellFull!13387 (dynLambda!2471 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35819 _values!996)))))

(declare-fun lt!498917 () ListLongMap!15743)

(assert (=> b!1122969 (= lt!498917 (getCurrentListMapNoExtraKeys!4375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47271 () ListLongMap!15743)

(declare-fun b!1122970 () Bool)

(declare-fun call!47272 () ListLongMap!15743)

(declare-fun e!639319 () Bool)

(declare-fun -!1093 (ListLongMap!15743 (_ BitVec 64)) ListLongMap!15743)

(assert (=> b!1122970 (= e!639319 (= call!47271 (-!1093 call!47272 k!934)))))

(declare-fun mapNonEmpty!44107 () Bool)

(declare-fun mapRes!44107 () Bool)

(declare-fun tp!83692 () Bool)

(declare-fun e!639318 () Bool)

(assert (=> mapNonEmpty!44107 (= mapRes!44107 (and tp!83692 e!639318))))

(declare-fun mapValue!44107 () ValueCell!13387)

(declare-fun mapKey!44107 () (_ BitVec 32))

(declare-fun mapRest!44107 () (Array (_ BitVec 32) ValueCell!13387))

(assert (=> mapNonEmpty!44107 (= (arr!35283 _values!996) (store mapRest!44107 mapKey!44107 mapValue!44107))))

(declare-fun b!1122971 () Bool)

(declare-fun res!750250 () Bool)

(assert (=> b!1122971 (=> (not res!750250) (not e!639327))))

(assert (=> b!1122971 (= res!750250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47268 () Bool)

(assert (=> bm!47268 (= call!47272 (getCurrentListMapNoExtraKeys!4375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122972 () Bool)

(assert (=> b!1122972 (= e!639319 (= call!47271 call!47272))))

(declare-fun b!1122973 () Bool)

(declare-fun e!639321 () Bool)

(assert (=> b!1122973 (= e!639321 true)))

(declare-fun lt!498914 () Bool)

(declare-fun contains!6428 (ListLongMap!15743 (_ BitVec 64)) Bool)

(assert (=> b!1122973 (= lt!498914 (contains!6428 (getCurrentListMapNoExtraKeys!4375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1122974 () Bool)

(declare-fun res!750245 () Bool)

(assert (=> b!1122974 (=> (not res!750245) (not e!639323))))

(assert (=> b!1122974 (= res!750245 (arrayNoDuplicates!0 lt!498911 #b00000000000000000000000000000000 Nil!24550))))

(declare-fun b!1122975 () Bool)

(declare-fun res!750243 () Bool)

(assert (=> b!1122975 (=> (not res!750243) (not e!639327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122975 (= res!750243 (validKeyInArray!0 k!934))))

(declare-fun b!1122976 () Bool)

(declare-fun e!639326 () Bool)

(assert (=> b!1122976 (= e!639324 (and e!639326 mapRes!44107))))

(declare-fun condMapEmpty!44107 () Bool)

(declare-fun mapDefault!44107 () ValueCell!13387)

