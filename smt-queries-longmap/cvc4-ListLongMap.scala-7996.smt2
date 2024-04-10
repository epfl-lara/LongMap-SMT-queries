; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98820 () Bool)

(assert start!98820)

(declare-fun b_free!24425 () Bool)

(declare-fun b_next!24425 () Bool)

(assert (=> start!98820 (= b_free!24425 (not b_next!24425))))

(declare-fun tp!85985 () Bool)

(declare-fun b_and!39699 () Bool)

(assert (=> start!98820 (= tp!85985 b_and!39699)))

(declare-fun mapNonEmpty!45257 () Bool)

(declare-fun mapRes!45257 () Bool)

(declare-fun tp!85986 () Bool)

(declare-fun e!656630 () Bool)

(assert (=> mapNonEmpty!45257 (= mapRes!45257 (and tp!85986 e!656630))))

(declare-datatypes ((V!43733 0))(
  ( (V!43734 (val!14534 Int)) )
))
(declare-datatypes ((ValueCell!13768 0))(
  ( (ValueCellFull!13768 (v!17171 V!43733)) (EmptyCell!13768) )
))
(declare-datatypes ((array!74757 0))(
  ( (array!74758 (arr!36029 (Array (_ BitVec 32) ValueCell!13768)) (size!36565 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74757)

(declare-fun mapValue!45257 () ValueCell!13768)

(declare-fun mapRest!45257 () (Array (_ BitVec 32) ValueCell!13768))

(declare-fun mapKey!45257 () (_ BitVec 32))

(assert (=> mapNonEmpty!45257 (= (arr!36029 _values!996) (store mapRest!45257 mapKey!45257 mapValue!45257))))

(declare-fun bm!54639 () Bool)

(declare-datatypes ((tuple2!18476 0))(
  ( (tuple2!18477 (_1!9249 (_ BitVec 64)) (_2!9249 V!43733)) )
))
(declare-datatypes ((List!25220 0))(
  ( (Nil!25217) (Cons!25216 (h!26425 tuple2!18476) (t!36637 List!25220)) )
))
(declare-datatypes ((ListLongMap!16445 0))(
  ( (ListLongMap!16446 (toList!8238 List!25220)) )
))
(declare-fun call!54649 () ListLongMap!16445)

(declare-fun call!54646 () ListLongMap!16445)

(assert (=> bm!54639 (= call!54649 call!54646)))

(declare-fun b!1154562 () Bool)

(declare-fun e!656629 () Bool)

(declare-fun tp_is_empty!28955 () Bool)

(assert (=> b!1154562 (= e!656629 tp_is_empty!28955)))

(declare-fun b!1154563 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6751 (ListLongMap!16445 (_ BitVec 64)) Bool)

(assert (=> b!1154563 (contains!6751 call!54646 k!934)))

(declare-datatypes ((Unit!38007 0))(
  ( (Unit!38008) )
))
(declare-fun lt!517762 () Unit!38007)

(declare-fun call!54645 () Unit!38007)

(assert (=> b!1154563 (= lt!517762 call!54645)))

(declare-fun call!54642 () Bool)

(assert (=> b!1154563 call!54642))

(declare-fun lt!517763 () ListLongMap!16445)

(declare-fun lt!517772 () ListLongMap!16445)

(declare-fun zeroValue!944 () V!43733)

(declare-fun +!3651 (ListLongMap!16445 tuple2!18476) ListLongMap!16445)

(assert (=> b!1154563 (= lt!517763 (+!3651 lt!517772 (tuple2!18477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517767 () Unit!38007)

(declare-fun addStillContains!897 (ListLongMap!16445 (_ BitVec 64) V!43733 (_ BitVec 64)) Unit!38007)

(assert (=> b!1154563 (= lt!517767 (addStillContains!897 lt!517772 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!656625 () Unit!38007)

(assert (=> b!1154563 (= e!656625 lt!517762)))

(declare-fun b!1154564 () Bool)

(assert (=> b!1154564 (= e!656630 tp_is_empty!28955)))

(declare-fun b!1154565 () Bool)

(declare-fun e!656623 () Unit!38007)

(declare-fun Unit!38009 () Unit!38007)

(assert (=> b!1154565 (= e!656623 Unit!38009)))

(declare-fun b!1154566 () Bool)

(declare-fun e!656636 () Unit!38007)

(declare-fun e!656635 () Unit!38007)

(assert (=> b!1154566 (= e!656636 e!656635)))

(declare-fun c!114688 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!517759 () Bool)

(assert (=> b!1154566 (= c!114688 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517759))))

(declare-fun b!1154567 () Bool)

(declare-fun e!656633 () Bool)

(assert (=> b!1154567 (= e!656633 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517759) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154568 () Bool)

(declare-fun res!767241 () Bool)

(declare-fun e!656628 () Bool)

(assert (=> b!1154568 (=> (not res!767241) (not e!656628))))

(declare-datatypes ((array!74759 0))(
  ( (array!74760 (arr!36030 (Array (_ BitVec 32) (_ BitVec 64))) (size!36566 (_ BitVec 32))) )
))
(declare-fun lt!517778 () array!74759)

(declare-datatypes ((List!25221 0))(
  ( (Nil!25218) (Cons!25217 (h!26426 (_ BitVec 64)) (t!36638 List!25221)) )
))
(declare-fun arrayNoDuplicates!0 (array!74759 (_ BitVec 32) List!25221) Bool)

(assert (=> b!1154568 (= res!767241 (arrayNoDuplicates!0 lt!517778 #b00000000000000000000000000000000 Nil!25218))))

(declare-fun b!1154569 () Bool)

(declare-fun res!767243 () Bool)

(declare-fun e!656622 () Bool)

(assert (=> b!1154569 (=> (not res!767243) (not e!656622))))

(declare-fun _keys!1208 () array!74759)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154569 (= res!767243 (= (select (arr!36030 _keys!1208) i!673) k!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43733)

(declare-fun call!54643 () ListLongMap!16445)

(declare-fun bm!54640 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4707 (array!74759 array!74757 (_ BitVec 32) (_ BitVec 32) V!43733 V!43733 (_ BitVec 32) Int) ListLongMap!16445)

(assert (=> bm!54640 (= call!54643 (getCurrentListMapNoExtraKeys!4707 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154570 () Bool)

(declare-fun res!767234 () Bool)

(assert (=> b!1154570 (=> (not res!767234) (not e!656622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74759 (_ BitVec 32)) Bool)

(assert (=> b!1154570 (= res!767234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!656626 () Bool)

(declare-fun b!1154571 () Bool)

(declare-fun arrayContainsKey!0 (array!74759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154571 (= e!656626 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154572 () Bool)

(declare-fun res!767240 () Bool)

(assert (=> b!1154572 (=> (not res!767240) (not e!656622))))

(assert (=> b!1154572 (= res!767240 (and (= (size!36565 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36566 _keys!1208) (size!36565 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54641 () Bool)

(declare-fun c!114684 () Bool)

(declare-fun c!114687 () Bool)

(assert (=> bm!54641 (= call!54645 (addStillContains!897 (ite c!114684 lt!517763 lt!517772) (ite c!114684 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114687 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114684 minValue!944 (ite c!114687 zeroValue!944 minValue!944)) k!934))))

(declare-fun lt!517765 () array!74757)

(declare-fun e!656621 () Bool)

(declare-fun lt!517758 () ListLongMap!16445)

(declare-fun b!1154573 () Bool)

(assert (=> b!1154573 (= e!656621 (= lt!517758 (getCurrentListMapNoExtraKeys!4707 lt!517778 lt!517765 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun call!54647 () ListLongMap!16445)

(declare-fun bm!54642 () Bool)

(assert (=> bm!54642 (= call!54647 (getCurrentListMapNoExtraKeys!4707 lt!517778 lt!517765 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54643 () Bool)

(declare-fun call!54648 () Bool)

(assert (=> bm!54643 (= call!54648 call!54642)))

(declare-fun b!1154574 () Bool)

(declare-fun e!656631 () Bool)

(assert (=> b!1154574 (= e!656631 (= call!54647 call!54643))))

(declare-fun bm!54644 () Bool)

(assert (=> bm!54644 (= call!54646 (+!3651 (ite c!114684 lt!517763 lt!517772) (ite c!114684 (tuple2!18477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114687 (tuple2!18477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1154575 () Bool)

(declare-fun Unit!38010 () Unit!38007)

(assert (=> b!1154575 (= e!656635 Unit!38010)))

(declare-fun b!1154576 () Bool)

(declare-fun Unit!38011 () Unit!38007)

(assert (=> b!1154576 (= e!656623 Unit!38011)))

(assert (=> b!1154576 (= lt!517759 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154576 (= c!114684 (and (not lt!517759) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517768 () Unit!38007)

(assert (=> b!1154576 (= lt!517768 e!656625)))

(declare-fun lt!517779 () Unit!38007)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!487 (array!74759 array!74757 (_ BitVec 32) (_ BitVec 32) V!43733 V!43733 (_ BitVec 64) (_ BitVec 32) Int) Unit!38007)

(assert (=> b!1154576 (= lt!517779 (lemmaListMapContainsThenArrayContainsFrom!487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114686 () Bool)

(assert (=> b!1154576 (= c!114686 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767239 () Bool)

(assert (=> b!1154576 (= res!767239 e!656633)))

(assert (=> b!1154576 (=> (not res!767239) (not e!656626))))

(assert (=> b!1154576 e!656626))

(declare-fun lt!517771 () Unit!38007)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74759 (_ BitVec 32) (_ BitVec 32)) Unit!38007)

(assert (=> b!1154576 (= lt!517771 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1154576 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25218)))

(declare-fun lt!517770 () Unit!38007)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74759 (_ BitVec 64) (_ BitVec 32) List!25221) Unit!38007)

(assert (=> b!1154576 (= lt!517770 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25218))))

(assert (=> b!1154576 false))

(declare-fun bm!54645 () Bool)

(declare-fun call!54644 () Unit!38007)

(assert (=> bm!54645 (= call!54644 call!54645)))

(declare-fun b!1154577 () Bool)

(assert (=> b!1154577 (= c!114687 (and (not lt!517759) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1154577 (= e!656625 e!656636)))

(declare-fun b!1154578 () Bool)

(assert (=> b!1154578 (= e!656633 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154579 () Bool)

(declare-fun res!767231 () Bool)

(assert (=> b!1154579 (=> (not res!767231) (not e!656622))))

(assert (=> b!1154579 (= res!767231 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25218))))

(declare-fun b!1154580 () Bool)

(assert (=> b!1154580 (= e!656622 e!656628)))

(declare-fun res!767235 () Bool)

(assert (=> b!1154580 (=> (not res!767235) (not e!656628))))

(assert (=> b!1154580 (= res!767235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517778 mask!1564))))

(assert (=> b!1154580 (= lt!517778 (array!74760 (store (arr!36030 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36566 _keys!1208)))))

(declare-fun b!1154581 () Bool)

(declare-fun e!656632 () Bool)

(assert (=> b!1154581 (= e!656632 (and e!656629 mapRes!45257))))

(declare-fun condMapEmpty!45257 () Bool)

(declare-fun mapDefault!45257 () ValueCell!13768)

