; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101292 () Bool)

(assert start!101292)

(declare-fun b_free!26215 () Bool)

(declare-fun b_next!26215 () Bool)

(assert (=> start!101292 (= b_free!26215 (not b_next!26215))))

(declare-fun tp!91667 () Bool)

(declare-fun b_and!43547 () Bool)

(assert (=> start!101292 (= tp!91667 b_and!43547)))

(declare-fun mapIsEmpty!48253 () Bool)

(declare-fun mapRes!48253 () Bool)

(assert (=> mapIsEmpty!48253 mapRes!48253))

(declare-fun b!1217080 () Bool)

(declare-fun res!808254 () Bool)

(declare-fun e!690965 () Bool)

(assert (=> b!1217080 (=> (not res!808254) (not e!690965))))

(declare-datatypes ((array!78609 0))(
  ( (array!78610 (arr!37939 (Array (_ BitVec 32) (_ BitVec 64))) (size!38475 (_ BitVec 32))) )
))
(declare-fun lt!553143 () array!78609)

(declare-datatypes ((List!26752 0))(
  ( (Nil!26749) (Cons!26748 (h!27957 (_ BitVec 64)) (t!39947 List!26752)) )
))
(declare-fun arrayNoDuplicates!0 (array!78609 (_ BitVec 32) List!26752) Bool)

(assert (=> b!1217080 (= res!808254 (arrayNoDuplicates!0 lt!553143 #b00000000000000000000000000000000 Nil!26749))))

(declare-fun b!1217081 () Bool)

(declare-fun e!690972 () Bool)

(declare-fun e!690973 () Bool)

(assert (=> b!1217081 (= e!690972 e!690973)))

(declare-fun res!808261 () Bool)

(assert (=> b!1217081 (=> res!808261 e!690973)))

(declare-fun _keys!1208 () array!78609)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217081 (= res!808261 (not (validKeyInArray!0 (select (arr!37939 _keys!1208) from!1455))))))

(declare-datatypes ((V!46353 0))(
  ( (V!46354 (val!15516 Int)) )
))
(declare-datatypes ((tuple2!19948 0))(
  ( (tuple2!19949 (_1!9985 (_ BitVec 64)) (_2!9985 V!46353)) )
))
(declare-datatypes ((List!26753 0))(
  ( (Nil!26750) (Cons!26749 (h!27958 tuple2!19948) (t!39948 List!26753)) )
))
(declare-datatypes ((ListLongMap!17917 0))(
  ( (ListLongMap!17918 (toList!8974 List!26753)) )
))
(declare-fun lt!553145 () ListLongMap!17917)

(declare-fun lt!553144 () ListLongMap!17917)

(assert (=> b!1217081 (= lt!553145 lt!553144)))

(declare-fun lt!553152 () ListLongMap!17917)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1891 (ListLongMap!17917 (_ BitVec 64)) ListLongMap!17917)

(assert (=> b!1217081 (= lt!553144 (-!1891 lt!553152 k!934))))

(declare-fun zeroValue!944 () V!46353)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46353)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14750 0))(
  ( (ValueCellFull!14750 (v!18169 V!46353)) (EmptyCell!14750) )
))
(declare-datatypes ((array!78611 0))(
  ( (array!78612 (arr!37940 (Array (_ BitVec 32) ValueCell!14750)) (size!38476 (_ BitVec 32))) )
))
(declare-fun lt!553149 () array!78611)

(declare-fun getCurrentListMapNoExtraKeys!5401 (array!78609 array!78611 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) Int) ListLongMap!17917)

