; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99974 () Bool)

(assert start!99974)

(declare-fun b_free!25553 () Bool)

(declare-fun b_next!25553 () Bool)

(assert (=> start!99974 (= b_free!25553 (not b_next!25553))))

(declare-fun tp!89372 () Bool)

(declare-fun b_and!41973 () Bool)

(assert (=> start!99974 (= tp!89372 b_and!41973)))

(declare-fun b!1190669 () Bool)

(declare-fun res!791899 () Bool)

(declare-fun e!676875 () Bool)

(assert (=> b!1190669 (=> (not res!791899) (not e!676875))))

(declare-datatypes ((array!76957 0))(
  ( (array!76958 (arr!37128 (Array (_ BitVec 32) (_ BitVec 64))) (size!37664 (_ BitVec 32))) )
))
(declare-fun lt!541540 () array!76957)

(declare-datatypes ((List!26142 0))(
  ( (Nil!26139) (Cons!26138 (h!27347 (_ BitVec 64)) (t!38687 List!26142)) )
))
(declare-fun arrayNoDuplicates!0 (array!76957 (_ BitVec 32) List!26142) Bool)

(assert (=> b!1190669 (= res!791899 (arrayNoDuplicates!0 lt!541540 #b00000000000000000000000000000000 Nil!26139))))

(declare-fun mapNonEmpty!46952 () Bool)

(declare-fun mapRes!46952 () Bool)

(declare-fun tp!89373 () Bool)

(declare-fun e!676882 () Bool)

(assert (=> mapNonEmpty!46952 (= mapRes!46952 (and tp!89373 e!676882))))

(declare-datatypes ((V!45237 0))(
  ( (V!45238 (val!15098 Int)) )
))
(declare-datatypes ((ValueCell!14332 0))(
  ( (ValueCellFull!14332 (v!17736 V!45237)) (EmptyCell!14332) )
))
(declare-fun mapRest!46952 () (Array (_ BitVec 32) ValueCell!14332))

(declare-fun mapValue!46952 () ValueCell!14332)

(declare-datatypes ((array!76959 0))(
  ( (array!76960 (arr!37129 (Array (_ BitVec 32) ValueCell!14332)) (size!37665 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76959)

(declare-fun mapKey!46952 () (_ BitVec 32))

(assert (=> mapNonEmpty!46952 (= (arr!37129 _values!996) (store mapRest!46952 mapKey!46952 mapValue!46952))))

(declare-fun b!1190670 () Bool)

(declare-fun res!791894 () Bool)

(declare-fun e!676878 () Bool)

(assert (=> b!1190670 (=> (not res!791894) (not e!676878))))

(declare-fun _keys!1208 () array!76957)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76957 (_ BitVec 32)) Bool)

(assert (=> b!1190670 (= res!791894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!791892 () Bool)

(assert (=> start!99974 (=> (not res!791892) (not e!676878))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99974 (= res!791892 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37664 _keys!1208))))))

(assert (=> start!99974 e!676878))

(declare-fun tp_is_empty!30083 () Bool)

(assert (=> start!99974 tp_is_empty!30083))

(declare-fun array_inv!28314 (array!76957) Bool)

(assert (=> start!99974 (array_inv!28314 _keys!1208)))

(assert (=> start!99974 true))

(assert (=> start!99974 tp!89372))

(declare-fun e!676879 () Bool)

(declare-fun array_inv!28315 (array!76959) Bool)

(assert (=> start!99974 (and (array_inv!28315 _values!996) e!676879)))

(declare-fun b!1190671 () Bool)

(declare-fun e!676881 () Bool)

(assert (=> b!1190671 (= e!676881 tp_is_empty!30083)))

(declare-fun b!1190672 () Bool)

(assert (=> b!1190672 (= e!676878 e!676875)))

(declare-fun res!791893 () Bool)

(assert (=> b!1190672 (=> (not res!791893) (not e!676875))))

(assert (=> b!1190672 (= res!791893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541540 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1190672 (= lt!541540 (array!76958 (store (arr!37128 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37664 _keys!1208)))))

(declare-fun b!1190673 () Bool)

(declare-fun res!791895 () Bool)

(assert (=> b!1190673 (=> (not res!791895) (not e!676878))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1190673 (= res!791895 (= (select (arr!37128 _keys!1208) i!673) k!934))))

(declare-fun b!1190674 () Bool)

(declare-fun e!676877 () Bool)

(declare-fun e!676876 () Bool)

(assert (=> b!1190674 (= e!676877 e!676876)))

(declare-fun res!791888 () Bool)

(assert (=> b!1190674 (=> res!791888 e!676876)))

(assert (=> b!1190674 (= res!791888 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45237)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19396 0))(
  ( (tuple2!19397 (_1!9709 (_ BitVec 64)) (_2!9709 V!45237)) )
))
(declare-datatypes ((List!26143 0))(
  ( (Nil!26140) (Cons!26139 (h!27348 tuple2!19396) (t!38688 List!26143)) )
))
(declare-datatypes ((ListLongMap!17365 0))(
  ( (ListLongMap!17366 (toList!8698 List!26143)) )
))
(declare-fun lt!541537 () ListLongMap!17365)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45237)

(declare-fun lt!541541 () array!76959)

(declare-fun getCurrentListMapNoExtraKeys!5139 (array!76957 array!76959 (_ BitVec 32) (_ BitVec 32) V!45237 V!45237 (_ BitVec 32) Int) ListLongMap!17365)

(assert (=> b!1190674 (= lt!541537 (getCurrentListMapNoExtraKeys!5139 lt!541540 lt!541541 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3077 (Int (_ BitVec 64)) V!45237)

(assert (=> b!1190674 (= lt!541541 (array!76960 (store (arr!37129 _values!996) i!673 (ValueCellFull!14332 (dynLambda!3077 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37665 _values!996)))))

(declare-fun lt!541539 () ListLongMap!17365)

(assert (=> b!1190674 (= lt!541539 (getCurrentListMapNoExtraKeys!5139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190675 () Bool)

(assert (=> b!1190675 (= e!676876 true)))

(declare-fun -!1725 (ListLongMap!17365 (_ BitVec 64)) ListLongMap!17365)

(assert (=> b!1190675 (= (getCurrentListMapNoExtraKeys!5139 lt!541540 lt!541541 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1725 (getCurrentListMapNoExtraKeys!5139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39494 0))(
  ( (Unit!39495) )
))
(declare-fun lt!541538 () Unit!39494)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!934 (array!76957 array!76959 (_ BitVec 32) (_ BitVec 32) V!45237 V!45237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39494)

(assert (=> b!1190675 (= lt!541538 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!934 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46952 () Bool)

(assert (=> mapIsEmpty!46952 mapRes!46952))

(declare-fun b!1190676 () Bool)

(assert (=> b!1190676 (= e!676882 tp_is_empty!30083)))

(declare-fun b!1190677 () Bool)

(declare-fun res!791889 () Bool)

(assert (=> b!1190677 (=> (not res!791889) (not e!676878))))

(assert (=> b!1190677 (= res!791889 (and (= (size!37665 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37664 _keys!1208) (size!37665 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190678 () Bool)

(assert (=> b!1190678 (= e!676875 (not e!676877))))

(declare-fun res!791897 () Bool)

(assert (=> b!1190678 (=> res!791897 e!676877)))

(assert (=> b!1190678 (= res!791897 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190678 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541542 () Unit!39494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76957 (_ BitVec 64) (_ BitVec 32)) Unit!39494)

(assert (=> b!1190678 (= lt!541542 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1190679 () Bool)

(assert (=> b!1190679 (= e!676879 (and e!676881 mapRes!46952))))

(declare-fun condMapEmpty!46952 () Bool)

(declare-fun mapDefault!46952 () ValueCell!14332)

