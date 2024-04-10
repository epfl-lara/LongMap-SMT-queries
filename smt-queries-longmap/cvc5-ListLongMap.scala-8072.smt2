; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99298 () Bool)

(assert start!99298)

(declare-fun b_free!24877 () Bool)

(declare-fun b_next!24877 () Bool)

(assert (=> start!99298 (= b_free!24877 (not b_next!24877))))

(declare-fun tp!87344 () Bool)

(declare-fun b_and!40621 () Bool)

(assert (=> start!99298 (= tp!87344 b_and!40621)))

(declare-datatypes ((array!75633 0))(
  ( (array!75634 (arr!36466 (Array (_ BitVec 32) (_ BitVec 64))) (size!37002 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75633)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!664982 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1170012 () Bool)

(declare-fun arrayContainsKey!0 (array!75633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170012 (= e!664982 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!45938 () Bool)

(declare-fun mapRes!45938 () Bool)

(declare-fun tp!87345 () Bool)

(declare-fun e!664987 () Bool)

(assert (=> mapNonEmpty!45938 (= mapRes!45938 (and tp!87345 e!664987))))

(declare-datatypes ((V!44337 0))(
  ( (V!44338 (val!14760 Int)) )
))
(declare-datatypes ((ValueCell!13994 0))(
  ( (ValueCellFull!13994 (v!17398 V!44337)) (EmptyCell!13994) )
))
(declare-fun mapValue!45938 () ValueCell!13994)

(declare-fun mapRest!45938 () (Array (_ BitVec 32) ValueCell!13994))

(declare-datatypes ((array!75635 0))(
  ( (array!75636 (arr!36467 (Array (_ BitVec 32) ValueCell!13994)) (size!37003 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75635)

(declare-fun mapKey!45938 () (_ BitVec 32))

(assert (=> mapNonEmpty!45938 (= (arr!36467 _values!996) (store mapRest!45938 mapKey!45938 mapValue!45938))))

(declare-fun b!1170013 () Bool)

(declare-fun e!664992 () Bool)

(assert (=> b!1170013 (= e!664992 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1170013 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!38598 0))(
  ( (Unit!38599) )
))
(declare-fun lt!526903 () Unit!38598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75633 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38598)

(assert (=> b!1170013 (= lt!526903 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1170014 () Bool)

(declare-fun e!664985 () Bool)

(declare-fun e!664989 () Bool)

(assert (=> b!1170014 (= e!664985 e!664989)))

(declare-fun res!776427 () Bool)

(assert (=> b!1170014 (=> res!776427 e!664989)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170014 (= res!776427 (not (validKeyInArray!0 (select (arr!36466 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18846 0))(
  ( (tuple2!18847 (_1!9434 (_ BitVec 64)) (_2!9434 V!44337)) )
))
(declare-datatypes ((List!25582 0))(
  ( (Nil!25579) (Cons!25578 (h!26787 tuple2!18846) (t!37451 List!25582)) )
))
(declare-datatypes ((ListLongMap!16815 0))(
  ( (ListLongMap!16816 (toList!8423 List!25582)) )
))
(declare-fun lt!526899 () ListLongMap!16815)

(declare-fun lt!526898 () ListLongMap!16815)

(assert (=> b!1170014 (= lt!526899 lt!526898)))

(declare-fun lt!526902 () ListLongMap!16815)

(declare-fun -!1494 (ListLongMap!16815 (_ BitVec 64)) ListLongMap!16815)

(assert (=> b!1170014 (= lt!526898 (-!1494 lt!526902 k!934))))

(declare-fun zeroValue!944 () V!44337)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526900 () array!75635)

(declare-fun lt!526904 () array!75633)

(declare-fun minValue!944 () V!44337)

(declare-fun getCurrentListMapNoExtraKeys!4887 (array!75633 array!75635 (_ BitVec 32) (_ BitVec 32) V!44337 V!44337 (_ BitVec 32) Int) ListLongMap!16815)

(assert (=> b!1170014 (= lt!526899 (getCurrentListMapNoExtraKeys!4887 lt!526904 lt!526900 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170014 (= lt!526902 (getCurrentListMapNoExtraKeys!4887 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526897 () Unit!38598)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!721 (array!75633 array!75635 (_ BitVec 32) (_ BitVec 32) V!44337 V!44337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38598)

(assert (=> b!1170014 (= lt!526897 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!721 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1170015 () Bool)

(declare-fun res!776436 () Bool)

(declare-fun e!664990 () Bool)

(assert (=> b!1170015 (=> (not res!776436) (not e!664990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170015 (= res!776436 (validMask!0 mask!1564))))

(declare-fun b!1170016 () Bool)

(declare-fun e!664993 () Bool)

(declare-fun e!664983 () Bool)

(assert (=> b!1170016 (= e!664993 (not e!664983))))

(declare-fun res!776429 () Bool)

(assert (=> b!1170016 (=> res!776429 e!664983)))

(assert (=> b!1170016 (= res!776429 (bvsgt from!1455 i!673))))

(assert (=> b!1170016 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!526905 () Unit!38598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75633 (_ BitVec 64) (_ BitVec 32)) Unit!38598)

(assert (=> b!1170016 (= lt!526905 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1170017 () Bool)

(declare-fun res!776437 () Bool)

(assert (=> b!1170017 (=> (not res!776437) (not e!664990))))

(assert (=> b!1170017 (= res!776437 (and (= (size!37003 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37002 _keys!1208) (size!37003 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!776434 () Bool)

(assert (=> start!99298 (=> (not res!776434) (not e!664990))))

(assert (=> start!99298 (= res!776434 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37002 _keys!1208))))))

(assert (=> start!99298 e!664990))

(declare-fun tp_is_empty!29407 () Bool)

(assert (=> start!99298 tp_is_empty!29407))

(declare-fun array_inv!27872 (array!75633) Bool)

(assert (=> start!99298 (array_inv!27872 _keys!1208)))

(assert (=> start!99298 true))

(assert (=> start!99298 tp!87344))

(declare-fun e!664986 () Bool)

(declare-fun array_inv!27873 (array!75635) Bool)

(assert (=> start!99298 (and (array_inv!27873 _values!996) e!664986)))

(declare-fun b!1170018 () Bool)

(declare-fun res!776439 () Bool)

(assert (=> b!1170018 (=> (not res!776439) (not e!664990))))

(declare-datatypes ((List!25583 0))(
  ( (Nil!25580) (Cons!25579 (h!26788 (_ BitVec 64)) (t!37452 List!25583)) )
))
(declare-fun arrayNoDuplicates!0 (array!75633 (_ BitVec 32) List!25583) Bool)

(assert (=> b!1170018 (= res!776439 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25580))))

(declare-fun b!1170019 () Bool)

(assert (=> b!1170019 (= e!664989 e!664992)))

(declare-fun res!776430 () Bool)

(assert (=> b!1170019 (=> res!776430 e!664992)))

(assert (=> b!1170019 (= res!776430 (not (= (select (arr!36466 _keys!1208) from!1455) k!934)))))

(declare-fun e!664984 () Bool)

(assert (=> b!1170019 e!664984))

(declare-fun res!776435 () Bool)

(assert (=> b!1170019 (=> (not res!776435) (not e!664984))))

(declare-fun lt!526901 () ListLongMap!16815)

(declare-fun lt!526895 () V!44337)

(declare-fun +!3752 (ListLongMap!16815 tuple2!18846) ListLongMap!16815)

(declare-fun get!18592 (ValueCell!13994 V!44337) V!44337)

(assert (=> b!1170019 (= res!776435 (= lt!526901 (+!3752 lt!526898 (tuple2!18847 (select (arr!36466 _keys!1208) from!1455) (get!18592 (select (arr!36467 _values!996) from!1455) lt!526895)))))))

(declare-fun b!1170020 () Bool)

(assert (=> b!1170020 (= e!664983 e!664985)))

(declare-fun res!776432 () Bool)

(assert (=> b!1170020 (=> res!776432 e!664985)))

(assert (=> b!1170020 (= res!776432 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1170020 (= lt!526901 (getCurrentListMapNoExtraKeys!4887 lt!526904 lt!526900 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1170020 (= lt!526900 (array!75636 (store (arr!36467 _values!996) i!673 (ValueCellFull!13994 lt!526895)) (size!37003 _values!996)))))

(declare-fun dynLambda!2864 (Int (_ BitVec 64)) V!44337)

(assert (=> b!1170020 (= lt!526895 (dynLambda!2864 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526896 () ListLongMap!16815)

(assert (=> b!1170020 (= lt!526896 (getCurrentListMapNoExtraKeys!4887 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1170021 () Bool)

(declare-fun res!776438 () Bool)

(assert (=> b!1170021 (=> (not res!776438) (not e!664990))))

(assert (=> b!1170021 (= res!776438 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37002 _keys!1208))))))

(declare-fun b!1170022 () Bool)

(declare-fun e!664988 () Bool)

(assert (=> b!1170022 (= e!664986 (and e!664988 mapRes!45938))))

(declare-fun condMapEmpty!45938 () Bool)

(declare-fun mapDefault!45938 () ValueCell!13994)

