; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99286 () Bool)

(assert start!99286)

(declare-fun b_free!24865 () Bool)

(declare-fun b_next!24865 () Bool)

(assert (=> start!99286 (= b_free!24865 (not b_next!24865))))

(declare-fun tp!87309 () Bool)

(declare-fun b_and!40597 () Bool)

(assert (=> start!99286 (= tp!87309 b_and!40597)))

(declare-datatypes ((array!75613 0))(
  ( (array!75614 (arr!36456 (Array (_ BitVec 32) (_ BitVec 64))) (size!36992 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75613)

(declare-fun e!664788 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1169675 () Bool)

(declare-fun arrayContainsKey!0 (array!75613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169675 (= e!664788 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169676 () Bool)

(declare-fun e!664783 () Bool)

(declare-fun e!664792 () Bool)

(assert (=> b!1169676 (= e!664783 (not e!664792))))

(declare-fun res!776163 () Bool)

(assert (=> b!1169676 (=> res!776163 e!664792)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169676 (= res!776163 (bvsgt from!1455 i!673))))

(assert (=> b!1169676 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38590 0))(
  ( (Unit!38591) )
))
(declare-fun lt!526718 () Unit!38590)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75613 (_ BitVec 64) (_ BitVec 32)) Unit!38590)

(assert (=> b!1169676 (= lt!526718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1169677 () Bool)

(declare-fun e!664785 () Bool)

(assert (=> b!1169677 (= e!664785 e!664783)))

(declare-fun res!776165 () Bool)

(assert (=> b!1169677 (=> (not res!776165) (not e!664783))))

(declare-fun lt!526714 () array!75613)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75613 (_ BitVec 32)) Bool)

(assert (=> b!1169677 (= res!776165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526714 mask!1564))))

(assert (=> b!1169677 (= lt!526714 (array!75614 (store (arr!36456 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36992 _keys!1208)))))

(declare-fun b!1169678 () Bool)

(declare-fun e!664784 () Bool)

(declare-fun e!664789 () Bool)

(assert (=> b!1169678 (= e!664784 e!664789)))

(declare-fun res!776159 () Bool)

(assert (=> b!1169678 (=> res!776159 e!664789)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169678 (= res!776159 (not (validKeyInArray!0 (select (arr!36456 _keys!1208) from!1455))))))

(declare-datatypes ((V!44321 0))(
  ( (V!44322 (val!14754 Int)) )
))
(declare-datatypes ((tuple2!18838 0))(
  ( (tuple2!18839 (_1!9430 (_ BitVec 64)) (_2!9430 V!44321)) )
))
(declare-datatypes ((List!25575 0))(
  ( (Nil!25572) (Cons!25571 (h!26780 tuple2!18838) (t!37432 List!25575)) )
))
(declare-datatypes ((ListLongMap!16807 0))(
  ( (ListLongMap!16808 (toList!8419 List!25575)) )
))
(declare-fun lt!526717 () ListLongMap!16807)

(declare-fun lt!526716 () ListLongMap!16807)

(assert (=> b!1169678 (= lt!526717 lt!526716)))

(declare-fun lt!526720 () ListLongMap!16807)

(declare-fun -!1490 (ListLongMap!16807 (_ BitVec 64)) ListLongMap!16807)

(assert (=> b!1169678 (= lt!526716 (-!1490 lt!526720 k!934))))

(declare-fun zeroValue!944 () V!44321)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13988 0))(
  ( (ValueCellFull!13988 (v!17392 V!44321)) (EmptyCell!13988) )
))
(declare-datatypes ((array!75615 0))(
  ( (array!75616 (arr!36457 (Array (_ BitVec 32) ValueCell!13988)) (size!36993 (_ BitVec 32))) )
))
(declare-fun lt!526722 () array!75615)

(declare-fun minValue!944 () V!44321)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4883 (array!75613 array!75615 (_ BitVec 32) (_ BitVec 32) V!44321 V!44321 (_ BitVec 32) Int) ListLongMap!16807)

