; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101740 () Bool)

(assert start!101740)

(declare-fun b_free!26429 () Bool)

(declare-fun b_next!26429 () Bool)

(assert (=> start!101740 (= b_free!26429 (not b_next!26429))))

(declare-fun tp!92332 () Bool)

(declare-fun b_and!44119 () Bool)

(assert (=> start!101740 (= tp!92332 b_and!44119)))

(declare-fun b!1224761 () Bool)

(declare-fun e!695615 () Bool)

(declare-fun e!695619 () Bool)

(assert (=> b!1224761 (= e!695615 (not e!695619))))

(declare-fun res!813868 () Bool)

(assert (=> b!1224761 (=> res!813868 e!695619)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224761 (= res!813868 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!79049 0))(
  ( (array!79050 (arr!38151 (Array (_ BitVec 32) (_ BitVec 64))) (size!38687 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79049)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224761 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40586 0))(
  ( (Unit!40587) )
))
(declare-fun lt!557789 () Unit!40586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79049 (_ BitVec 64) (_ BitVec 32)) Unit!40586)

(assert (=> b!1224761 (= lt!557789 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1224762 () Bool)

(declare-fun res!813875 () Bool)

(declare-fun e!695612 () Bool)

(assert (=> b!1224762 (=> (not res!813875) (not e!695612))))

(assert (=> b!1224762 (= res!813875 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38687 _keys!1208))))))

(declare-fun b!1224763 () Bool)

(declare-fun e!695611 () Bool)

(assert (=> b!1224763 (= e!695619 e!695611)))

(declare-fun res!813866 () Bool)

(assert (=> b!1224763 (=> res!813866 e!695611)))

(assert (=> b!1224763 (= res!813866 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!46637 0))(
  ( (V!46638 (val!15623 Int)) )
))
(declare-datatypes ((ValueCell!14857 0))(
  ( (ValueCellFull!14857 (v!18285 V!46637)) (EmptyCell!14857) )
))
(declare-datatypes ((array!79051 0))(
  ( (array!79052 (arr!38152 (Array (_ BitVec 32) ValueCell!14857)) (size!38688 (_ BitVec 32))) )
))
(declare-fun lt!557783 () array!79051)

(declare-fun minValue!944 () V!46637)

(declare-datatypes ((tuple2!20134 0))(
  ( (tuple2!20135 (_1!10078 (_ BitVec 64)) (_2!10078 V!46637)) )
))
(declare-datatypes ((List!26934 0))(
  ( (Nil!26931) (Cons!26930 (h!28139 tuple2!20134) (t!40343 List!26934)) )
))
(declare-datatypes ((ListLongMap!18103 0))(
  ( (ListLongMap!18104 (toList!9067 List!26934)) )
))
(declare-fun lt!557791 () ListLongMap!18103)

(declare-fun zeroValue!944 () V!46637)

(declare-fun lt!557788 () array!79049)

(declare-fun getCurrentListMapNoExtraKeys!5487 (array!79049 array!79051 (_ BitVec 32) (_ BitVec 32) V!46637 V!46637 (_ BitVec 32) Int) ListLongMap!18103)

(assert (=> b!1224763 (= lt!557791 (getCurrentListMapNoExtraKeys!5487 lt!557788 lt!557783 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!557792 () V!46637)

(declare-fun _values!996 () array!79051)

(assert (=> b!1224763 (= lt!557783 (array!79052 (store (arr!38152 _values!996) i!673 (ValueCellFull!14857 lt!557792)) (size!38688 _values!996)))))

(declare-fun dynLambda!3360 (Int (_ BitVec 64)) V!46637)

(assert (=> b!1224763 (= lt!557792 (dynLambda!3360 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557782 () ListLongMap!18103)

(assert (=> b!1224763 (= lt!557782 (getCurrentListMapNoExtraKeys!5487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1224764 () Bool)

(declare-fun res!813871 () Bool)

(assert (=> b!1224764 (=> (not res!813871) (not e!695612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224764 (= res!813871 (validMask!0 mask!1564))))

(declare-fun b!1224765 () Bool)

(declare-fun e!695617 () Unit!40586)

(declare-fun Unit!40588 () Unit!40586)

(assert (=> b!1224765 (= e!695617 Unit!40588)))

(declare-fun b!1224766 () Bool)

(declare-fun res!813873 () Bool)

(assert (=> b!1224766 (=> (not res!813873) (not e!695612))))

(declare-datatypes ((List!26935 0))(
  ( (Nil!26932) (Cons!26931 (h!28140 (_ BitVec 64)) (t!40344 List!26935)) )
))
(declare-fun arrayNoDuplicates!0 (array!79049 (_ BitVec 32) List!26935) Bool)

(assert (=> b!1224766 (= res!813873 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26932))))

(declare-fun b!1224767 () Bool)

(declare-fun res!813867 () Bool)

(assert (=> b!1224767 (=> (not res!813867) (not e!695615))))

(assert (=> b!1224767 (= res!813867 (arrayNoDuplicates!0 lt!557788 #b00000000000000000000000000000000 Nil!26932))))

(declare-fun b!1224768 () Bool)

(declare-fun e!695609 () Bool)

(declare-fun tp_is_empty!31133 () Bool)

(assert (=> b!1224768 (= e!695609 tp_is_empty!31133)))

(declare-fun b!1224769 () Bool)

(declare-fun e!695620 () Bool)

(declare-fun mapRes!48598 () Bool)

(assert (=> b!1224769 (= e!695620 (and e!695609 mapRes!48598))))

(declare-fun condMapEmpty!48598 () Bool)

(declare-fun mapDefault!48598 () ValueCell!14857)

