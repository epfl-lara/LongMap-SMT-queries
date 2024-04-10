; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99198 () Bool)

(assert start!99198)

(declare-fun b_free!24803 () Bool)

(declare-fun b_next!24803 () Bool)

(assert (=> start!99198 (= b_free!24803 (not b_next!24803))))

(declare-fun tp!87119 () Bool)

(declare-fun b_and!40455 () Bool)

(assert (=> start!99198 (= tp!87119 b_and!40455)))

(declare-fun mapNonEmpty!45824 () Bool)

(declare-fun mapRes!45824 () Bool)

(declare-fun tp!87120 () Bool)

(declare-fun e!663800 () Bool)

(assert (=> mapNonEmpty!45824 (= mapRes!45824 (and tp!87120 e!663800))))

(declare-datatypes ((V!44237 0))(
  ( (V!44238 (val!14723 Int)) )
))
(declare-datatypes ((ValueCell!13957 0))(
  ( (ValueCellFull!13957 (v!17360 V!44237)) (EmptyCell!13957) )
))
(declare-fun mapRest!45824 () (Array (_ BitVec 32) ValueCell!13957))

(declare-fun mapKey!45824 () (_ BitVec 32))

(declare-datatypes ((array!75489 0))(
  ( (array!75490 (arr!36395 (Array (_ BitVec 32) ValueCell!13957)) (size!36931 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75489)

(declare-fun mapValue!45824 () ValueCell!13957)

(assert (=> mapNonEmpty!45824 (= (arr!36395 _values!996) (store mapRest!45824 mapKey!45824 mapValue!45824))))

(declare-fun b!1167924 () Bool)

(declare-fun e!663801 () Bool)

(declare-fun e!663798 () Bool)

(assert (=> b!1167924 (= e!663801 e!663798)))

(declare-fun res!774836 () Bool)

(assert (=> b!1167924 (=> res!774836 e!663798)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167924 (= res!774836 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44237)

(declare-datatypes ((array!75491 0))(
  ( (array!75492 (arr!36396 (Array (_ BitVec 32) (_ BitVec 64))) (size!36932 (_ BitVec 32))) )
))
(declare-fun lt!525821 () array!75491)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18784 0))(
  ( (tuple2!18785 (_1!9403 (_ BitVec 64)) (_2!9403 V!44237)) )
))
(declare-datatypes ((List!25524 0))(
  ( (Nil!25521) (Cons!25520 (h!26729 tuple2!18784) (t!37319 List!25524)) )
))
(declare-datatypes ((ListLongMap!16753 0))(
  ( (ListLongMap!16754 (toList!8392 List!25524)) )
))
(declare-fun lt!525822 () ListLongMap!16753)

(declare-fun lt!525820 () array!75489)

(declare-fun minValue!944 () V!44237)

(declare-fun getCurrentListMapNoExtraKeys!4856 (array!75491 array!75489 (_ BitVec 32) (_ BitVec 32) V!44237 V!44237 (_ BitVec 32) Int) ListLongMap!16753)

(assert (=> b!1167924 (= lt!525822 (getCurrentListMapNoExtraKeys!4856 lt!525821 lt!525820 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2837 (Int (_ BitVec 64)) V!44237)

(assert (=> b!1167924 (= lt!525820 (array!75490 (store (arr!36395 _values!996) i!673 (ValueCellFull!13957 (dynLambda!2837 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36931 _values!996)))))

(declare-fun _keys!1208 () array!75491)

(declare-fun lt!525825 () ListLongMap!16753)

(assert (=> b!1167924 (= lt!525825 (getCurrentListMapNoExtraKeys!4856 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167925 () Bool)

(declare-fun res!774837 () Bool)

(declare-fun e!663794 () Bool)

(assert (=> b!1167925 (=> (not res!774837) (not e!663794))))

(assert (=> b!1167925 (= res!774837 (and (= (size!36931 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36932 _keys!1208) (size!36931 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167926 () Bool)

(declare-fun res!774831 () Bool)

(assert (=> b!1167926 (=> (not res!774831) (not e!663794))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167926 (= res!774831 (validKeyInArray!0 k!934))))

(declare-fun b!1167927 () Bool)

(declare-fun res!774829 () Bool)

(assert (=> b!1167927 (=> (not res!774829) (not e!663794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75491 (_ BitVec 32)) Bool)

(assert (=> b!1167927 (= res!774829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45824 () Bool)

(assert (=> mapIsEmpty!45824 mapRes!45824))

(declare-fun b!1167928 () Bool)

(declare-fun tp_is_empty!29333 () Bool)

(assert (=> b!1167928 (= e!663800 tp_is_empty!29333)))

(declare-fun b!1167929 () Bool)

(assert (=> b!1167929 (= e!663798 true)))

(declare-fun -!1467 (ListLongMap!16753 (_ BitVec 64)) ListLongMap!16753)

(assert (=> b!1167929 (= (getCurrentListMapNoExtraKeys!4856 lt!525821 lt!525820 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1467 (getCurrentListMapNoExtraKeys!4856 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38536 0))(
  ( (Unit!38537) )
))
(declare-fun lt!525824 () Unit!38536)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!694 (array!75491 array!75489 (_ BitVec 32) (_ BitVec 32) V!44237 V!44237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38536)

(assert (=> b!1167929 (= lt!525824 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!694 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!774830 () Bool)

(assert (=> start!99198 (=> (not res!774830) (not e!663794))))

(assert (=> start!99198 (= res!774830 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36932 _keys!1208))))))

(assert (=> start!99198 e!663794))

(assert (=> start!99198 tp_is_empty!29333))

(declare-fun array_inv!27820 (array!75491) Bool)

(assert (=> start!99198 (array_inv!27820 _keys!1208)))

(assert (=> start!99198 true))

(assert (=> start!99198 tp!87119))

(declare-fun e!663795 () Bool)

(declare-fun array_inv!27821 (array!75489) Bool)

(assert (=> start!99198 (and (array_inv!27821 _values!996) e!663795)))

(declare-fun b!1167930 () Bool)

(declare-fun res!774828 () Bool)

(assert (=> b!1167930 (=> (not res!774828) (not e!663794))))

(assert (=> b!1167930 (= res!774828 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36932 _keys!1208))))))

(declare-fun b!1167931 () Bool)

(declare-fun res!774834 () Bool)

(assert (=> b!1167931 (=> (not res!774834) (not e!663794))))

(assert (=> b!1167931 (= res!774834 (= (select (arr!36396 _keys!1208) i!673) k!934))))

(declare-fun b!1167932 () Bool)

(declare-fun res!774839 () Bool)

(declare-fun e!663796 () Bool)

(assert (=> b!1167932 (=> (not res!774839) (not e!663796))))

(declare-datatypes ((List!25525 0))(
  ( (Nil!25522) (Cons!25521 (h!26730 (_ BitVec 64)) (t!37320 List!25525)) )
))
(declare-fun arrayNoDuplicates!0 (array!75491 (_ BitVec 32) List!25525) Bool)

(assert (=> b!1167932 (= res!774839 (arrayNoDuplicates!0 lt!525821 #b00000000000000000000000000000000 Nil!25522))))

(declare-fun b!1167933 () Bool)

(declare-fun res!774832 () Bool)

(assert (=> b!1167933 (=> (not res!774832) (not e!663794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167933 (= res!774832 (validMask!0 mask!1564))))

(declare-fun b!1167934 () Bool)

(declare-fun res!774838 () Bool)

(assert (=> b!1167934 (=> (not res!774838) (not e!663794))))

(assert (=> b!1167934 (= res!774838 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25522))))

(declare-fun b!1167935 () Bool)

(assert (=> b!1167935 (= e!663796 (not e!663801))))

(declare-fun res!774835 () Bool)

(assert (=> b!1167935 (=> res!774835 e!663801)))

(assert (=> b!1167935 (= res!774835 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167935 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!525823 () Unit!38536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75491 (_ BitVec 64) (_ BitVec 32)) Unit!38536)

(assert (=> b!1167935 (= lt!525823 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1167936 () Bool)

(declare-fun e!663797 () Bool)

(assert (=> b!1167936 (= e!663797 tp_is_empty!29333)))

(declare-fun b!1167937 () Bool)

(assert (=> b!1167937 (= e!663795 (and e!663797 mapRes!45824))))

(declare-fun condMapEmpty!45824 () Bool)

(declare-fun mapDefault!45824 () ValueCell!13957)

