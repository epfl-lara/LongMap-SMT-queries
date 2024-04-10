; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100058 () Bool)

(assert start!100058)

(declare-fun b_free!25637 () Bool)

(declare-fun b_next!25637 () Bool)

(assert (=> start!100058 (= b_free!25637 (not b_next!25637))))

(declare-fun tp!89625 () Bool)

(declare-fun b_and!42141 () Bool)

(assert (=> start!100058 (= tp!89625 b_and!42141)))

(declare-fun b!1192643 () Bool)

(declare-fun res!793410 () Bool)

(declare-fun e!677886 () Bool)

(assert (=> b!1192643 (=> (not res!793410) (not e!677886))))

(declare-datatypes ((array!77119 0))(
  ( (array!77120 (arr!37209 (Array (_ BitVec 32) (_ BitVec 64))) (size!37745 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77119)

(declare-datatypes ((List!26205 0))(
  ( (Nil!26202) (Cons!26201 (h!27410 (_ BitVec 64)) (t!38834 List!26205)) )
))
(declare-fun arrayNoDuplicates!0 (array!77119 (_ BitVec 32) List!26205) Bool)

(assert (=> b!1192643 (= res!793410 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26202))))

(declare-fun res!793411 () Bool)

(assert (=> start!100058 (=> (not res!793411) (not e!677886))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100058 (= res!793411 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37745 _keys!1208))))))

(assert (=> start!100058 e!677886))

(declare-fun tp_is_empty!30167 () Bool)

(assert (=> start!100058 tp_is_empty!30167))

(declare-fun array_inv!28370 (array!77119) Bool)

(assert (=> start!100058 (array_inv!28370 _keys!1208)))

(assert (=> start!100058 true))

(assert (=> start!100058 tp!89625))

(declare-datatypes ((V!45349 0))(
  ( (V!45350 (val!15140 Int)) )
))
(declare-datatypes ((ValueCell!14374 0))(
  ( (ValueCellFull!14374 (v!17778 V!45349)) (EmptyCell!14374) )
))
(declare-datatypes ((array!77121 0))(
  ( (array!77122 (arr!37210 (Array (_ BitVec 32) ValueCell!14374)) (size!37746 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77121)

(declare-fun e!677884 () Bool)

(declare-fun array_inv!28371 (array!77121) Bool)

(assert (=> start!100058 (and (array_inv!28371 _values!996) e!677884)))

(declare-fun b!1192644 () Bool)

(declare-fun res!793407 () Bool)

(assert (=> b!1192644 (=> (not res!793407) (not e!677886))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192644 (= res!793407 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37745 _keys!1208))))))

(declare-fun b!1192645 () Bool)

(declare-fun res!793408 () Bool)

(assert (=> b!1192645 (=> (not res!793408) (not e!677886))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192645 (= res!793408 (validKeyInArray!0 k!934))))

(declare-fun b!1192646 () Bool)

(declare-fun e!677885 () Bool)

(assert (=> b!1192646 (= e!677885 true)))

(declare-fun zeroValue!944 () V!45349)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542297 () array!77121)

(declare-fun minValue!944 () V!45349)

(declare-fun lt!542293 () array!77119)

