; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101710 () Bool)

(assert start!101710)

(declare-fun b_free!26399 () Bool)

(declare-fun b_next!26399 () Bool)

(assert (=> start!101710 (= b_free!26399 (not b_next!26399))))

(declare-fun tp!92243 () Bool)

(declare-fun b_and!44059 () Bool)

(assert (=> start!101710 (= tp!92243 b_and!44059)))

(declare-fun b!1223768 () Bool)

(declare-fun res!813131 () Bool)

(declare-fun e!695035 () Bool)

(assert (=> b!1223768 (=> (not res!813131) (not e!695035))))

(declare-datatypes ((array!78989 0))(
  ( (array!78990 (arr!38121 (Array (_ BitVec 32) (_ BitVec 64))) (size!38657 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78989)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1223768 (= res!813131 (= (select (arr!38121 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!48553 () Bool)

(declare-fun mapRes!48553 () Bool)

(assert (=> mapIsEmpty!48553 mapRes!48553))

(declare-fun b!1223769 () Bool)

(declare-fun e!695033 () Bool)

(declare-fun e!695034 () Bool)

(assert (=> b!1223769 (= e!695033 e!695034)))

(declare-fun res!813134 () Bool)

(assert (=> b!1223769 (=> res!813134 e!695034)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223769 (= res!813134 (not (validKeyInArray!0 (select (arr!38121 _keys!1208) from!1455))))))

(declare-datatypes ((V!46597 0))(
  ( (V!46598 (val!15608 Int)) )
))
(declare-datatypes ((tuple2!20112 0))(
  ( (tuple2!20113 (_1!10067 (_ BitVec 64)) (_2!10067 V!46597)) )
))
(declare-datatypes ((List!26913 0))(
  ( (Nil!26910) (Cons!26909 (h!28118 tuple2!20112) (t!40292 List!26913)) )
))
(declare-datatypes ((ListLongMap!18081 0))(
  ( (ListLongMap!18082 (toList!9056 List!26913)) )
))
(declare-fun lt!557067 () ListLongMap!18081)

(declare-fun lt!557080 () ListLongMap!18081)

(assert (=> b!1223769 (= lt!557067 lt!557080)))

(declare-fun lt!557074 () ListLongMap!18081)

(declare-fun -!1958 (ListLongMap!18081 (_ BitVec 64)) ListLongMap!18081)

(assert (=> b!1223769 (= lt!557080 (-!1958 lt!557074 k!934))))

(declare-fun zeroValue!944 () V!46597)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!557081 () array!78989)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14842 0))(
  ( (ValueCellFull!14842 (v!18270 V!46597)) (EmptyCell!14842) )
))
(declare-datatypes ((array!78991 0))(
  ( (array!78992 (arr!38122 (Array (_ BitVec 32) ValueCell!14842)) (size!38658 (_ BitVec 32))) )
))
(declare-fun lt!557069 () array!78991)

(declare-fun minValue!944 () V!46597)

(declare-fun getCurrentListMapNoExtraKeys!5478 (array!78989 array!78991 (_ BitVec 32) (_ BitVec 32) V!46597 V!46597 (_ BitVec 32) Int) ListLongMap!18081)

(assert (=> b!1223769 (= lt!557067 (getCurrentListMapNoExtraKeys!5478 lt!557081 lt!557069 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78991)

(assert (=> b!1223769 (= lt!557074 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40544 0))(
  ( (Unit!40545) )
))
(declare-fun lt!557068 () Unit!40544)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1165 (array!78989 array!78991 (_ BitVec 32) (_ BitVec 32) V!46597 V!46597 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40544)

(assert (=> b!1223769 (= lt!557068 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1165 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223770 () Bool)

(declare-fun e!695040 () Bool)

(assert (=> b!1223770 (= e!695040 e!695033)))

(declare-fun res!813138 () Bool)

(assert (=> b!1223770 (=> res!813138 e!695033)))

(assert (=> b!1223770 (= res!813138 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!557071 () ListLongMap!18081)

(assert (=> b!1223770 (= lt!557071 (getCurrentListMapNoExtraKeys!5478 lt!557081 lt!557069 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!557078 () V!46597)

(assert (=> b!1223770 (= lt!557069 (array!78992 (store (arr!38122 _values!996) i!673 (ValueCellFull!14842 lt!557078)) (size!38658 _values!996)))))

(declare-fun dynLambda!3351 (Int (_ BitVec 64)) V!46597)

(assert (=> b!1223770 (= lt!557078 (dynLambda!3351 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557072 () ListLongMap!18081)

(assert (=> b!1223770 (= lt!557072 (getCurrentListMapNoExtraKeys!5478 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223771 () Bool)

(declare-fun e!695038 () Bool)

(declare-fun e!695042 () Bool)

(assert (=> b!1223771 (= e!695038 (and e!695042 mapRes!48553))))

(declare-fun condMapEmpty!48553 () Bool)

(declare-fun mapDefault!48553 () ValueCell!14842)

