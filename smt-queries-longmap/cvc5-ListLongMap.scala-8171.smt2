; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99892 () Bool)

(assert start!99892)

(declare-fun b_free!25471 () Bool)

(declare-fun b_next!25471 () Bool)

(assert (=> start!99892 (= b_free!25471 (not b_next!25471))))

(declare-fun tp!89127 () Bool)

(declare-fun b_and!41809 () Bool)

(assert (=> start!99892 (= tp!89127 b_and!41809)))

(declare-fun b!1188742 () Bool)

(declare-fun e!675891 () Bool)

(declare-fun e!675895 () Bool)

(assert (=> b!1188742 (= e!675891 (not e!675895))))

(declare-fun res!790416 () Bool)

(assert (=> b!1188742 (=> res!790416 e!675895)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188742 (= res!790416 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76797 0))(
  ( (array!76798 (arr!37048 (Array (_ BitVec 32) (_ BitVec 64))) (size!37584 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76797)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188742 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39436 0))(
  ( (Unit!39437) )
))
(declare-fun lt!540802 () Unit!39436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76797 (_ BitVec 64) (_ BitVec 32)) Unit!39436)

(assert (=> b!1188742 (= lt!540802 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1188743 () Bool)

(declare-fun res!790419 () Bool)

(declare-fun e!675892 () Bool)

(assert (=> b!1188743 (=> (not res!790419) (not e!675892))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188743 (= res!790419 (validMask!0 mask!1564))))

(declare-fun b!1188744 () Bool)

(declare-fun res!790421 () Bool)

(assert (=> b!1188744 (=> (not res!790421) (not e!675892))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45129 0))(
  ( (V!45130 (val!15057 Int)) )
))
(declare-datatypes ((ValueCell!14291 0))(
  ( (ValueCellFull!14291 (v!17695 V!45129)) (EmptyCell!14291) )
))
(declare-datatypes ((array!76799 0))(
  ( (array!76800 (arr!37049 (Array (_ BitVec 32) ValueCell!14291)) (size!37585 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76799)

(assert (=> b!1188744 (= res!790421 (and (= (size!37585 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37584 _keys!1208) (size!37585 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188745 () Bool)

(declare-fun e!675898 () Bool)

(assert (=> b!1188745 (= e!675898 true)))

(declare-fun zeroValue!944 () V!45129)

(declare-fun lt!540800 () array!76799)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45129)

(declare-fun lt!540804 () array!76797)

(declare-datatypes ((tuple2!19336 0))(
  ( (tuple2!19337 (_1!9679 (_ BitVec 64)) (_2!9679 V!45129)) )
))
(declare-datatypes ((List!26079 0))(
  ( (Nil!26076) (Cons!26075 (h!27284 tuple2!19336) (t!38542 List!26079)) )
))
(declare-datatypes ((ListLongMap!17305 0))(
  ( (ListLongMap!17306 (toList!8668 List!26079)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5109 (array!76797 array!76799 (_ BitVec 32) (_ BitVec 32) V!45129 V!45129 (_ BitVec 32) Int) ListLongMap!17305)

(declare-fun -!1698 (ListLongMap!17305 (_ BitVec 64)) ListLongMap!17305)

(assert (=> b!1188745 (= (getCurrentListMapNoExtraKeys!5109 lt!540804 lt!540800 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1698 (getCurrentListMapNoExtraKeys!5109 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun lt!540803 () Unit!39436)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!907 (array!76797 array!76799 (_ BitVec 32) (_ BitVec 32) V!45129 V!45129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39436)

(assert (=> b!1188745 (= lt!540803 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!907 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188746 () Bool)

(declare-fun res!790420 () Bool)

(assert (=> b!1188746 (=> (not res!790420) (not e!675892))))

(assert (=> b!1188746 (= res!790420 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37584 _keys!1208))))))

(declare-fun b!1188747 () Bool)

(declare-fun res!790412 () Bool)

(assert (=> b!1188747 (=> (not res!790412) (not e!675892))))

(assert (=> b!1188747 (= res!790412 (= (select (arr!37048 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!46829 () Bool)

(declare-fun mapRes!46829 () Bool)

(declare-fun tp!89126 () Bool)

(declare-fun e!675894 () Bool)

(assert (=> mapNonEmpty!46829 (= mapRes!46829 (and tp!89126 e!675894))))

(declare-fun mapRest!46829 () (Array (_ BitVec 32) ValueCell!14291))

(declare-fun mapKey!46829 () (_ BitVec 32))

(declare-fun mapValue!46829 () ValueCell!14291)

(assert (=> mapNonEmpty!46829 (= (arr!37049 _values!996) (store mapRest!46829 mapKey!46829 mapValue!46829))))

(declare-fun b!1188748 () Bool)

(declare-fun tp_is_empty!30001 () Bool)

(assert (=> b!1188748 (= e!675894 tp_is_empty!30001)))

(declare-fun b!1188749 () Bool)

(assert (=> b!1188749 (= e!675892 e!675891)))

(declare-fun res!790413 () Bool)

(assert (=> b!1188749 (=> (not res!790413) (not e!675891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76797 (_ BitVec 32)) Bool)

(assert (=> b!1188749 (= res!790413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540804 mask!1564))))

(assert (=> b!1188749 (= lt!540804 (array!76798 (store (arr!37048 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37584 _keys!1208)))))

(declare-fun b!1188750 () Bool)

(declare-fun e!675897 () Bool)

(assert (=> b!1188750 (= e!675897 tp_is_empty!30001)))

(declare-fun b!1188752 () Bool)

(assert (=> b!1188752 (= e!675895 e!675898)))

(declare-fun res!790414 () Bool)

(assert (=> b!1188752 (=> res!790414 e!675898)))

(assert (=> b!1188752 (= res!790414 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540801 () ListLongMap!17305)

(assert (=> b!1188752 (= lt!540801 (getCurrentListMapNoExtraKeys!5109 lt!540804 lt!540800 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3053 (Int (_ BitVec 64)) V!45129)

(assert (=> b!1188752 (= lt!540800 (array!76800 (store (arr!37049 _values!996) i!673 (ValueCellFull!14291 (dynLambda!3053 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37585 _values!996)))))

(declare-fun lt!540799 () ListLongMap!17305)

(assert (=> b!1188752 (= lt!540799 (getCurrentListMapNoExtraKeys!5109 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188753 () Bool)

(declare-fun res!790415 () Bool)

(assert (=> b!1188753 (=> (not res!790415) (not e!675892))))

(declare-datatypes ((List!26080 0))(
  ( (Nil!26077) (Cons!26076 (h!27285 (_ BitVec 64)) (t!38543 List!26080)) )
))
(declare-fun arrayNoDuplicates!0 (array!76797 (_ BitVec 32) List!26080) Bool)

(assert (=> b!1188753 (= res!790415 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26077))))

(declare-fun b!1188754 () Bool)

(declare-fun res!790423 () Bool)

(assert (=> b!1188754 (=> (not res!790423) (not e!675892))))

(assert (=> b!1188754 (= res!790423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46829 () Bool)

(assert (=> mapIsEmpty!46829 mapRes!46829))

(declare-fun b!1188755 () Bool)

(declare-fun res!790417 () Bool)

(assert (=> b!1188755 (=> (not res!790417) (not e!675891))))

(assert (=> b!1188755 (= res!790417 (arrayNoDuplicates!0 lt!540804 #b00000000000000000000000000000000 Nil!26077))))

(declare-fun b!1188756 () Bool)

(declare-fun e!675896 () Bool)

(assert (=> b!1188756 (= e!675896 (and e!675897 mapRes!46829))))

(declare-fun condMapEmpty!46829 () Bool)

(declare-fun mapDefault!46829 () ValueCell!14291)

