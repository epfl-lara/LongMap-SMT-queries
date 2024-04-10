; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101296 () Bool)

(assert start!101296)

(declare-fun b_free!26219 () Bool)

(declare-fun b_next!26219 () Bool)

(assert (=> start!101296 (= b_free!26219 (not b_next!26219))))

(declare-fun tp!91678 () Bool)

(declare-fun b_and!43555 () Bool)

(assert (=> start!101296 (= tp!91678 b_and!43555)))

(declare-datatypes ((array!78617 0))(
  ( (array!78618 (arr!37943 (Array (_ BitVec 32) (_ BitVec 64))) (size!38479 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78617)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!691021 () Bool)

(declare-fun b!1217180 () Bool)

(declare-datatypes ((V!46357 0))(
  ( (V!46358 (val!15518 Int)) )
))
(declare-datatypes ((tuple2!19952 0))(
  ( (tuple2!19953 (_1!9987 (_ BitVec 64)) (_2!9987 V!46357)) )
))
(declare-datatypes ((List!26756 0))(
  ( (Nil!26753) (Cons!26752 (h!27961 tuple2!19952) (t!39955 List!26756)) )
))
(declare-datatypes ((ListLongMap!17921 0))(
  ( (ListLongMap!17922 (toList!8976 List!26756)) )
))
(declare-fun lt!553210 () ListLongMap!17921)

(declare-fun lt!553206 () ListLongMap!17921)

(declare-datatypes ((ValueCell!14752 0))(
  ( (ValueCellFull!14752 (v!18171 V!46357)) (EmptyCell!14752) )
))
(declare-datatypes ((array!78619 0))(
  ( (array!78620 (arr!37944 (Array (_ BitVec 32) ValueCell!14752)) (size!38480 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78619)

(declare-fun lt!553211 () V!46357)

(declare-fun +!4049 (ListLongMap!17921 tuple2!19952) ListLongMap!17921)

(declare-fun get!19328 (ValueCell!14752 V!46357) V!46357)

(assert (=> b!1217180 (= e!691021 (= lt!553210 (+!4049 lt!553206 (tuple2!19953 (select (arr!37943 _keys!1208) from!1455) (get!19328 (select (arr!37944 _values!996) from!1455) lt!553211)))))))

(declare-fun b!1217182 () Bool)

(declare-fun res!808339 () Bool)

(declare-fun e!691026 () Bool)

(assert (=> b!1217182 (=> (not res!808339) (not e!691026))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217182 (= res!808339 (validMask!0 mask!1564))))

(declare-fun b!1217183 () Bool)

(declare-fun e!691024 () Bool)

(assert (=> b!1217183 (= e!691026 e!691024)))

(declare-fun res!808340 () Bool)

(assert (=> b!1217183 (=> (not res!808340) (not e!691024))))

(declare-fun lt!553212 () array!78617)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78617 (_ BitVec 32)) Bool)

(assert (=> b!1217183 (= res!808340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553212 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217183 (= lt!553212 (array!78618 (store (arr!37943 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38479 _keys!1208)))))

(declare-fun b!1217184 () Bool)

(declare-fun e!691027 () Bool)

(declare-fun tp_is_empty!30923 () Bool)

(assert (=> b!1217184 (= e!691027 tp_is_empty!30923)))

(declare-fun b!1217185 () Bool)

(declare-fun res!808333 () Bool)

(assert (=> b!1217185 (=> (not res!808333) (not e!691026))))

(assert (=> b!1217185 (= res!808333 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38479 _keys!1208))))))

(declare-fun b!1217186 () Bool)

(declare-fun res!808331 () Bool)

(assert (=> b!1217186 (=> (not res!808331) (not e!691026))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1217186 (= res!808331 (= (select (arr!37943 _keys!1208) i!673) k!934))))

(declare-fun b!1217187 () Bool)

(declare-fun e!691022 () Bool)

(assert (=> b!1217187 (= e!691022 e!691021)))

(declare-fun res!808335 () Bool)

(assert (=> b!1217187 (=> res!808335 e!691021)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217187 (= res!808335 (not (validKeyInArray!0 (select (arr!37943 _keys!1208) from!1455))))))

(declare-fun lt!553207 () ListLongMap!17921)

(assert (=> b!1217187 (= lt!553207 lt!553206)))

(declare-fun lt!553205 () ListLongMap!17921)

(declare-fun -!1893 (ListLongMap!17921 (_ BitVec 64)) ListLongMap!17921)

(assert (=> b!1217187 (= lt!553206 (-!1893 lt!553205 k!934))))

(declare-fun zeroValue!944 () V!46357)

(declare-fun lt!553208 () array!78619)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46357)

(declare-fun getCurrentListMapNoExtraKeys!5403 (array!78617 array!78619 (_ BitVec 32) (_ BitVec 32) V!46357 V!46357 (_ BitVec 32) Int) ListLongMap!17921)

(assert (=> b!1217187 (= lt!553207 (getCurrentListMapNoExtraKeys!5403 lt!553212 lt!553208 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217187 (= lt!553205 (getCurrentListMapNoExtraKeys!5403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40358 0))(
  ( (Unit!40359) )
))
(declare-fun lt!553209 () Unit!40358)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1100 (array!78617 array!78619 (_ BitVec 32) (_ BitVec 32) V!46357 V!46357 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40358)

(assert (=> b!1217187 (= lt!553209 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1100 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217188 () Bool)

(declare-fun e!691023 () Bool)

(assert (=> b!1217188 (= e!691023 tp_is_empty!30923)))

(declare-fun b!1217189 () Bool)

(declare-fun res!808337 () Bool)

(assert (=> b!1217189 (=> (not res!808337) (not e!691026))))

(declare-datatypes ((List!26757 0))(
  ( (Nil!26754) (Cons!26753 (h!27962 (_ BitVec 64)) (t!39956 List!26757)) )
))
(declare-fun arrayNoDuplicates!0 (array!78617 (_ BitVec 32) List!26757) Bool)

(assert (=> b!1217189 (= res!808337 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26754))))

(declare-fun b!1217190 () Bool)

(declare-fun res!808334 () Bool)

(assert (=> b!1217190 (=> (not res!808334) (not e!691026))))

(assert (=> b!1217190 (= res!808334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217191 () Bool)

(declare-fun e!691020 () Bool)

(declare-fun mapRes!48259 () Bool)

(assert (=> b!1217191 (= e!691020 (and e!691027 mapRes!48259))))

(declare-fun condMapEmpty!48259 () Bool)

(declare-fun mapDefault!48259 () ValueCell!14752)

