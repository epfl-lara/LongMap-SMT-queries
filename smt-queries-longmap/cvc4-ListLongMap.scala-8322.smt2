; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101284 () Bool)

(assert start!101284)

(declare-fun b_free!26207 () Bool)

(declare-fun b_next!26207 () Bool)

(assert (=> start!101284 (= b_free!26207 (not b_next!26207))))

(declare-fun tp!91643 () Bool)

(declare-fun b_and!43531 () Bool)

(assert (=> start!101284 (= tp!91643 b_and!43531)))

(declare-fun b!1216880 () Bool)

(declare-fun e!690862 () Bool)

(declare-fun tp_is_empty!30911 () Bool)

(assert (=> b!1216880 (= e!690862 tp_is_empty!30911)))

(declare-fun b!1216881 () Bool)

(declare-fun e!690859 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78593 0))(
  ( (array!78594 (arr!37931 (Array (_ BitVec 32) (_ BitVec 64))) (size!38467 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78593)

(assert (=> b!1216881 (= e!690859 (bvslt from!1455 (size!38467 _keys!1208)))))

(declare-fun b!1216882 () Bool)

(declare-fun res!808109 () Bool)

(declare-fun e!690858 () Bool)

(assert (=> b!1216882 (=> (not res!808109) (not e!690858))))

(declare-datatypes ((List!26744 0))(
  ( (Nil!26741) (Cons!26740 (h!27949 (_ BitVec 64)) (t!39931 List!26744)) )
))
(declare-fun arrayNoDuplicates!0 (array!78593 (_ BitVec 32) List!26744) Bool)

(assert (=> b!1216882 (= res!808109 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26741))))

(declare-fun b!1216883 () Bool)

(declare-fun e!690863 () Bool)

(assert (=> b!1216883 (= e!690863 tp_is_empty!30911)))

(declare-fun b!1216884 () Bool)

(declare-fun e!690864 () Bool)

(assert (=> b!1216884 (= e!690858 e!690864)))

(declare-fun res!808103 () Bool)

(assert (=> b!1216884 (=> (not res!808103) (not e!690864))))

(declare-fun lt!553067 () array!78593)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78593 (_ BitVec 32)) Bool)

(assert (=> b!1216884 (= res!808103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553067 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216884 (= lt!553067 (array!78594 (store (arr!37931 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38467 _keys!1208)))))

(declare-fun b!1216886 () Bool)

(declare-fun e!690860 () Bool)

(assert (=> b!1216886 (= e!690860 e!690859)))

(declare-fun res!808104 () Bool)

(assert (=> b!1216886 (=> res!808104 e!690859)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216886 (= res!808104 (not (validKeyInArray!0 (select (arr!37931 _keys!1208) from!1455))))))

(declare-datatypes ((V!46341 0))(
  ( (V!46342 (val!15512 Int)) )
))
(declare-fun zeroValue!944 () V!46341)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!14746 0))(
  ( (ValueCellFull!14746 (v!18165 V!46341)) (EmptyCell!14746) )
))
(declare-datatypes ((array!78595 0))(
  ( (array!78596 (arr!37932 (Array (_ BitVec 32) ValueCell!14746)) (size!38468 (_ BitVec 32))) )
))
(declare-fun lt!553065 () array!78595)

(declare-fun _values!996 () array!78595)

(declare-fun minValue!944 () V!46341)

(declare-datatypes ((tuple2!19940 0))(
  ( (tuple2!19941 (_1!9981 (_ BitVec 64)) (_2!9981 V!46341)) )
))
(declare-datatypes ((List!26745 0))(
  ( (Nil!26742) (Cons!26741 (h!27950 tuple2!19940) (t!39932 List!26745)) )
))
(declare-datatypes ((ListLongMap!17909 0))(
  ( (ListLongMap!17910 (toList!8970 List!26745)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5397 (array!78593 array!78595 (_ BitVec 32) (_ BitVec 32) V!46341 V!46341 (_ BitVec 32) Int) ListLongMap!17909)

(declare-fun -!1887 (ListLongMap!17909 (_ BitVec 64)) ListLongMap!17909)

(assert (=> b!1216886 (= (getCurrentListMapNoExtraKeys!5397 lt!553067 lt!553065 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1887 (getCurrentListMapNoExtraKeys!5397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!40346 0))(
  ( (Unit!40347) )
))
(declare-fun lt!553063 () Unit!40346)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1094 (array!78593 array!78595 (_ BitVec 32) (_ BitVec 32) V!46341 V!46341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40346)

(assert (=> b!1216886 (= lt!553063 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1094 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216887 () Bool)

(declare-fun res!808100 () Bool)

(assert (=> b!1216887 (=> (not res!808100) (not e!690858))))

(assert (=> b!1216887 (= res!808100 (and (= (size!38468 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38467 _keys!1208) (size!38468 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216888 () Bool)

(declare-fun res!808098 () Bool)

(assert (=> b!1216888 (=> (not res!808098) (not e!690858))))

(assert (=> b!1216888 (= res!808098 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!48241 () Bool)

(declare-fun mapRes!48241 () Bool)

(assert (=> mapIsEmpty!48241 mapRes!48241))

(declare-fun b!1216889 () Bool)

(declare-fun e!690861 () Bool)

(assert (=> b!1216889 (= e!690861 (and e!690862 mapRes!48241))))

(declare-fun condMapEmpty!48241 () Bool)

(declare-fun mapDefault!48241 () ValueCell!14746)

