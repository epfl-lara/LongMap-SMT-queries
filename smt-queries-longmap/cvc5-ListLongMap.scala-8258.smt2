; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100496 () Bool)

(assert start!100496)

(declare-fun b_free!25819 () Bool)

(declare-fun b_next!25819 () Bool)

(assert (=> start!100496 (= b_free!25819 (not b_next!25819))))

(declare-fun tp!90446 () Bool)

(declare-fun b_and!42525 () Bool)

(assert (=> start!100496 (= tp!90446 b_and!42525)))

(declare-fun b!1200426 () Bool)

(declare-fun e!681716 () Bool)

(declare-datatypes ((V!45825 0))(
  ( (V!45826 (val!15318 Int)) )
))
(declare-datatypes ((tuple2!19608 0))(
  ( (tuple2!19609 (_1!9815 (_ BitVec 64)) (_2!9815 V!45825)) )
))
(declare-datatypes ((List!26429 0))(
  ( (Nil!26426) (Cons!26425 (h!27634 tuple2!19608) (t!39228 List!26429)) )
))
(declare-datatypes ((ListLongMap!17577 0))(
  ( (ListLongMap!17578 (toList!8804 List!26429)) )
))
(declare-fun call!57286 () ListLongMap!17577)

(declare-fun call!57287 () ListLongMap!17577)

(assert (=> b!1200426 (= e!681716 (= call!57286 call!57287))))

(declare-fun b!1200427 () Bool)

(declare-fun res!799093 () Bool)

(declare-fun e!681717 () Bool)

(assert (=> b!1200427 (=> (not res!799093) (not e!681717))))

(declare-datatypes ((array!77819 0))(
  ( (array!77820 (arr!37554 (Array (_ BitVec 32) (_ BitVec 64))) (size!38090 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77819)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1200427 (= res!799093 (= (select (arr!37554 _keys!1208) i!673) k!934))))

(declare-fun b!1200428 () Bool)

(declare-fun e!681723 () Bool)

(declare-fun tp_is_empty!30523 () Bool)

(assert (=> b!1200428 (= e!681723 tp_is_empty!30523)))

(declare-fun zeroValue!944 () V!45825)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14552 0))(
  ( (ValueCellFull!14552 (v!17956 V!45825)) (EmptyCell!14552) )
))
(declare-datatypes ((array!77821 0))(
  ( (array!77822 (arr!37555 (Array (_ BitVec 32) ValueCell!14552)) (size!38091 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77821)

(declare-fun minValue!944 () V!45825)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57283 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5243 (array!77819 array!77821 (_ BitVec 32) (_ BitVec 32) V!45825 V!45825 (_ BitVec 32) Int) ListLongMap!17577)

(assert (=> bm!57283 (= call!57287 (getCurrentListMapNoExtraKeys!5243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200429 () Bool)

(declare-fun res!799102 () Bool)

(assert (=> b!1200429 (=> (not res!799102) (not e!681717))))

(assert (=> b!1200429 (= res!799102 (and (= (size!38091 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38090 _keys!1208) (size!38091 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200430 () Bool)

(declare-fun -!1780 (ListLongMap!17577 (_ BitVec 64)) ListLongMap!17577)

(assert (=> b!1200430 (= e!681716 (= call!57286 (-!1780 call!57287 k!934)))))

(declare-fun b!1200431 () Bool)

(declare-fun e!681721 () Bool)

(declare-fun e!681719 () Bool)

(assert (=> b!1200431 (= e!681721 (not e!681719))))

(declare-fun res!799095 () Bool)

(assert (=> b!1200431 (=> res!799095 e!681719)))

(assert (=> b!1200431 (= res!799095 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200431 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39800 0))(
  ( (Unit!39801) )
))
(declare-fun lt!544042 () Unit!39800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77819 (_ BitVec 64) (_ BitVec 32)) Unit!39800)

(assert (=> b!1200431 (= lt!544042 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1200432 () Bool)

(declare-fun e!681720 () Bool)

(assert (=> b!1200432 (= e!681719 e!681720)))

(declare-fun res!799094 () Bool)

(assert (=> b!1200432 (=> res!799094 e!681720)))

(assert (=> b!1200432 (= res!799094 (not (= from!1455 i!673)))))

(declare-fun lt!544045 () array!77821)

(declare-fun lt!544043 () array!77819)

(declare-fun lt!544041 () ListLongMap!17577)

(assert (=> b!1200432 (= lt!544041 (getCurrentListMapNoExtraKeys!5243 lt!544043 lt!544045 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3163 (Int (_ BitVec 64)) V!45825)

(assert (=> b!1200432 (= lt!544045 (array!77822 (store (arr!37555 _values!996) i!673 (ValueCellFull!14552 (dynLambda!3163 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38091 _values!996)))))

(declare-fun lt!544044 () ListLongMap!17577)

(assert (=> b!1200432 (= lt!544044 (getCurrentListMapNoExtraKeys!5243 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200433 () Bool)

(declare-fun res!799097 () Bool)

(assert (=> b!1200433 (=> (not res!799097) (not e!681717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200433 (= res!799097 (validKeyInArray!0 k!934))))

(declare-fun b!1200434 () Bool)

(assert (=> b!1200434 (= e!681720 (bvslt from!1455 (size!38090 _keys!1208)))))

(assert (=> b!1200434 e!681716))

(declare-fun c!117440 () Bool)

(assert (=> b!1200434 (= c!117440 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544040 () Unit!39800)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!987 (array!77819 array!77821 (_ BitVec 32) (_ BitVec 32) V!45825 V!45825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39800)

(assert (=> b!1200434 (= lt!544040 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!987 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200435 () Bool)

(declare-fun e!681724 () Bool)

(declare-fun mapRes!47627 () Bool)

(assert (=> b!1200435 (= e!681724 (and e!681723 mapRes!47627))))

(declare-fun condMapEmpty!47627 () Bool)

(declare-fun mapDefault!47627 () ValueCell!14552)

