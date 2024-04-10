; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99890 () Bool)

(assert start!99890)

(declare-fun b_free!25469 () Bool)

(declare-fun b_next!25469 () Bool)

(assert (=> start!99890 (= b_free!25469 (not b_next!25469))))

(declare-fun tp!89120 () Bool)

(declare-fun b_and!41805 () Bool)

(assert (=> start!99890 (= tp!89120 b_and!41805)))

(declare-fun b!1188695 () Bool)

(declare-fun res!790379 () Bool)

(declare-fun e!675874 () Bool)

(assert (=> b!1188695 (=> (not res!790379) (not e!675874))))

(declare-datatypes ((array!76793 0))(
  ( (array!76794 (arr!37046 (Array (_ BitVec 32) (_ BitVec 64))) (size!37582 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76793)

(declare-datatypes ((List!26077 0))(
  ( (Nil!26074) (Cons!26073 (h!27282 (_ BitVec 64)) (t!38538 List!26077)) )
))
(declare-fun arrayNoDuplicates!0 (array!76793 (_ BitVec 32) List!26077) Bool)

(assert (=> b!1188695 (= res!790379 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26074))))

(declare-fun b!1188696 () Bool)

(declare-fun e!675870 () Bool)

(declare-fun e!675867 () Bool)

(assert (=> b!1188696 (= e!675870 e!675867)))

(declare-fun res!790387 () Bool)

(assert (=> b!1188696 (=> res!790387 e!675867)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188696 (= res!790387 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45125 0))(
  ( (V!45126 (val!15056 Int)) )
))
(declare-fun zeroValue!944 () V!45125)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19334 0))(
  ( (tuple2!19335 (_1!9678 (_ BitVec 64)) (_2!9678 V!45125)) )
))
(declare-datatypes ((List!26078 0))(
  ( (Nil!26075) (Cons!26074 (h!27283 tuple2!19334) (t!38539 List!26078)) )
))
(declare-datatypes ((ListLongMap!17303 0))(
  ( (ListLongMap!17304 (toList!8667 List!26078)) )
))
(declare-fun lt!540783 () ListLongMap!17303)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!540784 () array!76793)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14290 0))(
  ( (ValueCellFull!14290 (v!17694 V!45125)) (EmptyCell!14290) )
))
(declare-datatypes ((array!76795 0))(
  ( (array!76796 (arr!37047 (Array (_ BitVec 32) ValueCell!14290)) (size!37583 (_ BitVec 32))) )
))
(declare-fun lt!540785 () array!76795)

(declare-fun minValue!944 () V!45125)

(declare-fun getCurrentListMapNoExtraKeys!5108 (array!76793 array!76795 (_ BitVec 32) (_ BitVec 32) V!45125 V!45125 (_ BitVec 32) Int) ListLongMap!17303)

(assert (=> b!1188696 (= lt!540783 (getCurrentListMapNoExtraKeys!5108 lt!540784 lt!540785 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76795)

(declare-fun dynLambda!3052 (Int (_ BitVec 64)) V!45125)

(assert (=> b!1188696 (= lt!540785 (array!76796 (store (arr!37047 _values!996) i!673 (ValueCellFull!14290 (dynLambda!3052 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37583 _values!996)))))

(declare-fun lt!540782 () ListLongMap!17303)

(assert (=> b!1188696 (= lt!540782 (getCurrentListMapNoExtraKeys!5108 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188697 () Bool)

(declare-fun e!675872 () Bool)

(assert (=> b!1188697 (= e!675872 (not e!675870))))

(declare-fun res!790381 () Bool)

(assert (=> b!1188697 (=> res!790381 e!675870)))

(assert (=> b!1188697 (= res!790381 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188697 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39434 0))(
  ( (Unit!39435) )
))
(declare-fun lt!540786 () Unit!39434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76793 (_ BitVec 64) (_ BitVec 32)) Unit!39434)

(assert (=> b!1188697 (= lt!540786 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!46826 () Bool)

(declare-fun mapRes!46826 () Bool)

(declare-fun tp!89121 () Bool)

(declare-fun e!675869 () Bool)

(assert (=> mapNonEmpty!46826 (= mapRes!46826 (and tp!89121 e!675869))))

(declare-fun mapValue!46826 () ValueCell!14290)

(declare-fun mapRest!46826 () (Array (_ BitVec 32) ValueCell!14290))

(declare-fun mapKey!46826 () (_ BitVec 32))

(assert (=> mapNonEmpty!46826 (= (arr!37047 _values!996) (store mapRest!46826 mapKey!46826 mapValue!46826))))

(declare-fun b!1188698 () Bool)

(declare-fun e!675873 () Bool)

(declare-fun tp_is_empty!29999 () Bool)

(assert (=> b!1188698 (= e!675873 tp_is_empty!29999)))

(declare-fun b!1188700 () Bool)

(declare-fun res!790383 () Bool)

(assert (=> b!1188700 (=> (not res!790383) (not e!675874))))

(assert (=> b!1188700 (= res!790383 (= (select (arr!37046 _keys!1208) i!673) k!934))))

(declare-fun b!1188701 () Bool)

(declare-fun res!790385 () Bool)

(assert (=> b!1188701 (=> (not res!790385) (not e!675874))))

(assert (=> b!1188701 (= res!790385 (and (= (size!37583 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37582 _keys!1208) (size!37583 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188702 () Bool)

(declare-fun res!790382 () Bool)

(assert (=> b!1188702 (=> (not res!790382) (not e!675874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188702 (= res!790382 (validKeyInArray!0 k!934))))

(declare-fun b!1188703 () Bool)

(assert (=> b!1188703 (= e!675867 true)))

(declare-fun -!1697 (ListLongMap!17303 (_ BitVec 64)) ListLongMap!17303)

(assert (=> b!1188703 (= (getCurrentListMapNoExtraKeys!5108 lt!540784 lt!540785 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1697 (getCurrentListMapNoExtraKeys!5108 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!540781 () Unit!39434)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!906 (array!76793 array!76795 (_ BitVec 32) (_ BitVec 32) V!45125 V!45125 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39434)

(assert (=> b!1188703 (= lt!540781 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!906 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188704 () Bool)

(assert (=> b!1188704 (= e!675874 e!675872)))

(declare-fun res!790376 () Bool)

(assert (=> b!1188704 (=> (not res!790376) (not e!675872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76793 (_ BitVec 32)) Bool)

(assert (=> b!1188704 (= res!790376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540784 mask!1564))))

(assert (=> b!1188704 (= lt!540784 (array!76794 (store (arr!37046 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37582 _keys!1208)))))

(declare-fun b!1188705 () Bool)

(declare-fun e!675868 () Bool)

(assert (=> b!1188705 (= e!675868 (and e!675873 mapRes!46826))))

(declare-fun condMapEmpty!46826 () Bool)

(declare-fun mapDefault!46826 () ValueCell!14290)

