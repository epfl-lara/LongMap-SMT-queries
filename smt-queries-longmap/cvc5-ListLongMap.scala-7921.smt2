; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98366 () Bool)

(assert start!98366)

(declare-fun b_free!23971 () Bool)

(declare-fun b_next!23971 () Bool)

(assert (=> start!98366 (= b_free!23971 (not b_next!23971))))

(declare-fun tp!84623 () Bool)

(declare-fun b_and!38791 () Bool)

(assert (=> start!98366 (= tp!84623 b_and!38791)))

(declare-fun b!1133863 () Bool)

(declare-fun res!757028 () Bool)

(declare-fun e!645305 () Bool)

(assert (=> b!1133863 (=> (not res!757028) (not e!645305))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73863 0))(
  ( (array!73864 (arr!35582 (Array (_ BitVec 32) (_ BitVec 64))) (size!36118 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73863)

(assert (=> b!1133863 (= res!757028 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36118 _keys!1208))))))

(declare-fun res!757032 () Bool)

(assert (=> start!98366 (=> (not res!757032) (not e!645305))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98366 (= res!757032 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36118 _keys!1208))))))

(assert (=> start!98366 e!645305))

(declare-fun tp_is_empty!28501 () Bool)

(assert (=> start!98366 tp_is_empty!28501))

(declare-fun array_inv!27290 (array!73863) Bool)

(assert (=> start!98366 (array_inv!27290 _keys!1208)))

(assert (=> start!98366 true))

(assert (=> start!98366 tp!84623))

