; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101742 () Bool)

(assert start!101742)

(declare-fun b_free!26431 () Bool)

(declare-fun b_next!26431 () Bool)

(assert (=> start!101742 (= b_free!26431 (not b_next!26431))))

(declare-fun tp!92339 () Bool)

(declare-fun b_and!44123 () Bool)

(assert (=> start!101742 (= tp!92339 b_and!44123)))

(declare-fun b!1224823 () Bool)

(declare-fun res!813922 () Bool)

(declare-fun e!695655 () Bool)

(assert (=> b!1224823 (=> (not res!813922) (not e!695655))))

(declare-datatypes ((array!79053 0))(
  ( (array!79054 (arr!38153 (Array (_ BitVec 32) (_ BitVec 64))) (size!38689 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79053)

(declare-datatypes ((List!26936 0))(
  ( (Nil!26933) (Cons!26932 (h!28141 (_ BitVec 64)) (t!40347 List!26936)) )
))
(declare-fun arrayNoDuplicates!0 (array!79053 (_ BitVec 32) List!26936) Bool)

(assert (=> b!1224823 (= res!813922 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26933))))

(declare-fun b!1224824 () Bool)

(declare-fun res!813910 () Bool)

(assert (=> b!1224824 (=> (not res!813910) (not e!695655))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79053 (_ BitVec 32)) Bool)

(assert (=> b!1224824 (= res!813910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224825 () Bool)

(declare-fun res!813921 () Bool)

(assert (=> b!1224825 (=> (not res!813921) (not e!695655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224825 (= res!813921 (validMask!0 mask!1564))))

(declare-fun b!1224826 () Bool)

(declare-fun e!695651 () Bool)

(declare-fun tp_is_empty!31135 () Bool)

(assert (=> b!1224826 (= e!695651 tp_is_empty!31135)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!695647 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1224827 () Bool)

(declare-fun arrayContainsKey!0 (array!79053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224827 (= e!695647 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1224828 () Bool)

(declare-fun res!813913 () Bool)

(assert (=> b!1224828 (=> (not res!813913) (not e!695655))))

(assert (=> b!1224828 (= res!813913 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38689 _keys!1208))))))

(declare-fun b!1224829 () Bool)

(declare-fun e!695652 () Bool)

(assert (=> b!1224829 (= e!695655 e!695652)))

(declare-fun res!813918 () Bool)

(assert (=> b!1224829 (=> (not res!813918) (not e!695652))))

(declare-fun lt!557834 () array!79053)

(assert (=> b!1224829 (= res!813918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557834 mask!1564))))

(assert (=> b!1224829 (= lt!557834 (array!79054 (store (arr!38153 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38689 _keys!1208)))))

(declare-fun b!1224830 () Bool)

(declare-fun e!695645 () Bool)

(assert (=> b!1224830 (= e!695652 (not e!695645))))

(declare-fun res!813908 () Bool)

(assert (=> b!1224830 (=> res!813908 e!695645)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1224830 (= res!813908 (bvsgt from!1455 i!673))))

(assert (=> b!1224830 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40589 0))(
  ( (Unit!40590) )
))
(declare-fun lt!557832 () Unit!40589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79053 (_ BitVec 64) (_ BitVec 32)) Unit!40589)

(assert (=> b!1224830 (= lt!557832 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1224831 () Bool)

(declare-fun e!695656 () Bool)

(declare-fun e!695653 () Bool)

(assert (=> b!1224831 (= e!695656 e!695653)))

(declare-fun res!813920 () Bool)

(assert (=> b!1224831 (=> res!813920 e!695653)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224831 (= res!813920 (not (validKeyInArray!0 (select (arr!38153 _keys!1208) from!1455))))))

(declare-datatypes ((V!46641 0))(
  ( (V!46642 (val!15624 Int)) )
))
(declare-datatypes ((tuple2!20136 0))(
  ( (tuple2!20137 (_1!10079 (_ BitVec 64)) (_2!10079 V!46641)) )
))
(declare-datatypes ((List!26937 0))(
  ( (Nil!26934) (Cons!26933 (h!28142 tuple2!20136) (t!40348 List!26937)) )
))
(declare-datatypes ((ListLongMap!18105 0))(
  ( (ListLongMap!18106 (toList!9068 List!26937)) )
))
(declare-fun lt!557835 () ListLongMap!18105)

(declare-fun lt!557846 () ListLongMap!18105)

(assert (=> b!1224831 (= lt!557835 lt!557846)))

(declare-fun lt!557849 () ListLongMap!18105)

(declare-fun -!1967 (ListLongMap!18105 (_ BitVec 64)) ListLongMap!18105)

(assert (=> b!1224831 (= lt!557846 (-!1967 lt!557849 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14858 0))(
  ( (ValueCellFull!14858 (v!18286 V!46641)) (EmptyCell!14858) )
))
(declare-datatypes ((array!79055 0))(
  ( (array!79056 (arr!38154 (Array (_ BitVec 32) ValueCell!14858)) (size!38690 (_ BitVec 32))) )
))
(declare-fun lt!557833 () array!79055)

(declare-fun minValue!944 () V!46641)

(declare-fun zeroValue!944 () V!46641)

(declare-fun getCurrentListMapNoExtraKeys!5488 (array!79053 array!79055 (_ BitVec 32) (_ BitVec 32) V!46641 V!46641 (_ BitVec 32) Int) ListLongMap!18105)

(assert (=> b!1224831 (= lt!557835 (getCurrentListMapNoExtraKeys!5488 lt!557834 lt!557833 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!79055)

(assert (=> b!1224831 (= lt!557849 (getCurrentListMapNoExtraKeys!5488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557838 () Unit!40589)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1174 (array!79053 array!79055 (_ BitVec 32) (_ BitVec 32) V!46641 V!46641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40589)

(assert (=> b!1224831 (= lt!557838 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1174 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224832 () Bool)

(declare-fun e!695646 () Bool)

(assert (=> b!1224832 (= e!695646 tp_is_empty!31135)))

(declare-fun b!1224833 () Bool)

(declare-fun res!813916 () Bool)

(assert (=> b!1224833 (=> (not res!813916) (not e!695655))))

(assert (=> b!1224833 (= res!813916 (validKeyInArray!0 k!934))))

(declare-fun b!1224834 () Bool)

(declare-fun e!695649 () Bool)

(declare-fun mapRes!48601 () Bool)

(assert (=> b!1224834 (= e!695649 (and e!695651 mapRes!48601))))

(declare-fun condMapEmpty!48601 () Bool)

(declare-fun mapDefault!48601 () ValueCell!14858)