(declare-datatypes ((tuple2!19462 0))(
  ( (tuple2!19463 (_1!9742 (_ BitVec 64)) (_2!9742 V!45349)) )
))
(declare-datatypes ((List!26206 0))(
  ( (Nil!26203) (Cons!26202 (h!27411 tuple2!19462) (t!38835 List!26206)) )
))
(declare-datatypes ((ListLongMap!17431 0))(
  ( (ListLongMap!17432 (toList!8731 List!26206)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5172 (array!77119 array!77121 (_ BitVec 32) (_ BitVec 32) V!45349 V!45349 (_ BitVec 32) Int) ListLongMap!17431)

(declare-fun -!1756 (ListLongMap!17431 (_ BitVec 64)) ListLongMap!17431)

(assert (=> b!1192646 (= (getCurrentListMapNoExtraKeys!5172 lt!542293 lt!542297 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1756 (getCurrentListMapNoExtraKeys!5172 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39566 0))(
  ( (Unit!39567) )
))
(declare-fun lt!542298 () Unit!39566)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!965 (array!77119 array!77121 (_ BitVec 32) (_ BitVec 32) V!45349 V!45349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39566)

(assert (=> b!1192646 (= lt!542298 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!965 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47078 () Bool)

(declare-fun mapRes!47078 () Bool)

(assert (=> mapIsEmpty!47078 mapRes!47078))

(declare-fun b!1192647 () Bool)

(declare-fun e!677888 () Bool)

(assert (=> b!1192647 (= e!677888 tp_is_empty!30167)))

(declare-fun b!1192648 () Bool)

(declare-fun res!793406 () Bool)

(assert (=> b!1192648 (=> (not res!793406) (not e!677886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77119 (_ BitVec 32)) Bool)

(assert (=> b!1192648 (= res!793406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1192649 () Bool)

(declare-fun e!677889 () Bool)

(assert (=> b!1192649 (= e!677889 tp_is_empty!30167)))

(declare-fun b!1192650 () Bool)

(declare-fun res!793403 () Bool)

(assert (=> b!1192650 (=> (not res!793403) (not e!677886))))

(assert (=> b!1192650 (= res!793403 (and (= (size!37746 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37745 _keys!1208) (size!37746 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47078 () Bool)

(declare-fun tp!89624 () Bool)

(assert (=> mapNonEmpty!47078 (= mapRes!47078 (and tp!89624 e!677889))))

(declare-fun mapRest!47078 () (Array (_ BitVec 32) ValueCell!14374))

(declare-fun mapKey!47078 () (_ BitVec 32))

(declare-fun mapValue!47078 () ValueCell!14374)

(assert (=> mapNonEmpty!47078 (= (arr!37210 _values!996) (store mapRest!47078 mapKey!47078 mapValue!47078))))

(declare-fun b!1192651 () Bool)

(declare-fun e!677890 () Bool)

(assert (=> b!1192651 (= e!677886 e!677890)))

(declare-fun res!793409 () Bool)

(assert (=> b!1192651 (=> (not res!793409) (not e!677890))))

(assert (=> b!1192651 (= res!793409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542293 mask!1564))))

(assert (=> b!1192651 (= lt!542293 (array!77120 (store (arr!37209 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37745 _keys!1208)))))

(declare-fun b!1192652 () Bool)

(declare-fun res!793405 () Bool)

(assert (=> b!1192652 (=> (not res!793405) (not e!677886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1192652 (= res!793405 (validMask!0 mask!1564))))

(declare-fun b!1192653 () Bool)

(declare-fun e!677887 () Bool)

(assert (=> b!1192653 (= e!677890 (not e!677887))))

(declare-fun res!793402 () Bool)

(assert (=> b!1192653 (=> res!793402 e!677887)))

(assert (=> b!1192653 (= res!793402 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192653 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!542295 () Unit!39566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77119 (_ BitVec 64) (_ BitVec 32)) Unit!39566)

(assert (=> b!1192653 (= lt!542295 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1192654 () Bool)

(assert (=> b!1192654 (= e!677887 e!677885)))

(declare-fun res!793401 () Bool)

(assert (=> b!1192654 (=> res!793401 e!677885)))

(assert (=> b!1192654 (= res!793401 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542294 () ListLongMap!17431)

(assert (=> b!1192654 (= lt!542294 (getCurrentListMapNoExtraKeys!5172 lt!542293 lt!542297 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3103 (Int (_ BitVec 64)) V!45349)

(assert (=> b!1192654 (= lt!542297 (array!77122 (store (arr!37210 _values!996) i!673 (ValueCellFull!14374 (dynLambda!3103 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37746 _values!996)))))

(declare-fun lt!542296 () ListLongMap!17431)

(assert (=> b!1192654 (= lt!542296 (getCurrentListMapNoExtraKeys!5172 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1192655 () Bool)

(assert (=> b!1192655 (= e!677884 (and e!677888 mapRes!47078))))

(declare-fun condMapEmpty!47078 () Bool)

(declare-fun mapDefault!47078 () ValueCell!14374)

