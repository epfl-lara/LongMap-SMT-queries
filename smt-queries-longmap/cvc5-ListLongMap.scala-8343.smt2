; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101542 () Bool)

(assert start!101542)

(declare-fun b_free!26329 () Bool)

(declare-fun b_next!26329 () Bool)

(assert (=> start!101542 (= b_free!26329 (not b_next!26329))))

(declare-fun tp!92024 () Bool)

(declare-fun b_and!43865 () Bool)

(assert (=> start!101542 (= tp!92024 b_and!43865)))

(declare-fun b!1221057 () Bool)

(declare-fun e!693391 () Bool)

(declare-fun e!693393 () Bool)

(assert (=> b!1221057 (= e!693391 e!693393)))

(declare-fun res!811182 () Bool)

(assert (=> b!1221057 (=> res!811182 e!693393)))

(declare-datatypes ((array!78845 0))(
  ( (array!78846 (arr!38052 (Array (_ BitVec 32) (_ BitVec 64))) (size!38588 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78845)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1221057 (= res!811182 (not (= (select (arr!38052 _keys!1208) from!1455) k!934)))))

(declare-fun e!693395 () Bool)

(assert (=> b!1221057 e!693395))

(declare-fun res!811187 () Bool)

(assert (=> b!1221057 (=> (not res!811187) (not e!693395))))

(declare-datatypes ((V!46505 0))(
  ( (V!46506 (val!15573 Int)) )
))
(declare-datatypes ((tuple2!20050 0))(
  ( (tuple2!20051 (_1!10036 (_ BitVec 64)) (_2!10036 V!46505)) )
))
(declare-datatypes ((List!26851 0))(
  ( (Nil!26848) (Cons!26847 (h!28056 tuple2!20050) (t!40160 List!26851)) )
))
(declare-datatypes ((ListLongMap!18019 0))(
  ( (ListLongMap!18020 (toList!9025 List!26851)) )
))
(declare-fun lt!555385 () ListLongMap!18019)

(declare-fun lt!555383 () V!46505)

(declare-datatypes ((ValueCell!14807 0))(
  ( (ValueCellFull!14807 (v!18231 V!46505)) (EmptyCell!14807) )
))
(declare-datatypes ((array!78847 0))(
  ( (array!78848 (arr!38053 (Array (_ BitVec 32) ValueCell!14807)) (size!38589 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78847)

(declare-fun lt!555379 () ListLongMap!18019)

(declare-fun +!4090 (ListLongMap!18019 tuple2!20050) ListLongMap!18019)

(declare-fun get!19417 (ValueCell!14807 V!46505) V!46505)

(assert (=> b!1221057 (= res!811187 (= lt!555379 (+!4090 lt!555385 (tuple2!20051 (select (arr!38052 _keys!1208) from!1455) (get!19417 (select (arr!38053 _values!996) from!1455) lt!555383)))))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!693397 () Bool)

(declare-fun b!1221058 () Bool)

(declare-fun arrayContainsKey!0 (array!78845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1221058 (= e!693397 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1221059 () Bool)

(declare-fun res!811197 () Bool)

(declare-fun e!693387 () Bool)

(assert (=> b!1221059 (=> (not res!811197) (not e!693387))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1221059 (= res!811197 (and (= (size!38589 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38588 _keys!1208) (size!38589 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1221060 () Bool)

(declare-fun res!811184 () Bool)

(assert (=> b!1221060 (=> (not res!811184) (not e!693387))))

(assert (=> b!1221060 (= res!811184 (= (select (arr!38052 _keys!1208) i!673) k!934))))

(declare-fun b!1221061 () Bool)

(declare-fun e!693385 () Bool)

(declare-fun tp_is_empty!31033 () Bool)

(assert (=> b!1221061 (= e!693385 tp_is_empty!31033)))

(declare-fun b!1221062 () Bool)

(declare-fun res!811196 () Bool)

(declare-fun e!693394 () Bool)

(assert (=> b!1221062 (=> (not res!811196) (not e!693394))))

(declare-fun lt!555378 () array!78845)

(declare-datatypes ((List!26852 0))(
  ( (Nil!26849) (Cons!26848 (h!28057 (_ BitVec 64)) (t!40161 List!26852)) )
))
(declare-fun arrayNoDuplicates!0 (array!78845 (_ BitVec 32) List!26852) Bool)

(assert (=> b!1221062 (= res!811196 (arrayNoDuplicates!0 lt!555378 #b00000000000000000000000000000000 Nil!26849))))

(declare-fun b!1221063 () Bool)

(declare-fun e!693389 () Bool)

(assert (=> b!1221063 (= e!693394 (not e!693389))))

(declare-fun res!811190 () Bool)

(assert (=> b!1221063 (=> res!811190 e!693389)))

(assert (=> b!1221063 (= res!811190 (bvsgt from!1455 i!673))))

(assert (=> b!1221063 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40454 0))(
  ( (Unit!40455) )
))
(declare-fun lt!555382 () Unit!40454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78845 (_ BitVec 64) (_ BitVec 32)) Unit!40454)

(assert (=> b!1221063 (= lt!555382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1221064 () Bool)

(assert (=> b!1221064 (= e!693395 e!693397)))

(declare-fun res!811186 () Bool)

(assert (=> b!1221064 (=> res!811186 e!693397)))

(assert (=> b!1221064 (= res!811186 (not (= (select (arr!38052 _keys!1208) from!1455) k!934)))))

(declare-fun b!1221065 () Bool)

(declare-fun res!811185 () Bool)

(assert (=> b!1221065 (=> (not res!811185) (not e!693387))))

(assert (=> b!1221065 (= res!811185 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38588 _keys!1208))))))

(declare-fun mapNonEmpty!48439 () Bool)

(declare-fun mapRes!48439 () Bool)

(declare-fun tp!92023 () Bool)

(declare-fun e!693390 () Bool)

(assert (=> mapNonEmpty!48439 (= mapRes!48439 (and tp!92023 e!693390))))

(declare-fun mapValue!48439 () ValueCell!14807)

(declare-fun mapRest!48439 () (Array (_ BitVec 32) ValueCell!14807))

(declare-fun mapKey!48439 () (_ BitVec 32))

(assert (=> mapNonEmpty!48439 (= (arr!38053 _values!996) (store mapRest!48439 mapKey!48439 mapValue!48439))))

(declare-fun b!1221066 () Bool)

(declare-fun e!693386 () Bool)

(assert (=> b!1221066 (= e!693386 (and e!693385 mapRes!48439))))

(declare-fun condMapEmpty!48439 () Bool)

(declare-fun mapDefault!48439 () ValueCell!14807)

