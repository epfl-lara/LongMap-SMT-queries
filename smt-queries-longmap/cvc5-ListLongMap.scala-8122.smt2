; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99598 () Bool)

(assert start!99598)

(declare-fun b_free!25177 () Bool)

(declare-fun b_next!25177 () Bool)

(assert (=> start!99598 (= b_free!25177 (not b_next!25177))))

(declare-fun tp!88244 () Bool)

(declare-fun b_and!41221 () Bool)

(assert (=> start!99598 (= tp!88244 b_and!41221)))

(declare-fun mapNonEmpty!46388 () Bool)

(declare-fun mapRes!46388 () Bool)

(declare-fun tp!88245 () Bool)

(declare-fun e!670631 () Bool)

(assert (=> mapNonEmpty!46388 (= mapRes!46388 (and tp!88245 e!670631))))

(declare-datatypes ((V!44737 0))(
  ( (V!44738 (val!14910 Int)) )
))
(declare-datatypes ((ValueCell!14144 0))(
  ( (ValueCellFull!14144 (v!17548 V!44737)) (EmptyCell!14144) )
))
(declare-fun mapValue!46388 () ValueCell!14144)

(declare-fun mapRest!46388 () (Array (_ BitVec 32) ValueCell!14144))

(declare-fun mapKey!46388 () (_ BitVec 32))