(assert (=> b!1217081 (= lt!553145 (getCurrentListMapNoExtraKeys!5401 lt!553143 lt!553149 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78611)

(assert (=> b!1217081 (= lt!553152 (getCurrentListMapNoExtraKeys!5401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!40354 0))(
  ( (Unit!40355) )
))
(declare-fun lt!553146 () Unit!40354)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1098 (array!78609 array!78611 (_ BitVec 32) (_ BitVec 32) V!46353 V!46353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40354)

(assert (=> b!1217081 (= lt!553146 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1098 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217082 () Bool)

(declare-fun e!690970 () Bool)

(assert (=> b!1217082 (= e!690970 e!690965)))

(declare-fun res!808264 () Bool)

(assert (=> b!1217082 (=> (not res!808264) (not e!690965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78609 (_ BitVec 32)) Bool)

(assert (=> b!1217082 (= res!808264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553143 mask!1564))))

(assert (=> b!1217082 (= lt!553143 (array!78610 (store (arr!37939 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38475 _keys!1208)))))

(declare-fun b!1217083 () Bool)

(declare-fun res!808265 () Bool)

(assert (=> b!1217083 (=> (not res!808265) (not e!690970))))

(assert (=> b!1217083 (= res!808265 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26749))))

(declare-fun b!1217084 () Bool)

(declare-fun res!808262 () Bool)

(assert (=> b!1217084 (=> (not res!808262) (not e!690970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217084 (= res!808262 (validMask!0 mask!1564))))

(declare-fun b!1217085 () Bool)

(declare-fun e!690966 () Bool)

(declare-fun tp_is_empty!30919 () Bool)

(assert (=> b!1217085 (= e!690966 tp_is_empty!30919)))

(declare-fun b!1217086 () Bool)

(declare-fun e!690971 () Bool)

(assert (=> b!1217086 (= e!690971 e!690972)))

(declare-fun res!808263 () Bool)

(assert (=> b!1217086 (=> res!808263 e!690972)))

(assert (=> b!1217086 (= res!808263 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553148 () ListLongMap!17917)

(assert (=> b!1217086 (= lt!553148 (getCurrentListMapNoExtraKeys!5401 lt!553143 lt!553149 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553147 () V!46353)

(assert (=> b!1217086 (= lt!553149 (array!78612 (store (arr!37940 _values!996) i!673 (ValueCellFull!14750 lt!553147)) (size!38476 _values!996)))))

(declare-fun dynLambda!3288 (Int (_ BitVec 64)) V!46353)

(assert (=> b!1217086 (= lt!553147 (dynLambda!3288 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553150 () ListLongMap!17917)

(assert (=> b!1217086 (= lt!553150 (getCurrentListMapNoExtraKeys!5401 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217087 () Bool)

(declare-fun e!690968 () Bool)

(assert (=> b!1217087 (= e!690968 tp_is_empty!30919)))

(declare-fun b!1217088 () Bool)

(declare-fun res!808257 () Bool)

(assert (=> b!1217088 (=> (not res!808257) (not e!690970))))

(assert (=> b!1217088 (= res!808257 (validKeyInArray!0 k!934))))

(declare-fun b!1217089 () Bool)

(declare-fun res!808260 () Bool)

(assert (=> b!1217089 (=> (not res!808260) (not e!690970))))

(assert (=> b!1217089 (= res!808260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217090 () Bool)

(declare-fun res!808253 () Bool)

(assert (=> b!1217090 (=> (not res!808253) (not e!690970))))

(assert (=> b!1217090 (= res!808253 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38475 _keys!1208))))))

(declare-fun b!1217091 () Bool)

(declare-fun +!4047 (ListLongMap!17917 tuple2!19948) ListLongMap!17917)

(declare-fun get!19326 (ValueCell!14750 V!46353) V!46353)

(assert (=> b!1217091 (= e!690973 (= lt!553148 (+!4047 lt!553144 (tuple2!19949 (select (arr!37939 _keys!1208) from!1455) (get!19326 (select (arr!37940 _values!996) from!1455) lt!553147)))))))

(declare-fun b!1217092 () Bool)

(assert (=> b!1217092 (= e!690965 (not e!690971))))

(declare-fun res!808258 () Bool)

(assert (=> b!1217092 (=> res!808258 e!690971)))

(assert (=> b!1217092 (= res!808258 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217092 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!553151 () Unit!40354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78609 (_ BitVec 64) (_ BitVec 32)) Unit!40354)

(assert (=> b!1217092 (= lt!553151 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217093 () Bool)

(declare-fun e!690967 () Bool)

(assert (=> b!1217093 (= e!690967 (and e!690968 mapRes!48253))))

(declare-fun condMapEmpty!48253 () Bool)

(declare-fun mapDefault!48253 () ValueCell!14750)

