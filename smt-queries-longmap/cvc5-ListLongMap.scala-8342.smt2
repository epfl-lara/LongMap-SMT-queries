; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101536 () Bool)

(assert start!101536)

(declare-fun b_free!26323 () Bool)

(declare-fun b_next!26323 () Bool)

(assert (=> start!101536 (= b_free!26323 (not b_next!26323))))

(declare-fun tp!92005 () Bool)

(declare-fun b_and!43853 () Bool)

(assert (=> start!101536 (= tp!92005 b_and!43853)))

(declare-fun b!1220878 () Bool)

(declare-fun e!693281 () Bool)

(declare-fun tp_is_empty!31027 () Bool)

(assert (=> b!1220878 (= e!693281 tp_is_empty!31027)))

(declare-fun b!1220879 () Bool)

(declare-fun e!693280 () Bool)

(declare-fun e!693283 () Bool)

(assert (=> b!1220879 (= e!693280 e!693283)))

(declare-fun res!811036 () Bool)

(assert (=> b!1220879 (=> res!811036 e!693283)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1220879 (= res!811036 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!46497 0))(
  ( (V!46498 (val!15570 Int)) )
))
(declare-datatypes ((tuple2!20046 0))(
  ( (tuple2!20047 (_1!10034 (_ BitVec 64)) (_2!10034 V!46497)) )
))
(declare-datatypes ((List!26846 0))(
  ( (Nil!26843) (Cons!26842 (h!28051 tuple2!20046) (t!40149 List!26846)) )
))
(declare-datatypes ((ListLongMap!18015 0))(
  ( (ListLongMap!18016 (toList!9023 List!26846)) )
))
(declare-fun lt!555275 () ListLongMap!18015)

(declare-fun zeroValue!944 () V!46497)

(declare-datatypes ((array!78833 0))(
  ( (array!78834 (arr!38046 (Array (_ BitVec 32) (_ BitVec 64))) (size!38582 (_ BitVec 32))) )
))
(declare-fun lt!555278 () array!78833)

(declare-datatypes ((ValueCell!14804 0))(
  ( (ValueCellFull!14804 (v!18228 V!46497)) (EmptyCell!14804) )
))
(declare-datatypes ((array!78835 0))(
  ( (array!78836 (arr!38047 (Array (_ BitVec 32) ValueCell!14804)) (size!38583 (_ BitVec 32))) )
))
(declare-fun lt!555272 () array!78835)

(declare-fun minValue!944 () V!46497)

(declare-fun getCurrentListMapNoExtraKeys!5446 (array!78833 array!78835 (_ BitVec 32) (_ BitVec 32) V!46497 V!46497 (_ BitVec 32) Int) ListLongMap!18015)

(assert (=> b!1220879 (= lt!555275 (getCurrentListMapNoExtraKeys!5446 lt!555278 lt!555272 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78835)

(declare-fun lt!555273 () V!46497)

(assert (=> b!1220879 (= lt!555272 (array!78836 (store (arr!38047 _values!996) i!673 (ValueCellFull!14804 lt!555273)) (size!38583 _values!996)))))

(declare-fun dynLambda!3326 (Int (_ BitVec 64)) V!46497)

(assert (=> b!1220879 (= lt!555273 (dynLambda!3326 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78833)

(declare-fun lt!555277 () ListLongMap!18015)

(assert (=> b!1220879 (= lt!555277 (getCurrentListMapNoExtraKeys!5446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220880 () Bool)

(declare-fun res!811050 () Bool)

(declare-fun e!693277 () Bool)

(assert (=> b!1220880 (=> (not res!811050) (not e!693277))))

(declare-datatypes ((List!26847 0))(
  ( (Nil!26844) (Cons!26843 (h!28052 (_ BitVec 64)) (t!40150 List!26847)) )
))
(declare-fun arrayNoDuplicates!0 (array!78833 (_ BitVec 32) List!26847) Bool)

(assert (=> b!1220880 (= res!811050 (arrayNoDuplicates!0 lt!555278 #b00000000000000000000000000000000 Nil!26844))))

(declare-fun b!1220881 () Bool)

(declare-fun res!811037 () Bool)

(declare-fun e!693276 () Bool)

(assert (=> b!1220881 (=> (not res!811037) (not e!693276))))

(assert (=> b!1220881 (= res!811037 (and (= (size!38583 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38582 _keys!1208) (size!38583 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220882 () Bool)

(declare-fun e!693285 () Bool)

(declare-fun e!693282 () Bool)

(assert (=> b!1220882 (= e!693285 e!693282)))

(declare-fun res!811038 () Bool)

(assert (=> b!1220882 (=> res!811038 e!693282)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1220882 (= res!811038 (not (= (select (arr!38046 _keys!1208) from!1455) k!934)))))

(declare-fun b!1220883 () Bool)

(declare-fun e!693275 () Bool)

(declare-fun e!693284 () Bool)

(assert (=> b!1220883 (= e!693275 e!693284)))

(declare-fun res!811048 () Bool)

(assert (=> b!1220883 (=> res!811048 e!693284)))

(assert (=> b!1220883 (= res!811048 (not (= (select (arr!38046 _keys!1208) from!1455) k!934)))))

(assert (=> b!1220883 e!693285))

(declare-fun res!811047 () Bool)

(assert (=> b!1220883 (=> (not res!811047) (not e!693285))))

(declare-fun lt!555271 () ListLongMap!18015)

(declare-fun +!4088 (ListLongMap!18015 tuple2!20046) ListLongMap!18015)

(declare-fun get!19413 (ValueCell!14804 V!46497) V!46497)

(assert (=> b!1220883 (= res!811047 (= lt!555275 (+!4088 lt!555271 (tuple2!20047 (select (arr!38046 _keys!1208) from!1455) (get!19413 (select (arr!38047 _values!996) from!1455) lt!555273)))))))

(declare-fun b!1220884 () Bool)

(declare-fun e!693278 () Bool)

(declare-fun mapRes!48430 () Bool)

(assert (=> b!1220884 (= e!693278 (and e!693281 mapRes!48430))))

(declare-fun condMapEmpty!48430 () Bool)

(declare-fun mapDefault!48430 () ValueCell!14804)