(assert (=> b!1169678 (= lt!526717 (getCurrentListMapNoExtraKeys!4883 lt!526714 lt!526722 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75615)

(assert (=> b!1169678 (= lt!526720 (getCurrentListMapNoExtraKeys!4883 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526715 () Unit!38590)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!717 (array!75613 array!75615 (_ BitVec 32) (_ BitVec 32) V!44321 V!44321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38590)

(assert (=> b!1169678 (= lt!526715 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!717 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169679 () Bool)

(declare-fun res!776155 () Bool)

(assert (=> b!1169679 (=> (not res!776155) (not e!664785))))

(assert (=> b!1169679 (= res!776155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169680 () Bool)

(declare-fun e!664790 () Bool)

(assert (=> b!1169680 (= e!664790 e!664788)))

(declare-fun res!776166 () Bool)

(assert (=> b!1169680 (=> res!776166 e!664788)))

(assert (=> b!1169680 (= res!776166 (not (= (select (arr!36456 _keys!1208) from!1455) k!934)))))

(declare-fun res!776162 () Bool)

(assert (=> start!99286 (=> (not res!776162) (not e!664785))))

(assert (=> start!99286 (= res!776162 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36992 _keys!1208))))))

(assert (=> start!99286 e!664785))

(declare-fun tp_is_empty!29395 () Bool)

(assert (=> start!99286 tp_is_empty!29395))

(declare-fun array_inv!27864 (array!75613) Bool)

(assert (=> start!99286 (array_inv!27864 _keys!1208)))

(assert (=> start!99286 true))

(assert (=> start!99286 tp!87309))

(declare-fun e!664791 () Bool)

(declare-fun array_inv!27865 (array!75615) Bool)

(assert (=> start!99286 (and (array_inv!27865 _values!996) e!664791)))

(declare-fun b!1169674 () Bool)

(declare-fun res!776160 () Bool)

(assert (=> b!1169674 (=> (not res!776160) (not e!664785))))

(assert (=> b!1169674 (= res!776160 (= (select (arr!36456 _keys!1208) i!673) k!934))))

(declare-fun b!1169681 () Bool)

(declare-fun e!664786 () Bool)

(assert (=> b!1169681 (= e!664786 tp_is_empty!29395)))

(declare-fun b!1169682 () Bool)

(declare-fun res!776153 () Bool)

(assert (=> b!1169682 (=> (not res!776153) (not e!664785))))

(assert (=> b!1169682 (= res!776153 (and (= (size!36993 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36992 _keys!1208) (size!36993 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169683 () Bool)

(assert (=> b!1169683 (= e!664792 e!664784)))

(declare-fun res!776167 () Bool)

(assert (=> b!1169683 (=> res!776167 e!664784)))

(assert (=> b!1169683 (= res!776167 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526721 () ListLongMap!16807)

(assert (=> b!1169683 (= lt!526721 (getCurrentListMapNoExtraKeys!4883 lt!526714 lt!526722 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526713 () V!44321)

(assert (=> b!1169683 (= lt!526722 (array!75616 (store (arr!36457 _values!996) i!673 (ValueCellFull!13988 lt!526713)) (size!36993 _values!996)))))

(declare-fun dynLambda!2860 (Int (_ BitVec 64)) V!44321)

(assert (=> b!1169683 (= lt!526713 (dynLambda!2860 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526719 () ListLongMap!16807)

(assert (=> b!1169683 (= lt!526719 (getCurrentListMapNoExtraKeys!4883 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169684 () Bool)

(declare-fun e!664782 () Bool)

(declare-fun mapRes!45920 () Bool)

(assert (=> b!1169684 (= e!664791 (and e!664782 mapRes!45920))))

(declare-fun condMapEmpty!45920 () Bool)

(declare-fun mapDefault!45920 () ValueCell!13988)

