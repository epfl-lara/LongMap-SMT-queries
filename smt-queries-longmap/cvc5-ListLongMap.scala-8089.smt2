; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99400 () Bool)

(assert start!99400)

(declare-fun b_free!24979 () Bool)

(declare-fun b_next!24979 () Bool)

(assert (=> start!99400 (= b_free!24979 (not b_next!24979))))

(declare-fun tp!87650 () Bool)

(declare-fun b_and!40825 () Bool)

(assert (=> start!99400 (= tp!87650 b_and!40825)))

(declare-fun b!1173293 () Bool)

(declare-fun e!666910 () Bool)

(declare-fun e!666904 () Bool)

(assert (=> b!1173293 (= e!666910 (not e!666904))))

(declare-fun res!779090 () Bool)

(assert (=> b!1173293 (=> res!779090 e!666904)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173293 (= res!779090 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75829 0))(
  ( (array!75830 (arr!36564 (Array (_ BitVec 32) (_ BitVec 64))) (size!37100 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75829)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173293 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38693 0))(
  ( (Unit!38694) )
))
(declare-fun lt!528831 () Unit!38693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75829 (_ BitVec 64) (_ BitVec 32)) Unit!38693)

(assert (=> b!1173293 (= lt!528831 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173294 () Bool)

(declare-fun e!666902 () Unit!38693)

(declare-fun Unit!38695 () Unit!38693)

(assert (=> b!1173294 (= e!666902 Unit!38695)))

(declare-fun lt!528834 () Unit!38693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75829 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38693)

(assert (=> b!1173294 (= lt!528834 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1173294 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528830 () Unit!38693)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75829 (_ BitVec 32) (_ BitVec 32)) Unit!38693)

(assert (=> b!1173294 (= lt!528830 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25665 0))(
  ( (Nil!25662) (Cons!25661 (h!26870 (_ BitVec 64)) (t!37636 List!25665)) )
))
(declare-fun arrayNoDuplicates!0 (array!75829 (_ BitVec 32) List!25665) Bool)

(assert (=> b!1173294 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25662)))

(declare-fun lt!528828 () Unit!38693)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75829 (_ BitVec 64) (_ BitVec 32) List!25665) Unit!38693)

(assert (=> b!1173294 (= lt!528828 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25662))))

(assert (=> b!1173294 false))

(declare-fun b!1173296 () Bool)

(declare-fun e!666903 () Bool)

(declare-fun e!666909 () Bool)

(assert (=> b!1173296 (= e!666903 e!666909)))

(declare-fun res!779101 () Bool)

(assert (=> b!1173296 (=> res!779101 e!666909)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173296 (= res!779101 (not (validKeyInArray!0 (select (arr!36564 _keys!1208) from!1455))))))

(declare-datatypes ((V!44473 0))(
  ( (V!44474 (val!14811 Int)) )
))
(declare-datatypes ((tuple2!18926 0))(
  ( (tuple2!18927 (_1!9474 (_ BitVec 64)) (_2!9474 V!44473)) )
))
(declare-datatypes ((List!25666 0))(
  ( (Nil!25663) (Cons!25662 (h!26871 tuple2!18926) (t!37637 List!25666)) )
))
(declare-datatypes ((ListLongMap!16895 0))(
  ( (ListLongMap!16896 (toList!8463 List!25666)) )
))
(declare-fun lt!528833 () ListLongMap!16895)

(declare-fun lt!528829 () ListLongMap!16895)

(assert (=> b!1173296 (= lt!528833 lt!528829)))

(declare-fun lt!528838 () ListLongMap!16895)

(declare-fun -!1527 (ListLongMap!16895 (_ BitVec 64)) ListLongMap!16895)

(assert (=> b!1173296 (= lt!528829 (-!1527 lt!528838 k!934))))

(declare-fun zeroValue!944 () V!44473)

(declare-datatypes ((ValueCell!14045 0))(
  ( (ValueCellFull!14045 (v!17449 V!44473)) (EmptyCell!14045) )
))
(declare-datatypes ((array!75831 0))(
  ( (array!75832 (arr!36565 (Array (_ BitVec 32) ValueCell!14045)) (size!37101 (_ BitVec 32))) )
))
(declare-fun lt!528839 () array!75831)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528837 () array!75829)

(declare-fun minValue!944 () V!44473)

(declare-fun getCurrentListMapNoExtraKeys!4926 (array!75829 array!75831 (_ BitVec 32) (_ BitVec 32) V!44473 V!44473 (_ BitVec 32) Int) ListLongMap!16895)

