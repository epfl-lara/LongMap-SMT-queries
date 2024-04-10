; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99874 () Bool)

(assert start!99874)

(declare-fun b_free!25453 () Bool)

(declare-fun b_next!25453 () Bool)

(assert (=> start!99874 (= b_free!25453 (not b_next!25453))))

(declare-fun tp!89072 () Bool)

(declare-fun b_and!41773 () Bool)

(assert (=> start!99874 (= tp!89072 b_and!41773)))

(declare-fun b!1188319 () Bool)

(declare-fun res!790095 () Bool)

(declare-fun e!675681 () Bool)

(assert (=> b!1188319 (=> (not res!790095) (not e!675681))))

(declare-datatypes ((array!76761 0))(
  ( (array!76762 (arr!37030 (Array (_ BitVec 32) (_ BitVec 64))) (size!37566 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76761)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45105 0))(
  ( (V!45106 (val!15048 Int)) )
))
(declare-datatypes ((ValueCell!14282 0))(
  ( (ValueCellFull!14282 (v!17686 V!45105)) (EmptyCell!14282) )
))
(declare-datatypes ((array!76763 0))(
  ( (array!76764 (arr!37031 (Array (_ BitVec 32) ValueCell!14282)) (size!37567 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76763)

(assert (=> b!1188319 (= res!790095 (and (= (size!37567 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37566 _keys!1208) (size!37567 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188320 () Bool)

(declare-fun res!790096 () Bool)

(assert (=> b!1188320 (=> (not res!790096) (not e!675681))))

(declare-datatypes ((List!26065 0))(
  ( (Nil!26062) (Cons!26061 (h!27270 (_ BitVec 64)) (t!38510 List!26065)) )
))
(declare-fun arrayNoDuplicates!0 (array!76761 (_ BitVec 32) List!26065) Bool)

(assert (=> b!1188320 (= res!790096 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26062))))

(declare-fun b!1188321 () Bool)

(declare-fun e!675677 () Bool)

(declare-fun tp_is_empty!29983 () Bool)

(assert (=> b!1188321 (= e!675677 tp_is_empty!29983)))

(declare-fun mapIsEmpty!46802 () Bool)

(declare-fun mapRes!46802 () Bool)

(assert (=> mapIsEmpty!46802 mapRes!46802))

(declare-fun mapNonEmpty!46802 () Bool)

(declare-fun tp!89073 () Bool)

(declare-fun e!675679 () Bool)

(assert (=> mapNonEmpty!46802 (= mapRes!46802 (and tp!89073 e!675679))))

(declare-fun mapRest!46802 () (Array (_ BitVec 32) ValueCell!14282))

(declare-fun mapKey!46802 () (_ BitVec 32))

(declare-fun mapValue!46802 () ValueCell!14282)

(assert (=> mapNonEmpty!46802 (= (arr!37031 _values!996) (store mapRest!46802 mapKey!46802 mapValue!46802))))

(declare-fun b!1188322 () Bool)

(declare-fun res!790091 () Bool)

(assert (=> b!1188322 (=> (not res!790091) (not e!675681))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188322 (= res!790091 (validKeyInArray!0 k!934))))

(declare-fun b!1188323 () Bool)

(declare-fun e!675678 () Bool)

(assert (=> b!1188323 (= e!675678 true)))

(declare-fun zeroValue!944 () V!45105)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45105)

(declare-fun lt!540637 () array!76763)

(declare-fun lt!540638 () array!76761)

(declare-datatypes ((tuple2!19324 0))(
  ( (tuple2!19325 (_1!9673 (_ BitVec 64)) (_2!9673 V!45105)) )
))
(declare-datatypes ((List!26066 0))(
  ( (Nil!26063) (Cons!26062 (h!27271 tuple2!19324) (t!38511 List!26066)) )
))
(declare-datatypes ((ListLongMap!17293 0))(
  ( (ListLongMap!17294 (toList!8662 List!26066)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5103 (array!76761 array!76763 (_ BitVec 32) (_ BitVec 32) V!45105 V!45105 (_ BitVec 32) Int) ListLongMap!17293)

(declare-fun -!1692 (ListLongMap!17293 (_ BitVec 64)) ListLongMap!17293)

(assert (=> b!1188323 (= (getCurrentListMapNoExtraKeys!5103 lt!540638 lt!540637 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1692 (getCurrentListMapNoExtraKeys!5103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39422 0))(
  ( (Unit!39423) )
))
(declare-fun lt!540641 () Unit!39422)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!901 (array!76761 array!76763 (_ BitVec 32) (_ BitVec 32) V!45105 V!45105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39422)

(assert (=> b!1188323 (= lt!540641 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!901 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188325 () Bool)

(declare-fun res!790090 () Bool)

(assert (=> b!1188325 (=> (not res!790090) (not e!675681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188325 (= res!790090 (validMask!0 mask!1564))))

(declare-fun b!1188326 () Bool)

(declare-fun e!675676 () Bool)

(assert (=> b!1188326 (= e!675676 (and e!675677 mapRes!46802))))

(declare-fun condMapEmpty!46802 () Bool)

(declare-fun mapDefault!46802 () ValueCell!14282)

