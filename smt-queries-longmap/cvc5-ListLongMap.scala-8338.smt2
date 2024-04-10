; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101482 () Bool)

(assert start!101482)

(declare-fun b_free!26299 () Bool)

(declare-fun b_next!26299 () Bool)

(assert (=> start!101482 (= b_free!26299 (not b_next!26299))))

(declare-fun tp!91931 () Bool)

(declare-fun b_and!43787 () Bool)

(assert (=> start!101482 (= tp!91931 b_and!43787)))

(declare-fun mapNonEmpty!48391 () Bool)

(declare-fun mapRes!48391 () Bool)

(declare-fun tp!91930 () Bool)

(declare-fun e!692745 () Bool)

(assert (=> mapNonEmpty!48391 (= mapRes!48391 (and tp!91930 e!692745))))

(declare-datatypes ((V!46465 0))(
  ( (V!46466 (val!15558 Int)) )
))
(declare-datatypes ((ValueCell!14792 0))(
  ( (ValueCellFull!14792 (v!18215 V!46465)) (EmptyCell!14792) )
))
(declare-fun mapValue!48391 () ValueCell!14792)

(declare-fun mapRest!48391 () (Array (_ BitVec 32) ValueCell!14792))

(declare-datatypes ((array!78783 0))(
  ( (array!78784 (arr!38022 (Array (_ BitVec 32) ValueCell!14792)) (size!38558 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78783)

(declare-fun mapKey!48391 () (_ BitVec 32))

(assert (=> mapNonEmpty!48391 (= (arr!38022 _values!996) (store mapRest!48391 mapKey!48391 mapValue!48391))))

(declare-fun b!1220019 () Bool)

(declare-fun res!810408 () Bool)

(declare-fun e!692743 () Bool)

(assert (=> b!1220019 (=> (not res!810408) (not e!692743))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220019 (= res!810408 (validMask!0 mask!1564))))

(declare-fun b!1220020 () Bool)

(declare-fun tp_is_empty!31003 () Bool)

(assert (=> b!1220020 (= e!692745 tp_is_empty!31003)))

(declare-fun b!1220021 () Bool)

(declare-fun e!692744 () Bool)

(declare-fun e!692752 () Bool)

(assert (=> b!1220021 (= e!692744 e!692752)))

(declare-fun res!810395 () Bool)

(assert (=> b!1220021 (=> res!810395 e!692752)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1220021 (= res!810395 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!554761 () array!78783)

(declare-datatypes ((array!78785 0))(
  ( (array!78786 (arr!38023 (Array (_ BitVec 32) (_ BitVec 64))) (size!38559 (_ BitVec 32))) )
))
(declare-fun lt!554760 () array!78785)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20026 0))(
  ( (tuple2!20027 (_1!10024 (_ BitVec 64)) (_2!10024 V!46465)) )
))
(declare-datatypes ((List!26826 0))(
  ( (Nil!26823) (Cons!26822 (h!28031 tuple2!20026) (t!40105 List!26826)) )
))
(declare-datatypes ((ListLongMap!17995 0))(
  ( (ListLongMap!17996 (toList!9013 List!26826)) )
))
(declare-fun lt!554762 () ListLongMap!17995)

(declare-fun minValue!944 () V!46465)

(declare-fun getCurrentListMapNoExtraKeys!5436 (array!78785 array!78783 (_ BitVec 32) (_ BitVec 32) V!46465 V!46465 (_ BitVec 32) Int) ListLongMap!17995)

(assert (=> b!1220021 (= lt!554762 (getCurrentListMapNoExtraKeys!5436 lt!554760 lt!554761 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554763 () V!46465)

(assert (=> b!1220021 (= lt!554761 (array!78784 (store (arr!38022 _values!996) i!673 (ValueCellFull!14792 lt!554763)) (size!38558 _values!996)))))

(declare-fun dynLambda!3318 (Int (_ BitVec 64)) V!46465)

(assert (=> b!1220021 (= lt!554763 (dynLambda!3318 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78785)

(declare-fun lt!554765 () ListLongMap!17995)

(assert (=> b!1220021 (= lt!554765 (getCurrentListMapNoExtraKeys!5436 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48391 () Bool)

(assert (=> mapIsEmpty!48391 mapRes!48391))

(declare-fun b!1220022 () Bool)

(declare-fun e!692750 () Bool)

(assert (=> b!1220022 (= e!692750 tp_is_empty!31003)))

(declare-fun b!1220023 () Bool)

(declare-fun e!692746 () Bool)

(assert (=> b!1220023 (= e!692743 e!692746)))

(declare-fun res!810402 () Bool)

(assert (=> b!1220023 (=> (not res!810402) (not e!692746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78785 (_ BitVec 32)) Bool)

(assert (=> b!1220023 (= res!810402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554760 mask!1564))))

(assert (=> b!1220023 (= lt!554760 (array!78786 (store (arr!38023 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38559 _keys!1208)))))

(declare-fun b!1220024 () Bool)

(declare-fun res!810403 () Bool)

(assert (=> b!1220024 (=> (not res!810403) (not e!692746))))

(declare-datatypes ((List!26827 0))(
  ( (Nil!26824) (Cons!26823 (h!28032 (_ BitVec 64)) (t!40106 List!26827)) )
))
(declare-fun arrayNoDuplicates!0 (array!78785 (_ BitVec 32) List!26827) Bool)

(assert (=> b!1220024 (= res!810403 (arrayNoDuplicates!0 lt!554760 #b00000000000000000000000000000000 Nil!26824))))

(declare-fun b!1220025 () Bool)

(assert (=> b!1220025 (= e!692746 (not e!692744))))

(declare-fun res!810399 () Bool)

(assert (=> b!1220025 (=> res!810399 e!692744)))

(assert (=> b!1220025 (= res!810399 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220025 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40428 0))(
  ( (Unit!40429) )
))
(declare-fun lt!554755 () Unit!40428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78785 (_ BitVec 64) (_ BitVec 32)) Unit!40428)

(assert (=> b!1220025 (= lt!554755 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220026 () Bool)

(declare-fun res!810394 () Bool)

(assert (=> b!1220026 (=> (not res!810394) (not e!692743))))

(assert (=> b!1220026 (= res!810394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220027 () Bool)

(declare-fun res!810398 () Bool)

(assert (=> b!1220027 (=> (not res!810398) (not e!692743))))

(assert (=> b!1220027 (= res!810398 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26824))))

(declare-fun b!1220028 () Bool)

(declare-fun e!692749 () Bool)

(declare-fun e!692751 () Bool)

(assert (=> b!1220028 (= e!692749 e!692751)))

(declare-fun res!810407 () Bool)

(assert (=> b!1220028 (=> res!810407 e!692751)))

(assert (=> b!1220028 (= res!810407 (not (= (select (arr!38023 _keys!1208) from!1455) k!934)))))

(declare-fun e!692748 () Bool)

(assert (=> b!1220028 e!692748))

(declare-fun res!810406 () Bool)

(assert (=> b!1220028 (=> (not res!810406) (not e!692748))))

(declare-fun lt!554759 () ListLongMap!17995)

(declare-fun +!4081 (ListLongMap!17995 tuple2!20026) ListLongMap!17995)

(declare-fun get!19396 (ValueCell!14792 V!46465) V!46465)

(assert (=> b!1220028 (= res!810406 (= lt!554762 (+!4081 lt!554759 (tuple2!20027 (select (arr!38023 _keys!1208) from!1455) (get!19396 (select (arr!38022 _values!996) from!1455) lt!554763)))))))

(declare-fun b!1220029 () Bool)

(declare-fun e!692747 () Bool)

(assert (=> b!1220029 (= e!692747 (and e!692750 mapRes!48391))))

(declare-fun condMapEmpty!48391 () Bool)

(declare-fun mapDefault!48391 () ValueCell!14792)

