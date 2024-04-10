; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99518 () Bool)

(assert start!99518)

(declare-fun b_free!25097 () Bool)

(declare-fun b_next!25097 () Bool)

(assert (=> start!99518 (= b_free!25097 (not b_next!25097))))

(declare-fun tp!88005 () Bool)

(declare-fun b_and!41061 () Bool)

(assert (=> start!99518 (= tp!88005 b_and!41061)))

(declare-fun b!1176995 () Bool)

(declare-fun e!669074 () Bool)

(declare-fun tp_is_empty!29627 () Bool)

(assert (=> b!1176995 (= e!669074 tp_is_empty!29627)))

(declare-fun res!781801 () Bool)

(declare-fun e!669076 () Bool)

(assert (=> start!99518 (=> (not res!781801) (not e!669076))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76061 0))(
  ( (array!76062 (arr!36680 (Array (_ BitVec 32) (_ BitVec 64))) (size!37216 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76061)

(assert (=> start!99518 (= res!781801 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37216 _keys!1208))))))

(assert (=> start!99518 e!669076))

(assert (=> start!99518 tp_is_empty!29627))

(declare-fun array_inv!28014 (array!76061) Bool)

(assert (=> start!99518 (array_inv!28014 _keys!1208)))

(assert (=> start!99518 true))

(assert (=> start!99518 tp!88005))

(declare-datatypes ((V!44629 0))(
  ( (V!44630 (val!14870 Int)) )
))
(declare-datatypes ((ValueCell!14104 0))(
  ( (ValueCellFull!14104 (v!17508 V!44629)) (EmptyCell!14104) )
))
(declare-datatypes ((array!76063 0))(
  ( (array!76064 (arr!36681 (Array (_ BitVec 32) ValueCell!14104)) (size!37217 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76063)

(declare-fun e!669073 () Bool)

(declare-fun array_inv!28015 (array!76063) Bool)

(assert (=> start!99518 (and (array_inv!28015 _values!996) e!669073)))

(declare-fun b!1176996 () Bool)

(declare-fun res!781789 () Bool)

(assert (=> b!1176996 (=> (not res!781789) (not e!669076))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1176996 (= res!781789 (= (select (arr!36680 _keys!1208) i!673) k!934))))

(declare-fun b!1176997 () Bool)

(declare-fun res!781798 () Bool)

(assert (=> b!1176997 (=> (not res!781798) (not e!669076))))

(declare-datatypes ((List!25758 0))(
  ( (Nil!25755) (Cons!25754 (h!26963 (_ BitVec 64)) (t!37847 List!25758)) )
))
(declare-fun arrayNoDuplicates!0 (array!76061 (_ BitVec 32) List!25758) Bool)

(assert (=> b!1176997 (= res!781798 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25755))))

(declare-fun b!1176998 () Bool)

(declare-fun res!781790 () Bool)

(assert (=> b!1176998 (=> (not res!781790) (not e!669076))))

(assert (=> b!1176998 (= res!781790 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37216 _keys!1208))))))

(declare-fun b!1176999 () Bool)

(declare-fun e!669078 () Bool)

(assert (=> b!1176999 (= e!669078 true)))

(declare-fun e!669067 () Bool)

(assert (=> b!1176999 e!669067))

(declare-fun res!781795 () Bool)

(assert (=> b!1176999 (=> (not res!781795) (not e!669067))))

(assert (=> b!1176999 (= res!781795 (not (= (select (arr!36680 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38864 0))(
  ( (Unit!38865) )
))
(declare-fun lt!531356 () Unit!38864)

(declare-fun e!669077 () Unit!38864)

(assert (=> b!1176999 (= lt!531356 e!669077)))

(declare-fun c!116769 () Bool)

(assert (=> b!1176999 (= c!116769 (= (select (arr!36680 _keys!1208) from!1455) k!934))))

(declare-fun e!669068 () Bool)

(assert (=> b!1176999 e!669068))

(declare-fun res!781797 () Bool)

(assert (=> b!1176999 (=> (not res!781797) (not e!669068))))

(declare-datatypes ((tuple2!19020 0))(
  ( (tuple2!19021 (_1!9521 (_ BitVec 64)) (_2!9521 V!44629)) )
))
(declare-fun lt!531349 () tuple2!19020)

(declare-datatypes ((List!25759 0))(
  ( (Nil!25756) (Cons!25755 (h!26964 tuple2!19020) (t!37848 List!25759)) )
))
(declare-datatypes ((ListLongMap!16989 0))(
  ( (ListLongMap!16990 (toList!8510 List!25759)) )
))
(declare-fun lt!531350 () ListLongMap!16989)

(declare-fun lt!531352 () ListLongMap!16989)

(declare-fun +!3825 (ListLongMap!16989 tuple2!19020) ListLongMap!16989)

(assert (=> b!1176999 (= res!781797 (= lt!531352 (+!3825 lt!531350 lt!531349)))))

(declare-fun lt!531353 () V!44629)

(declare-fun get!18737 (ValueCell!14104 V!44629) V!44629)

(assert (=> b!1176999 (= lt!531349 (tuple2!19021 (select (arr!36680 _keys!1208) from!1455) (get!18737 (select (arr!36681 _values!996) from!1455) lt!531353)))))

(declare-fun b!1177000 () Bool)

(declare-fun e!669075 () Bool)

(declare-fun e!669079 () Bool)

(assert (=> b!1177000 (= e!669075 e!669079)))

(declare-fun res!781799 () Bool)

(assert (=> b!1177000 (=> res!781799 e!669079)))

(assert (=> b!1177000 (= res!781799 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44629)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531362 () array!76063)

(declare-fun minValue!944 () V!44629)

(declare-fun lt!531358 () array!76061)

(declare-fun getCurrentListMapNoExtraKeys!4968 (array!76061 array!76063 (_ BitVec 32) (_ BitVec 32) V!44629 V!44629 (_ BitVec 32) Int) ListLongMap!16989)

(assert (=> b!1177000 (= lt!531352 (getCurrentListMapNoExtraKeys!4968 lt!531358 lt!531362 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177000 (= lt!531362 (array!76064 (store (arr!36681 _values!996) i!673 (ValueCellFull!14104 lt!531353)) (size!37217 _values!996)))))

(declare-fun dynLambda!2932 (Int (_ BitVec 64)) V!44629)

(assert (=> b!1177000 (= lt!531353 (dynLambda!2932 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531360 () ListLongMap!16989)

(assert (=> b!1177000 (= lt!531360 (getCurrentListMapNoExtraKeys!4968 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177001 () Bool)

(declare-fun e!669070 () Bool)

(assert (=> b!1177001 (= e!669068 e!669070)))

(declare-fun res!781788 () Bool)

(assert (=> b!1177001 (=> res!781788 e!669070)))

(assert (=> b!1177001 (= res!781788 (not (= (select (arr!36680 _keys!1208) from!1455) k!934)))))

(declare-fun b!1177002 () Bool)

(declare-fun e!669069 () Bool)

(declare-fun mapRes!46268 () Bool)

(assert (=> b!1177002 (= e!669073 (and e!669069 mapRes!46268))))

(declare-fun condMapEmpty!46268 () Bool)

(declare-fun mapDefault!46268 () ValueCell!14104)

