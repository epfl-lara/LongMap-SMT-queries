; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100084 () Bool)

(assert start!100084)

(declare-fun b_free!25663 () Bool)

(declare-fun b_next!25663 () Bool)

(assert (=> start!100084 (= b_free!25663 (not b_next!25663))))

(declare-fun tp!89702 () Bool)

(declare-fun b_and!42193 () Bool)

(assert (=> start!100084 (= tp!89702 b_and!42193)))

(declare-fun b!1193254 () Bool)

(declare-fun e!678202 () Bool)

(declare-fun tp_is_empty!30193 () Bool)

(assert (=> b!1193254 (= e!678202 tp_is_empty!30193)))

(declare-fun b!1193255 () Bool)

(declare-fun e!678201 () Bool)

(declare-fun e!678195 () Bool)

(assert (=> b!1193255 (= e!678201 e!678195)))

(declare-fun res!793872 () Bool)

(assert (=> b!1193255 (=> res!793872 e!678195)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193255 (= res!793872 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45385 0))(
  ( (V!45386 (val!15153 Int)) )
))
(declare-fun zeroValue!944 () V!45385)

(declare-datatypes ((array!77165 0))(
  ( (array!77166 (arr!37232 (Array (_ BitVec 32) (_ BitVec 64))) (size!37768 (_ BitVec 32))) )
))
(declare-fun lt!542527 () array!77165)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19480 0))(
  ( (tuple2!19481 (_1!9751 (_ BitVec 64)) (_2!9751 V!45385)) )
))
(declare-datatypes ((List!26224 0))(
  ( (Nil!26221) (Cons!26220 (h!27429 tuple2!19480) (t!38879 List!26224)) )
))
(declare-datatypes ((ListLongMap!17449 0))(
  ( (ListLongMap!17450 (toList!8740 List!26224)) )
))
(declare-fun lt!542529 () ListLongMap!17449)

(declare-datatypes ((ValueCell!14387 0))(
  ( (ValueCellFull!14387 (v!17791 V!45385)) (EmptyCell!14387) )
))
(declare-datatypes ((array!77167 0))(
  ( (array!77168 (arr!37233 (Array (_ BitVec 32) ValueCell!14387)) (size!37769 (_ BitVec 32))) )
))
(declare-fun lt!542528 () array!77167)

(declare-fun minValue!944 () V!45385)

(declare-fun getCurrentListMapNoExtraKeys!5181 (array!77165 array!77167 (_ BitVec 32) (_ BitVec 32) V!45385 V!45385 (_ BitVec 32) Int) ListLongMap!17449)