(declare-datatypes ((V!43129 0))(
  ( (V!43130 (val!14307 Int)) )
))
(declare-datatypes ((ValueCell!13541 0))(
  ( (ValueCellFull!13541 (v!16944 V!43129)) (EmptyCell!13541) )
))
(declare-datatypes ((array!73865 0))(
  ( (array!73866 (arr!35583 (Array (_ BitVec 32) ValueCell!13541)) (size!36119 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73865)

(declare-fun e!645303 () Bool)

(declare-fun array_inv!27291 (array!73865) Bool)

(assert (=> start!98366 (and (array_inv!27291 _values!996) e!645303)))

(declare-fun b!1133864 () Bool)

(declare-fun e!645314 () Bool)

(declare-fun e!645310 () Bool)

(assert (=> b!1133864 (= e!645314 e!645310)))

(declare-fun res!757027 () Bool)

(assert (=> b!1133864 (=> res!757027 e!645310)))

(declare-datatypes ((tuple2!18046 0))(
  ( (tuple2!18047 (_1!9034 (_ BitVec 64)) (_2!9034 V!43129)) )
))
(declare-datatypes ((List!24807 0))(
  ( (Nil!24804) (Cons!24803 (h!26012 tuple2!18046) (t!35770 List!24807)) )
))
(declare-datatypes ((ListLongMap!16015 0))(
  ( (ListLongMap!16016 (toList!8023 List!24807)) )
))
(declare-fun lt!503908 () ListLongMap!16015)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6547 (ListLongMap!16015 (_ BitVec 64)) Bool)

(assert (=> b!1133864 (= res!757027 (not (contains!6547 lt!503908 k!934)))))

(declare-fun zeroValue!944 () V!43129)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43129)

(declare-fun getCurrentListMapNoExtraKeys!4509 (array!73863 array!73865 (_ BitVec 32) (_ BitVec 32) V!43129 V!43129 (_ BitVec 32) Int) ListLongMap!16015)

(assert (=> b!1133864 (= lt!503908 (getCurrentListMapNoExtraKeys!4509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!49201 () ListLongMap!16015)

(declare-fun b!1133865 () Bool)

(declare-fun e!645306 () Bool)

(declare-fun call!49200 () ListLongMap!16015)

(declare-fun -!1190 (ListLongMap!16015 (_ BitVec 64)) ListLongMap!16015)

(assert (=> b!1133865 (= e!645306 (= call!49201 (-!1190 call!49200 k!934)))))

(declare-fun mapIsEmpty!44576 () Bool)

(declare-fun mapRes!44576 () Bool)

(assert (=> mapIsEmpty!44576 mapRes!44576))

(declare-fun b!1133866 () Bool)

(declare-fun e!645307 () Bool)

(declare-fun e!645308 () Bool)

(assert (=> b!1133866 (= e!645307 (not e!645308))))

(declare-fun res!757029 () Bool)

(assert (=> b!1133866 (=> res!757029 e!645308)))

(assert (=> b!1133866 (= res!757029 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133866 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37153 0))(
  ( (Unit!37154) )
))
(declare-fun lt!503905 () Unit!37153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73863 (_ BitVec 64) (_ BitVec 32)) Unit!37153)

(assert (=> b!1133866 (= lt!503905 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1133867 () Bool)

(declare-fun e!645309 () Bool)

(assert (=> b!1133867 (= e!645308 e!645309)))

(declare-fun res!757024 () Bool)

(assert (=> b!1133867 (=> res!757024 e!645309)))

(assert (=> b!1133867 (= res!757024 (not (= from!1455 i!673)))))

(declare-fun lt!503916 () array!73863)

(declare-fun lt!503917 () ListLongMap!16015)

(declare-fun lt!503906 () array!73865)

(assert (=> b!1133867 (= lt!503917 (getCurrentListMapNoExtraKeys!4509 lt!503916 lt!503906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2577 (Int (_ BitVec 64)) V!43129)

(assert (=> b!1133867 (= lt!503906 (array!73866 (store (arr!35583 _values!996) i!673 (ValueCellFull!13541 (dynLambda!2577 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36119 _values!996)))))

(declare-fun lt!503911 () ListLongMap!16015)

(assert (=> b!1133867 (= lt!503911 (getCurrentListMapNoExtraKeys!4509 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133868 () Bool)

(declare-fun res!757033 () Bool)

(assert (=> b!1133868 (=> (not res!757033) (not e!645305))))

(assert (=> b!1133868 (= res!757033 (= (select (arr!35582 _keys!1208) i!673) k!934))))

(declare-fun b!1133869 () Bool)

(declare-fun res!757026 () Bool)

(assert (=> b!1133869 (=> (not res!757026) (not e!645305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133869 (= res!757026 (validKeyInArray!0 k!934))))

(declare-fun bm!49191 () Bool)

(declare-fun call!49199 () Unit!37153)

(declare-fun call!49195 () Unit!37153)

(assert (=> bm!49191 (= call!49199 call!49195)))

(declare-fun b!1133870 () Bool)

(assert (=> b!1133870 (= e!645305 e!645307)))

(declare-fun res!757035 () Bool)

(assert (=> b!1133870 (=> (not res!757035) (not e!645307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73863 (_ BitVec 32)) Bool)

(assert (=> b!1133870 (= res!757035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503916 mask!1564))))

(assert (=> b!1133870 (= lt!503916 (array!73864 (store (arr!35582 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36118 _keys!1208)))))

(declare-fun b!1133871 () Bool)

(declare-fun c!110689 () Bool)

(declare-fun lt!503914 () Bool)

(assert (=> b!1133871 (= c!110689 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503914))))

(declare-fun e!645315 () Unit!37153)

(declare-fun e!645317 () Unit!37153)

(assert (=> b!1133871 (= e!645315 e!645317)))

(declare-fun b!1133872 () Bool)

(declare-fun lt!503919 () Unit!37153)

(assert (=> b!1133872 (= e!645317 lt!503919)))

(assert (=> b!1133872 (= lt!503919 call!49199)))

(declare-fun call!49197 () Bool)

(assert (=> b!1133872 call!49197))

(declare-fun b!1133873 () Bool)

(declare-fun e!645313 () Bool)

(assert (=> b!1133873 (= e!645313 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503914) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133874 () Bool)

(declare-fun e!645311 () Bool)

(assert (=> b!1133874 (= e!645311 tp_is_empty!28501)))

(declare-fun b!1133875 () Bool)

(declare-fun res!757025 () Bool)

(assert (=> b!1133875 (=> (not res!757025) (not e!645305))))

(assert (=> b!1133875 (= res!757025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133876 () Bool)

(declare-fun e!645304 () Bool)

(assert (=> b!1133876 (= e!645303 (and e!645304 mapRes!44576))))

(declare-fun condMapEmpty!44576 () Bool)

(declare-fun mapDefault!44576 () ValueCell!13541)

