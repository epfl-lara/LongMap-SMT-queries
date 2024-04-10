; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101366 () Bool)

(assert start!101366)

(declare-fun b_free!26237 () Bool)

(declare-fun b_next!26237 () Bool)

(assert (=> start!101366 (= b_free!26237 (not b_next!26237))))

(declare-fun tp!91738 () Bool)

(declare-fun b_and!43627 () Bool)

(assert (=> start!101366 (= tp!91738 b_and!43627)))

(declare-fun b!1217943 () Bool)

(declare-fun res!808827 () Bool)

(declare-fun e!691484 () Bool)

(assert (=> b!1217943 (=> (not res!808827) (not e!691484))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217943 (= res!808827 (validMask!0 mask!1564))))

(declare-fun b!1217944 () Bool)

(declare-fun res!808833 () Bool)

(assert (=> b!1217944 (=> (not res!808833) (not e!691484))))

(declare-datatypes ((array!78657 0))(
  ( (array!78658 (arr!37961 (Array (_ BitVec 32) (_ BitVec 64))) (size!38497 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78657)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78657 (_ BitVec 32)) Bool)

(assert (=> b!1217944 (= res!808833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217945 () Bool)

(declare-fun e!691485 () Bool)

(declare-fun e!691483 () Bool)

(assert (=> b!1217945 (= e!691485 e!691483)))

(declare-fun res!808841 () Bool)

(assert (=> b!1217945 (=> res!808841 e!691483)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217945 (= res!808841 (not (validKeyInArray!0 (select (arr!37961 _keys!1208) from!1455))))))

(declare-datatypes ((V!46381 0))(
  ( (V!46382 (val!15527 Int)) )
))
(declare-datatypes ((tuple2!19970 0))(
  ( (tuple2!19971 (_1!9996 (_ BitVec 64)) (_2!9996 V!46381)) )
))
(declare-datatypes ((List!26774 0))(
  ( (Nil!26771) (Cons!26770 (h!27979 tuple2!19970) (t!39991 List!26774)) )
))
(declare-datatypes ((ListLongMap!17939 0))(
  ( (ListLongMap!17940 (toList!8985 List!26774)) )
))
(declare-fun lt!553630 () ListLongMap!17939)

(declare-fun lt!553632 () ListLongMap!17939)

(assert (=> b!1217945 (= lt!553630 lt!553632)))

(declare-fun lt!553623 () ListLongMap!17939)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1901 (ListLongMap!17939 (_ BitVec 64)) ListLongMap!17939)

(assert (=> b!1217945 (= lt!553632 (-!1901 lt!553623 k!934))))

(declare-fun zeroValue!944 () V!46381)

(declare-fun lt!553625 () array!78657)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14761 0))(
  ( (ValueCellFull!14761 (v!18182 V!46381)) (EmptyCell!14761) )
))
(declare-datatypes ((array!78659 0))(
  ( (array!78660 (arr!37962 (Array (_ BitVec 32) ValueCell!14761)) (size!38498 (_ BitVec 32))) )
))
(declare-fun lt!553628 () array!78659)

(declare-fun minValue!944 () V!46381)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5412 (array!78657 array!78659 (_ BitVec 32) (_ BitVec 32) V!46381 V!46381 (_ BitVec 32) Int) ListLongMap!17939)

(assert (=> b!1217945 (= lt!553630 (getCurrentListMapNoExtraKeys!5412 lt!553625 lt!553628 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78659)

(assert (=> b!1217945 (= lt!553623 (getCurrentListMapNoExtraKeys!5412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40374 0))(
  ( (Unit!40375) )
))
(declare-fun lt!553631 () Unit!40374)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1108 (array!78657 array!78659 (_ BitVec 32) (_ BitVec 32) V!46381 V!46381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40374)

(assert (=> b!1217945 (= lt!553631 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1108 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217946 () Bool)

(declare-fun e!691482 () Bool)

(declare-fun tp_is_empty!30941 () Bool)

(assert (=> b!1217946 (= e!691482 tp_is_empty!30941)))

(declare-fun b!1217947 () Bool)

(declare-fun res!808831 () Bool)

(assert (=> b!1217947 (=> (not res!808831) (not e!691484))))

(assert (=> b!1217947 (= res!808831 (= (select (arr!37961 _keys!1208) i!673) k!934))))

(declare-fun b!1217948 () Bool)

(declare-fun e!691487 () Bool)

(assert (=> b!1217948 (= e!691487 tp_is_empty!30941)))

(declare-fun mapNonEmpty!48292 () Bool)

(declare-fun mapRes!48292 () Bool)

(declare-fun tp!91739 () Bool)

(assert (=> mapNonEmpty!48292 (= mapRes!48292 (and tp!91739 e!691482))))

(declare-fun mapValue!48292 () ValueCell!14761)

(declare-fun mapRest!48292 () (Array (_ BitVec 32) ValueCell!14761))

(declare-fun mapKey!48292 () (_ BitVec 32))

(assert (=> mapNonEmpty!48292 (= (arr!37962 _values!996) (store mapRest!48292 mapKey!48292 mapValue!48292))))

(declare-fun b!1217949 () Bool)

(assert (=> b!1217949 (= e!691483 true)))

(declare-fun e!691480 () Bool)

(assert (=> b!1217949 e!691480))

(declare-fun res!808835 () Bool)

(assert (=> b!1217949 (=> (not res!808835) (not e!691480))))

(declare-fun lt!553626 () ListLongMap!17939)

(declare-fun lt!553629 () V!46381)

(declare-fun +!4056 (ListLongMap!17939 tuple2!19970) ListLongMap!17939)

(declare-fun get!19345 (ValueCell!14761 V!46381) V!46381)

(assert (=> b!1217949 (= res!808835 (= lt!553626 (+!4056 lt!553632 (tuple2!19971 (select (arr!37961 _keys!1208) from!1455) (get!19345 (select (arr!37962 _values!996) from!1455) lt!553629)))))))

(declare-fun b!1217950 () Bool)

(declare-fun e!691479 () Bool)

(assert (=> b!1217950 (= e!691479 (and e!691487 mapRes!48292))))

(declare-fun condMapEmpty!48292 () Bool)

(declare-fun mapDefault!48292 () ValueCell!14761)

