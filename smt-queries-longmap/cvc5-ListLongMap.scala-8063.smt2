; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99218 () Bool)

(assert start!99218)

(declare-fun b_free!24823 () Bool)

(declare-fun b_next!24823 () Bool)

(assert (=> start!99218 (= b_free!24823 (not b_next!24823))))

(declare-fun tp!87180 () Bool)

(declare-fun b_and!40495 () Bool)

(assert (=> start!99218 (= tp!87180 b_and!40495)))

(declare-fun b!1168405 () Bool)

(declare-fun res!775200 () Bool)

(declare-fun e!664046 () Bool)

(assert (=> b!1168405 (=> (not res!775200) (not e!664046))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75527 0))(
  ( (array!75528 (arr!36414 (Array (_ BitVec 32) (_ BitVec 64))) (size!36950 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75527)

(assert (=> b!1168405 (= res!775200 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36950 _keys!1208))))))

(declare-fun b!1168406 () Bool)

(declare-fun res!775202 () Bool)

(assert (=> b!1168406 (=> (not res!775202) (not e!664046))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44265 0))(
  ( (V!44266 (val!14733 Int)) )
))
(declare-datatypes ((ValueCell!13967 0))(
  ( (ValueCellFull!13967 (v!17370 V!44265)) (EmptyCell!13967) )
))
(declare-datatypes ((array!75529 0))(
  ( (array!75530 (arr!36415 (Array (_ BitVec 32) ValueCell!13967)) (size!36951 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75529)

(assert (=> b!1168406 (= res!775202 (and (= (size!36951 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36950 _keys!1208) (size!36951 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168407 () Bool)

(declare-fun e!664050 () Bool)

(declare-fun e!664052 () Bool)

(assert (=> b!1168407 (= e!664050 (not e!664052))))

(declare-fun res!775208 () Bool)

(assert (=> b!1168407 (=> res!775208 e!664052)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168407 (= res!775208 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168407 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38554 0))(
  ( (Unit!38555) )
))
(declare-fun lt!526014 () Unit!38554)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75527 (_ BitVec 64) (_ BitVec 32)) Unit!38554)

(assert (=> b!1168407 (= lt!526014 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1168408 () Bool)

(declare-fun e!664047 () Bool)

(assert (=> b!1168408 (= e!664052 e!664047)))

(declare-fun res!775204 () Bool)

(assert (=> b!1168408 (=> res!775204 e!664047)))

(assert (=> b!1168408 (= res!775204 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44265)

(declare-fun lt!526015 () array!75527)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44265)

(declare-datatypes ((tuple2!18802 0))(
  ( (tuple2!18803 (_1!9412 (_ BitVec 64)) (_2!9412 V!44265)) )
))
(declare-datatypes ((List!25542 0))(
  ( (Nil!25539) (Cons!25538 (h!26747 tuple2!18802) (t!37357 List!25542)) )
))
(declare-datatypes ((ListLongMap!16771 0))(
  ( (ListLongMap!16772 (toList!8401 List!25542)) )
))
(declare-fun lt!526009 () ListLongMap!16771)

(declare-fun lt!526010 () array!75529)

(declare-fun getCurrentListMapNoExtraKeys!4865 (array!75527 array!75529 (_ BitVec 32) (_ BitVec 32) V!44265 V!44265 (_ BitVec 32) Int) ListLongMap!16771)

(assert (=> b!1168408 (= lt!526009 (getCurrentListMapNoExtraKeys!4865 lt!526015 lt!526010 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526012 () V!44265)

(assert (=> b!1168408 (= lt!526010 (array!75530 (store (arr!36415 _values!996) i!673 (ValueCellFull!13967 lt!526012)) (size!36951 _values!996)))))

(declare-fun dynLambda!2846 (Int (_ BitVec 64)) V!44265)

(assert (=> b!1168408 (= lt!526012 (dynLambda!2846 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526008 () ListLongMap!16771)

(assert (=> b!1168408 (= lt!526008 (getCurrentListMapNoExtraKeys!4865 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168409 () Bool)

(declare-fun res!775203 () Bool)

(assert (=> b!1168409 (=> (not res!775203) (not e!664050))))

(declare-datatypes ((List!25543 0))(
  ( (Nil!25540) (Cons!25539 (h!26748 (_ BitVec 64)) (t!37358 List!25543)) )
))
(declare-fun arrayNoDuplicates!0 (array!75527 (_ BitVec 32) List!25543) Bool)

(assert (=> b!1168409 (= res!775203 (arrayNoDuplicates!0 lt!526015 #b00000000000000000000000000000000 Nil!25540))))

(declare-fun b!1168410 () Bool)

(assert (=> b!1168410 (= e!664046 e!664050)))

(declare-fun res!775207 () Bool)

(assert (=> b!1168410 (=> (not res!775207) (not e!664050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75527 (_ BitVec 32)) Bool)

(assert (=> b!1168410 (= res!775207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526015 mask!1564))))

(assert (=> b!1168410 (= lt!526015 (array!75528 (store (arr!36414 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36950 _keys!1208)))))

(declare-fun b!1168411 () Bool)

(declare-fun res!775209 () Bool)

(assert (=> b!1168411 (=> (not res!775209) (not e!664046))))

(assert (=> b!1168411 (= res!775209 (= (select (arr!36414 _keys!1208) i!673) k!934))))

(declare-fun b!1168412 () Bool)

(declare-fun e!664048 () Bool)

(assert (=> b!1168412 (= e!664048 true)))

(declare-fun lt!526016 () ListLongMap!16771)

(declare-fun +!3737 (ListLongMap!16771 tuple2!18802) ListLongMap!16771)

(declare-fun get!18557 (ValueCell!13967 V!44265) V!44265)

(assert (=> b!1168412 (= lt!526009 (+!3737 lt!526016 (tuple2!18803 (select (arr!36414 _keys!1208) from!1455) (get!18557 (select (arr!36415 _values!996) from!1455) lt!526012))))))

(declare-fun b!1168413 () Bool)

(declare-fun res!775199 () Bool)

(assert (=> b!1168413 (=> (not res!775199) (not e!664046))))

(assert (=> b!1168413 (= res!775199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168414 () Bool)

(declare-fun res!775206 () Bool)

(assert (=> b!1168414 (=> (not res!775206) (not e!664046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168414 (= res!775206 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45854 () Bool)

(declare-fun mapRes!45854 () Bool)

(assert (=> mapIsEmpty!45854 mapRes!45854))

(declare-fun b!1168415 () Bool)

(declare-fun res!775210 () Bool)

(assert (=> b!1168415 (=> (not res!775210) (not e!664046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168415 (= res!775210 (validKeyInArray!0 k!934))))

(declare-fun b!1168416 () Bool)

(declare-fun e!664045 () Bool)

(declare-fun tp_is_empty!29353 () Bool)

(assert (=> b!1168416 (= e!664045 tp_is_empty!29353)))

(declare-fun b!1168417 () Bool)

(declare-fun e!664051 () Bool)

(declare-fun e!664053 () Bool)

(assert (=> b!1168417 (= e!664051 (and e!664053 mapRes!45854))))

(declare-fun condMapEmpty!45854 () Bool)

(declare-fun mapDefault!45854 () ValueCell!13967)

