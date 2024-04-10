; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101286 () Bool)

(assert start!101286)

(declare-fun b_free!26209 () Bool)

(declare-fun b_next!26209 () Bool)

(assert (=> start!101286 (= b_free!26209 (not b_next!26209))))

(declare-fun tp!91649 () Bool)

(declare-fun b_and!43535 () Bool)

(assert (=> start!101286 (= tp!91649 b_and!43535)))

(declare-fun b!1216930 () Bool)

(declare-fun e!690885 () Bool)

(declare-fun e!690887 () Bool)

(assert (=> b!1216930 (= e!690885 e!690887)))

(declare-fun res!808141 () Bool)

(assert (=> b!1216930 (=> res!808141 e!690887)))

(declare-datatypes ((array!78597 0))(
  ( (array!78598 (arr!37933 (Array (_ BitVec 32) (_ BitVec 64))) (size!38469 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78597)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216930 (= res!808141 (not (validKeyInArray!0 (select (arr!37933 _keys!1208) from!1455))))))

(declare-datatypes ((V!46345 0))(
  ( (V!46346 (val!15513 Int)) )
))
(declare-fun zeroValue!944 () V!46345)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!14747 0))(
  ( (ValueCellFull!14747 (v!18166 V!46345)) (EmptyCell!14747) )
))
(declare-datatypes ((array!78599 0))(
  ( (array!78600 (arr!37934 (Array (_ BitVec 32) ValueCell!14747)) (size!38470 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78599)

(declare-fun minValue!944 () V!46345)

(declare-fun lt!553083 () array!78597)

(declare-fun lt!553085 () array!78599)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19942 0))(
  ( (tuple2!19943 (_1!9982 (_ BitVec 64)) (_2!9982 V!46345)) )
))
(declare-datatypes ((List!26746 0))(
  ( (Nil!26743) (Cons!26742 (h!27951 tuple2!19942) (t!39935 List!26746)) )
))
(declare-datatypes ((ListLongMap!17911 0))(
  ( (ListLongMap!17912 (toList!8971 List!26746)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5398 (array!78597 array!78599 (_ BitVec 32) (_ BitVec 32) V!46345 V!46345 (_ BitVec 32) Int) ListLongMap!17911)

(declare-fun -!1888 (ListLongMap!17911 (_ BitVec 64)) ListLongMap!17911)

(assert (=> b!1216930 (= (getCurrentListMapNoExtraKeys!5398 lt!553083 lt!553085 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1888 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!40348 0))(
  ( (Unit!40349) )
))
(declare-fun lt!553081 () Unit!40348)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1095 (array!78597 array!78599 (_ BitVec 32) (_ BitVec 32) V!46345 V!46345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40348)

(assert (=> b!1216930 (= lt!553081 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1095 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216931 () Bool)

(declare-fun res!808144 () Bool)

(declare-fun e!690891 () Bool)

(assert (=> b!1216931 (=> (not res!808144) (not e!690891))))

(declare-datatypes ((List!26747 0))(
  ( (Nil!26744) (Cons!26743 (h!27952 (_ BitVec 64)) (t!39936 List!26747)) )
))
(declare-fun arrayNoDuplicates!0 (array!78597 (_ BitVec 32) List!26747) Bool)

(assert (=> b!1216931 (= res!808144 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26744))))

(declare-fun b!1216932 () Bool)

(declare-fun res!808143 () Bool)

(assert (=> b!1216932 (=> (not res!808143) (not e!690891))))

(assert (=> b!1216932 (= res!808143 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38469 _keys!1208))))))

(declare-fun b!1216933 () Bool)

(declare-fun e!690886 () Bool)

(declare-fun tp_is_empty!30913 () Bool)

(assert (=> b!1216933 (= e!690886 tp_is_empty!30913)))

(declare-fun b!1216934 () Bool)

(declare-fun res!808142 () Bool)

(assert (=> b!1216934 (=> (not res!808142) (not e!690891))))

(assert (=> b!1216934 (= res!808142 (= (select (arr!37933 _keys!1208) i!673) k!934))))

(declare-fun b!1216935 () Bool)

(declare-fun e!690888 () Bool)

(assert (=> b!1216935 (= e!690888 tp_is_empty!30913)))

(declare-fun mapIsEmpty!48244 () Bool)

(declare-fun mapRes!48244 () Bool)

(assert (=> mapIsEmpty!48244 mapRes!48244))

(declare-fun res!808148 () Bool)

(assert (=> start!101286 (=> (not res!808148) (not e!690891))))

(assert (=> start!101286 (= res!808148 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38469 _keys!1208))))))

(assert (=> start!101286 e!690891))

(assert (=> start!101286 tp_is_empty!30913))

(declare-fun array_inv!28878 (array!78597) Bool)

(assert (=> start!101286 (array_inv!28878 _keys!1208)))

(assert (=> start!101286 true))

(assert (=> start!101286 tp!91649))

(declare-fun e!690884 () Bool)

(declare-fun array_inv!28879 (array!78599) Bool)

(assert (=> start!101286 (and (array_inv!28879 _values!996) e!690884)))

(declare-fun b!1216936 () Bool)

(assert (=> b!1216936 (= e!690887 (bvslt from!1455 (size!38470 _values!996)))))

(declare-fun b!1216937 () Bool)

(declare-fun e!690892 () Bool)

(assert (=> b!1216937 (= e!690892 e!690885)))

(declare-fun res!808140 () Bool)

(assert (=> b!1216937 (=> res!808140 e!690885)))

(assert (=> b!1216937 (= res!808140 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553084 () ListLongMap!17911)

(assert (=> b!1216937 (= lt!553084 (getCurrentListMapNoExtraKeys!5398 lt!553083 lt!553085 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3286 (Int (_ BitVec 64)) V!46345)

(assert (=> b!1216937 (= lt!553085 (array!78600 (store (arr!37934 _values!996) i!673 (ValueCellFull!14747 (dynLambda!3286 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38470 _values!996)))))

(declare-fun lt!553082 () ListLongMap!17911)

(assert (=> b!1216937 (= lt!553082 (getCurrentListMapNoExtraKeys!5398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216938 () Bool)

(declare-fun res!808145 () Bool)

(assert (=> b!1216938 (=> (not res!808145) (not e!690891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216938 (= res!808145 (validMask!0 mask!1564))))

(declare-fun b!1216939 () Bool)

(declare-fun res!808147 () Bool)

(assert (=> b!1216939 (=> (not res!808147) (not e!690891))))

(assert (=> b!1216939 (= res!808147 (and (= (size!38470 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38469 _keys!1208) (size!38470 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216940 () Bool)

(assert (=> b!1216940 (= e!690884 (and e!690886 mapRes!48244))))

(declare-fun condMapEmpty!48244 () Bool)

(declare-fun mapDefault!48244 () ValueCell!14747)