(assert (=> b!1173296 (= lt!528833 (getCurrentListMapNoExtraKeys!4926 lt!528837 lt!528839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75831)

(assert (=> b!1173296 (= lt!528838 (getCurrentListMapNoExtraKeys!4926 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528832 () Unit!38693)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!754 (array!75829 array!75831 (_ BitVec 32) (_ BitVec 32) V!44473 V!44473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38693)

(assert (=> b!1173296 (= lt!528832 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!754 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173297 () Bool)

(assert (=> b!1173297 (= e!666904 e!666903)))

(declare-fun res!779096 () Bool)

(assert (=> b!1173297 (=> res!779096 e!666903)))

(assert (=> b!1173297 (= res!779096 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!528836 () ListLongMap!16895)

(assert (=> b!1173297 (= lt!528836 (getCurrentListMapNoExtraKeys!4926 lt!528837 lt!528839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528827 () V!44473)

(assert (=> b!1173297 (= lt!528839 (array!75832 (store (arr!36565 _values!996) i!673 (ValueCellFull!14045 lt!528827)) (size!37101 _values!996)))))

(declare-fun dynLambda!2897 (Int (_ BitVec 64)) V!44473)

(assert (=> b!1173297 (= lt!528827 (dynLambda!2897 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528840 () ListLongMap!16895)

(assert (=> b!1173297 (= lt!528840 (getCurrentListMapNoExtraKeys!4926 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173298 () Bool)

(declare-fun res!779093 () Bool)

(declare-fun e!666906 () Bool)

(assert (=> b!1173298 (=> (not res!779093) (not e!666906))))

(assert (=> b!1173298 (= res!779093 (validKeyInArray!0 k!934))))

(declare-fun b!1173299 () Bool)

(assert (=> b!1173299 (= e!666909 true)))

(assert (=> b!1173299 (not (= (select (arr!36564 _keys!1208) from!1455) k!934))))

(declare-fun lt!528835 () Unit!38693)

(assert (=> b!1173299 (= lt!528835 e!666902)))

(declare-fun c!116592 () Bool)

(assert (=> b!1173299 (= c!116592 (= (select (arr!36564 _keys!1208) from!1455) k!934))))

(declare-fun e!666899 () Bool)

(assert (=> b!1173299 e!666899))

(declare-fun res!779095 () Bool)

(assert (=> b!1173299 (=> (not res!779095) (not e!666899))))

(declare-fun +!3782 (ListLongMap!16895 tuple2!18926) ListLongMap!16895)

(declare-fun get!18656 (ValueCell!14045 V!44473) V!44473)

(assert (=> b!1173299 (= res!779095 (= lt!528836 (+!3782 lt!528829 (tuple2!18927 (select (arr!36564 _keys!1208) from!1455) (get!18656 (select (arr!36565 _values!996) from!1455) lt!528827)))))))

(declare-fun mapNonEmpty!46091 () Bool)

(declare-fun mapRes!46091 () Bool)

(declare-fun tp!87651 () Bool)

(declare-fun e!666907 () Bool)

(assert (=> mapNonEmpty!46091 (= mapRes!46091 (and tp!87651 e!666907))))

(declare-fun mapKey!46091 () (_ BitVec 32))

(declare-fun mapValue!46091 () ValueCell!14045)

(declare-fun mapRest!46091 () (Array (_ BitVec 32) ValueCell!14045))

(assert (=> mapNonEmpty!46091 (= (arr!36565 _values!996) (store mapRest!46091 mapKey!46091 mapValue!46091))))

(declare-fun b!1173300 () Bool)

(declare-fun res!779088 () Bool)

(assert (=> b!1173300 (=> (not res!779088) (not e!666906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75829 (_ BitVec 32)) Bool)

(assert (=> b!1173300 (= res!779088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173301 () Bool)

(declare-fun res!779094 () Bool)

(assert (=> b!1173301 (=> (not res!779094) (not e!666906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173301 (= res!779094 (validMask!0 mask!1564))))

(declare-fun b!1173302 () Bool)

(declare-fun e!666901 () Bool)

(declare-fun e!666908 () Bool)

(assert (=> b!1173302 (= e!666901 (and e!666908 mapRes!46091))))

(declare-fun condMapEmpty!46091 () Bool)

(declare-fun mapDefault!46091 () ValueCell!14045)