(assert (=> b!1193255 (= lt!542529 (getCurrentListMapNoExtraKeys!5181 lt!542527 lt!542528 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77167)

(declare-fun dynLambda!3111 (Int (_ BitVec 64)) V!45385)

(assert (=> b!1193255 (= lt!542528 (array!77168 (store (arr!37233 _values!996) i!673 (ValueCellFull!14387 (dynLambda!3111 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37769 _values!996)))))

(declare-fun _keys!1208 () array!77165)

(declare-fun lt!542531 () ListLongMap!17449)

(assert (=> b!1193255 (= lt!542531 (getCurrentListMapNoExtraKeys!5181 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193256 () Bool)

(declare-fun res!793871 () Bool)

(declare-fun e!678197 () Bool)

(assert (=> b!1193256 (=> (not res!793871) (not e!678197))))

(assert (=> b!1193256 (= res!793871 (and (= (size!37769 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37768 _keys!1208) (size!37769 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193257 () Bool)

(declare-fun res!793874 () Bool)

(assert (=> b!1193257 (=> (not res!793874) (not e!678197))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1193257 (= res!793874 (= (select (arr!37232 _keys!1208) i!673) k!934))))

(declare-fun b!1193258 () Bool)

(declare-fun e!678199 () Bool)

(assert (=> b!1193258 (= e!678199 tp_is_empty!30193)))

(declare-fun b!1193259 () Bool)

(declare-fun e!678200 () Bool)

(assert (=> b!1193259 (= e!678200 (not e!678201))))

(declare-fun res!793868 () Bool)

(assert (=> b!1193259 (=> res!793868 e!678201)))

(assert (=> b!1193259 (= res!793868 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193259 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39584 0))(
  ( (Unit!39585) )
))
(declare-fun lt!542530 () Unit!39584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77165 (_ BitVec 64) (_ BitVec 32)) Unit!39584)

(assert (=> b!1193259 (= lt!542530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1193260 () Bool)

(declare-fun res!793873 () Bool)

(assert (=> b!1193260 (=> (not res!793873) (not e!678200))))

(declare-datatypes ((List!26225 0))(
  ( (Nil!26222) (Cons!26221 (h!27430 (_ BitVec 64)) (t!38880 List!26225)) )
))
(declare-fun arrayNoDuplicates!0 (array!77165 (_ BitVec 32) List!26225) Bool)

(assert (=> b!1193260 (= res!793873 (arrayNoDuplicates!0 lt!542527 #b00000000000000000000000000000000 Nil!26222))))

(declare-fun b!1193261 () Bool)

(declare-fun res!793878 () Bool)

(assert (=> b!1193261 (=> (not res!793878) (not e!678197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77165 (_ BitVec 32)) Bool)

(assert (=> b!1193261 (= res!793878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!793869 () Bool)

(assert (=> start!100084 (=> (not res!793869) (not e!678197))))

(assert (=> start!100084 (= res!793869 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37768 _keys!1208))))))

(assert (=> start!100084 e!678197))

(assert (=> start!100084 tp_is_empty!30193))

(declare-fun array_inv!28386 (array!77165) Bool)

(assert (=> start!100084 (array_inv!28386 _keys!1208)))

(assert (=> start!100084 true))

(assert (=> start!100084 tp!89702))

(declare-fun e!678198 () Bool)

(declare-fun array_inv!28387 (array!77167) Bool)

(assert (=> start!100084 (and (array_inv!28387 _values!996) e!678198)))

(declare-fun b!1193262 () Bool)

(declare-fun res!793875 () Bool)

(assert (=> b!1193262 (=> (not res!793875) (not e!678197))))

(assert (=> b!1193262 (= res!793875 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26222))))

(declare-fun mapNonEmpty!47117 () Bool)

(declare-fun mapRes!47117 () Bool)

(declare-fun tp!89703 () Bool)

(assert (=> mapNonEmpty!47117 (= mapRes!47117 (and tp!89703 e!678199))))

(declare-fun mapKey!47117 () (_ BitVec 32))

(declare-fun mapRest!47117 () (Array (_ BitVec 32) ValueCell!14387))

(declare-fun mapValue!47117 () ValueCell!14387)

(assert (=> mapNonEmpty!47117 (= (arr!37233 _values!996) (store mapRest!47117 mapKey!47117 mapValue!47117))))

(declare-fun b!1193263 () Bool)

(assert (=> b!1193263 (= e!678197 e!678200)))

(declare-fun res!793877 () Bool)

(assert (=> b!1193263 (=> (not res!793877) (not e!678200))))

(assert (=> b!1193263 (= res!793877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542527 mask!1564))))

(assert (=> b!1193263 (= lt!542527 (array!77166 (store (arr!37232 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37768 _keys!1208)))))

(declare-fun b!1193264 () Bool)

(assert (=> b!1193264 (= e!678195 true)))

(declare-fun -!1765 (ListLongMap!17449 (_ BitVec 64)) ListLongMap!17449)

(assert (=> b!1193264 (= (getCurrentListMapNoExtraKeys!5181 lt!542527 lt!542528 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1765 (getCurrentListMapNoExtraKeys!5181 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!542532 () Unit!39584)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!974 (array!77165 array!77167 (_ BitVec 32) (_ BitVec 32) V!45385 V!45385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39584)

(assert (=> b!1193264 (= lt!542532 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!974 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47117 () Bool)

(assert (=> mapIsEmpty!47117 mapRes!47117))

(declare-fun b!1193265 () Bool)

(declare-fun res!793870 () Bool)

(assert (=> b!1193265 (=> (not res!793870) (not e!678197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193265 (= res!793870 (validMask!0 mask!1564))))

(declare-fun b!1193266 () Bool)

(declare-fun res!793879 () Bool)

(assert (=> b!1193266 (=> (not res!793879) (not e!678197))))

(assert (=> b!1193266 (= res!793879 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37768 _keys!1208))))))

(declare-fun b!1193267 () Bool)

(assert (=> b!1193267 (= e!678198 (and e!678202 mapRes!47117))))

(declare-fun condMapEmpty!47117 () Bool)

(declare-fun mapDefault!47117 () ValueCell!14387)