(declare-datatypes ((array!76217 0))(
  ( (array!76218 (arr!36758 (Array (_ BitVec 32) ValueCell!14144)) (size!37294 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76217)

(assert (=> mapNonEmpty!46388 (= (arr!36758 _values!996) (store mapRest!46388 mapKey!46388 mapValue!46388))))

(declare-fun b!1179597 () Bool)

(declare-fun tp_is_empty!29707 () Bool)

(assert (=> b!1179597 (= e!670631 tp_is_empty!29707)))

(declare-fun b!1179598 () Bool)

(declare-fun e!670634 () Bool)

(assert (=> b!1179598 (= e!670634 true)))

(declare-fun e!670633 () Bool)

(assert (=> b!1179598 e!670633))

(declare-fun res!783724 () Bool)

(assert (=> b!1179598 (=> (not res!783724) (not e!670633))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76219 0))(
  ( (array!76220 (arr!36759 (Array (_ BitVec 32) (_ BitVec 64))) (size!37295 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76219)

(assert (=> b!1179598 (= res!783724 (not (= (select (arr!36759 _keys!1208) from!1455) k!934)))))

(declare-datatypes ((Unit!38978 0))(
  ( (Unit!38979) )
))
(declare-fun lt!533155 () Unit!38978)

(declare-fun e!670627 () Unit!38978)

(assert (=> b!1179598 (= lt!533155 e!670627)))

(declare-fun c!116889 () Bool)

(assert (=> b!1179598 (= c!116889 (= (select (arr!36759 _keys!1208) from!1455) k!934))))

(declare-fun e!670638 () Bool)

(assert (=> b!1179598 e!670638))

(declare-fun res!783719 () Bool)

(assert (=> b!1179598 (=> (not res!783719) (not e!670638))))

(declare-datatypes ((tuple2!19086 0))(
  ( (tuple2!19087 (_1!9554 (_ BitVec 64)) (_2!9554 V!44737)) )
))
(declare-fun lt!533156 () tuple2!19086)

(declare-datatypes ((List!25824 0))(
  ( (Nil!25821) (Cons!25820 (h!27029 tuple2!19086) (t!37993 List!25824)) )
))
(declare-datatypes ((ListLongMap!17055 0))(
  ( (ListLongMap!17056 (toList!8543 List!25824)) )
))
(declare-fun lt!533163 () ListLongMap!17055)

(declare-fun lt!533152 () ListLongMap!17055)

(declare-fun +!3855 (ListLongMap!17055 tuple2!19086) ListLongMap!17055)

(assert (=> b!1179598 (= res!783719 (= lt!533152 (+!3855 lt!533163 lt!533156)))))

(declare-fun lt!533154 () V!44737)

(declare-fun get!18793 (ValueCell!14144 V!44737) V!44737)

(assert (=> b!1179598 (= lt!533156 (tuple2!19087 (select (arr!36759 _keys!1208) from!1455) (get!18793 (select (arr!36758 _values!996) from!1455) lt!533154)))))

(declare-fun b!1179599 () Bool)

(declare-fun e!670637 () Bool)

(declare-fun e!670632 () Bool)

(assert (=> b!1179599 (= e!670637 (not e!670632))))

(declare-fun res!783718 () Bool)

(assert (=> b!1179599 (=> res!783718 e!670632)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179599 (= res!783718 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179599 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!533149 () Unit!38978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76219 (_ BitVec 64) (_ BitVec 32)) Unit!38978)

(assert (=> b!1179599 (= lt!533149 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179600 () Bool)

(declare-fun e!670628 () Bool)

(assert (=> b!1179600 (= e!670628 e!670634)))

(declare-fun res!783713 () Bool)

(assert (=> b!1179600 (=> res!783713 e!670634)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179600 (= res!783713 (not (validKeyInArray!0 (select (arr!36759 _keys!1208) from!1455))))))

(declare-fun lt!533162 () ListLongMap!17055)

(assert (=> b!1179600 (= lt!533162 lt!533163)))

(declare-fun lt!533150 () ListLongMap!17055)

(declare-fun -!1586 (ListLongMap!17055 (_ BitVec 64)) ListLongMap!17055)

(assert (=> b!1179600 (= lt!533163 (-!1586 lt!533150 k!934))))

(declare-fun zeroValue!944 () V!44737)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!533157 () array!76219)

(declare-fun minValue!944 () V!44737)

(declare-fun lt!533159 () array!76217)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4998 (array!76219 array!76217 (_ BitVec 32) (_ BitVec 32) V!44737 V!44737 (_ BitVec 32) Int) ListLongMap!17055)

(assert (=> b!1179600 (= lt!533162 (getCurrentListMapNoExtraKeys!4998 lt!533157 lt!533159 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179600 (= lt!533150 (getCurrentListMapNoExtraKeys!4998 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533153 () Unit!38978)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!813 (array!76219 array!76217 (_ BitVec 32) (_ BitVec 32) V!44737 V!44737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38978)

(assert (=> b!1179600 (= lt!533153 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179601 () Bool)

(declare-fun e!670636 () Bool)

(assert (=> b!1179601 (= e!670636 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179602 () Bool)

(declare-fun res!783722 () Bool)

(declare-fun e!670639 () Bool)

(assert (=> b!1179602 (=> (not res!783722) (not e!670639))))

(assert (=> b!1179602 (= res!783722 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37295 _keys!1208))))))

(declare-fun b!1179603 () Bool)

(declare-fun res!783720 () Bool)

(assert (=> b!1179603 (=> (not res!783720) (not e!670633))))

(declare-fun lt!533158 () ListLongMap!17055)

(assert (=> b!1179603 (= res!783720 (= lt!533158 (+!3855 lt!533150 lt!533156)))))

(declare-fun b!1179604 () Bool)

(declare-fun Unit!38980 () Unit!38978)

(assert (=> b!1179604 (= e!670627 Unit!38980)))

(declare-fun lt!533151 () Unit!38978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76219 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38978)

(assert (=> b!1179604 (= lt!533151 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179604 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533161 () Unit!38978)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76219 (_ BitVec 32) (_ BitVec 32)) Unit!38978)

(assert (=> b!1179604 (= lt!533161 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25825 0))(
  ( (Nil!25822) (Cons!25821 (h!27030 (_ BitVec 64)) (t!37994 List!25825)) )
))
(declare-fun arrayNoDuplicates!0 (array!76219 (_ BitVec 32) List!25825) Bool)

(assert (=> b!1179604 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25822)))

(declare-fun lt!533160 () Unit!38978)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76219 (_ BitVec 64) (_ BitVec 32) List!25825) Unit!38978)

(assert (=> b!1179604 (= lt!533160 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25822))))

(assert (=> b!1179604 false))

(declare-fun res!783723 () Bool)

(assert (=> start!99598 (=> (not res!783723) (not e!670639))))

(assert (=> start!99598 (= res!783723 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37295 _keys!1208))))))

(assert (=> start!99598 e!670639))

(assert (=> start!99598 tp_is_empty!29707))

(declare-fun array_inv!28066 (array!76219) Bool)

(assert (=> start!99598 (array_inv!28066 _keys!1208)))

(assert (=> start!99598 true))

(assert (=> start!99598 tp!88244))

(declare-fun e!670629 () Bool)

(declare-fun array_inv!28067 (array!76217) Bool)

(assert (=> start!99598 (and (array_inv!28067 _values!996) e!670629)))

(declare-fun b!1179605 () Bool)

(declare-fun res!783708 () Bool)

(assert (=> b!1179605 (=> (not res!783708) (not e!670639))))

(assert (=> b!1179605 (= res!783708 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25822))))

(declare-fun b!1179606 () Bool)

(declare-fun res!783709 () Bool)

(assert (=> b!1179606 (=> (not res!783709) (not e!670639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179606 (= res!783709 (validMask!0 mask!1564))))

(declare-fun b!1179607 () Bool)

(declare-fun e!670630 () Bool)

(assert (=> b!1179607 (= e!670630 tp_is_empty!29707)))

(declare-fun b!1179608 () Bool)

(declare-fun res!783710 () Bool)

(assert (=> b!1179608 (=> (not res!783710) (not e!670639))))

(assert (=> b!1179608 (= res!783710 (= (select (arr!36759 _keys!1208) i!673) k!934))))

(declare-fun b!1179609 () Bool)

(assert (=> b!1179609 (= e!670638 e!670636)))

(declare-fun res!783716 () Bool)

(assert (=> b!1179609 (=> res!783716 e!670636)))

(assert (=> b!1179609 (= res!783716 (not (= (select (arr!36759 _keys!1208) from!1455) k!934)))))

(declare-fun b!1179610 () Bool)

(assert (=> b!1179610 (= e!670639 e!670637)))

(declare-fun res!783711 () Bool)

(assert (=> b!1179610 (=> (not res!783711) (not e!670637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76219 (_ BitVec 32)) Bool)

(assert (=> b!1179610 (= res!783711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533157 mask!1564))))

(assert (=> b!1179610 (= lt!533157 (array!76220 (store (arr!36759 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37295 _keys!1208)))))

(declare-fun b!1179611 () Bool)

(declare-fun res!783714 () Bool)

(assert (=> b!1179611 (=> (not res!783714) (not e!670639))))

(assert (=> b!1179611 (= res!783714 (and (= (size!37294 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37295 _keys!1208) (size!37294 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179612 () Bool)

(declare-fun res!783715 () Bool)

(assert (=> b!1179612 (=> (not res!783715) (not e!670639))))

(assert (=> b!1179612 (= res!783715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179613 () Bool)

(declare-fun Unit!38981 () Unit!38978)

(assert (=> b!1179613 (= e!670627 Unit!38981)))

(declare-fun mapIsEmpty!46388 () Bool)

(assert (=> mapIsEmpty!46388 mapRes!46388))

(declare-fun b!1179614 () Bool)

(assert (=> b!1179614 (= e!670632 e!670628)))

(declare-fun res!783712 () Bool)

(assert (=> b!1179614 (=> res!783712 e!670628)))

(assert (=> b!1179614 (= res!783712 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179614 (= lt!533152 (getCurrentListMapNoExtraKeys!4998 lt!533157 lt!533159 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179614 (= lt!533159 (array!76218 (store (arr!36758 _values!996) i!673 (ValueCellFull!14144 lt!533154)) (size!37294 _values!996)))))

(declare-fun dynLambda!2958 (Int (_ BitVec 64)) V!44737)

(assert (=> b!1179614 (= lt!533154 (dynLambda!2958 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1179614 (= lt!533158 (getCurrentListMapNoExtraKeys!4998 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179615 () Bool)

(declare-fun res!783717 () Bool)

(assert (=> b!1179615 (=> (not res!783717) (not e!670639))))

(assert (=> b!1179615 (= res!783717 (validKeyInArray!0 k!934))))

(declare-fun b!1179616 () Bool)

(assert (=> b!1179616 (= e!670633 (= lt!533163 lt!533162))))

(declare-fun b!1179617 () Bool)

(declare-fun res!783721 () Bool)

(assert (=> b!1179617 (=> (not res!783721) (not e!670637))))

(assert (=> b!1179617 (= res!783721 (arrayNoDuplicates!0 lt!533157 #b00000000000000000000000000000000 Nil!25822))))

(declare-fun b!1179618 () Bool)

(assert (=> b!1179618 (= e!670629 (and e!670630 mapRes!46388))))

(declare-fun condMapEmpty!46388 () Bool)

(declare-fun mapDefault!46388 () ValueCell!14144)

