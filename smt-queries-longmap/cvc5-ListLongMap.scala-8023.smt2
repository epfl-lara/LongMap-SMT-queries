; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98978 () Bool)

(assert start!98978)

(declare-fun b_free!24583 () Bool)

(declare-fun b_next!24583 () Bool)

(assert (=> start!98978 (= b_free!24583 (not b_next!24583))))

(declare-fun tp!86459 () Bool)

(declare-fun b_and!40015 () Bool)

(assert (=> start!98978 (= tp!86459 b_and!40015)))

(declare-fun e!660657 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1161830 () Bool)

(declare-datatypes ((V!43945 0))(
  ( (V!43946 (val!14613 Int)) )
))
(declare-datatypes ((tuple2!18622 0))(
  ( (tuple2!18623 (_1!9322 (_ BitVec 64)) (_2!9322 V!43945)) )
))
(declare-datatypes ((List!25357 0))(
  ( (Nil!25354) (Cons!25353 (h!26562 tuple2!18622) (t!36932 List!25357)) )
))
(declare-datatypes ((ListLongMap!16591 0))(
  ( (ListLongMap!16592 (toList!8311 List!25357)) )
))
(declare-fun call!56540 () ListLongMap!16591)

(declare-fun call!56543 () ListLongMap!16591)

(declare-fun -!1417 (ListLongMap!16591 (_ BitVec 64)) ListLongMap!16591)

(assert (=> b!1161830 (= e!660657 (= call!56540 (-!1417 call!56543 k!934)))))

(declare-fun b!1161831 () Bool)

(declare-fun e!660651 () Bool)

(assert (=> b!1161831 (= e!660651 true)))

(declare-fun e!660662 () Bool)

(assert (=> b!1161831 e!660662))

(declare-fun res!770787 () Bool)

(assert (=> b!1161831 (=> (not res!770787) (not e!660662))))

(declare-fun lt!522979 () ListLongMap!16591)

(declare-fun lt!522980 () ListLongMap!16591)

(assert (=> b!1161831 (= res!770787 (= lt!522979 lt!522980))))

(declare-fun lt!522988 () ListLongMap!16591)

(assert (=> b!1161831 (= lt!522979 (-!1417 lt!522988 k!934))))

(declare-datatypes ((array!75065 0))(
  ( (array!75066 (arr!36183 (Array (_ BitVec 32) (_ BitVec 64))) (size!36719 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75065)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!522985 () V!43945)

(declare-fun +!3715 (ListLongMap!16591 tuple2!18622) ListLongMap!16591)

(assert (=> b!1161831 (= (-!1417 (+!3715 lt!522980 (tuple2!18623 (select (arr!36183 _keys!1208) from!1455) lt!522985)) (select (arr!36183 _keys!1208) from!1455)) lt!522980)))

(declare-datatypes ((Unit!38321 0))(
  ( (Unit!38322) )
))
(declare-fun lt!522987 () Unit!38321)

(declare-fun addThenRemoveForNewKeyIsSame!251 (ListLongMap!16591 (_ BitVec 64) V!43945) Unit!38321)

(assert (=> b!1161831 (= lt!522987 (addThenRemoveForNewKeyIsSame!251 lt!522980 (select (arr!36183 _keys!1208) from!1455) lt!522985))))

(declare-fun lt!522978 () V!43945)

(declare-datatypes ((ValueCell!13847 0))(
  ( (ValueCellFull!13847 (v!17250 V!43945)) (EmptyCell!13847) )
))
(declare-datatypes ((array!75067 0))(
  ( (array!75068 (arr!36184 (Array (_ BitVec 32) ValueCell!13847)) (size!36720 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75067)

(declare-fun get!18459 (ValueCell!13847 V!43945) V!43945)

(assert (=> b!1161831 (= lt!522985 (get!18459 (select (arr!36184 _values!996) from!1455) lt!522978))))

(declare-fun lt!522982 () Unit!38321)

(declare-fun e!660655 () Unit!38321)

(assert (=> b!1161831 (= lt!522982 e!660655)))

(declare-fun c!116106 () Bool)

(declare-fun contains!6816 (ListLongMap!16591 (_ BitVec 64)) Bool)

(assert (=> b!1161831 (= c!116106 (contains!6816 lt!522980 k!934))))

(declare-fun zeroValue!944 () V!43945)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43945)

(declare-fun getCurrentListMapNoExtraKeys!4775 (array!75065 array!75067 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 32) Int) ListLongMap!16591)

(assert (=> b!1161831 (= lt!522980 (getCurrentListMapNoExtraKeys!4775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161832 () Bool)

(declare-fun res!770794 () Bool)

(declare-fun e!660663 () Bool)

(assert (=> b!1161832 (=> (not res!770794) (not e!660663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161832 (= res!770794 (validMask!0 mask!1564))))

(declare-fun b!1161833 () Bool)

(declare-fun e!660654 () Bool)

(declare-fun e!660653 () Bool)

(assert (=> b!1161833 (= e!660654 e!660653)))

(declare-fun res!770793 () Bool)

(assert (=> b!1161833 (=> res!770793 e!660653)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161833 (= res!770793 (not (= from!1455 i!673)))))

(declare-fun lt!522983 () ListLongMap!16591)

(declare-fun lt!522973 () array!75065)

(declare-fun lt!522990 () array!75067)

(assert (=> b!1161833 (= lt!522983 (getCurrentListMapNoExtraKeys!4775 lt!522973 lt!522990 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1161833 (= lt!522990 (array!75068 (store (arr!36184 _values!996) i!673 (ValueCellFull!13847 lt!522978)) (size!36720 _values!996)))))

(declare-fun dynLambda!2771 (Int (_ BitVec 64)) V!43945)

(assert (=> b!1161833 (= lt!522978 (dynLambda!2771 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1161833 (= lt!522988 (getCurrentListMapNoExtraKeys!4775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!56539 () ListLongMap!16591)

(declare-fun call!56541 () Bool)

(declare-fun lt!522975 () ListLongMap!16591)

(declare-fun bm!56535 () Bool)

(declare-fun c!116109 () Bool)

(assert (=> bm!56535 (= call!56541 (contains!6816 (ite c!116109 lt!522975 call!56539) k!934))))

(declare-fun b!1161834 () Bool)

(assert (=> b!1161834 (= e!660662 (= lt!522979 (getCurrentListMapNoExtraKeys!4775 lt!522973 lt!522990 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun res!770789 () Bool)

(assert (=> start!98978 (=> (not res!770789) (not e!660663))))

(assert (=> start!98978 (= res!770789 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36719 _keys!1208))))))

(assert (=> start!98978 e!660663))

(declare-fun tp_is_empty!29113 () Bool)

(assert (=> start!98978 tp_is_empty!29113))

(declare-fun array_inv!27686 (array!75065) Bool)

(assert (=> start!98978 (array_inv!27686 _keys!1208)))

(assert (=> start!98978 true))

(assert (=> start!98978 tp!86459))

(declare-fun e!660652 () Bool)

(declare-fun array_inv!27687 (array!75067) Bool)

(assert (=> start!98978 (and (array_inv!27687 _values!996) e!660652)))

(declare-fun b!1161835 () Bool)

(declare-fun e!660658 () Unit!38321)

(declare-fun Unit!38323 () Unit!38321)

(assert (=> b!1161835 (= e!660658 Unit!38323)))

(declare-fun b!1161836 () Bool)

(declare-fun call!56542 () Bool)

(assert (=> b!1161836 call!56542))

(declare-fun lt!522981 () Unit!38321)

(declare-fun call!56538 () Unit!38321)

(assert (=> b!1161836 (= lt!522981 call!56538)))

(assert (=> b!1161836 (= e!660658 lt!522981)))

(declare-fun b!1161837 () Bool)

(declare-fun e!660661 () Bool)

(assert (=> b!1161837 (= e!660663 e!660661)))

(declare-fun res!770795 () Bool)

(assert (=> b!1161837 (=> (not res!770795) (not e!660661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75065 (_ BitVec 32)) Bool)

(assert (=> b!1161837 (= res!770795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522973 mask!1564))))

(assert (=> b!1161837 (= lt!522973 (array!75066 (store (arr!36183 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36719 _keys!1208)))))

(declare-fun b!1161838 () Bool)

(assert (=> b!1161838 (= e!660653 e!660651)))

(declare-fun res!770797 () Bool)

(assert (=> b!1161838 (=> res!770797 e!660651)))

(assert (=> b!1161838 (= res!770797 (not (= (select (arr!36183 _keys!1208) from!1455) k!934)))))

(assert (=> b!1161838 e!660657))

(declare-fun c!116108 () Bool)

(assert (=> b!1161838 (= c!116108 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522974 () Unit!38321)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!647 (array!75065 array!75067 (_ BitVec 32) (_ BitVec 32) V!43945 V!43945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38321)

(assert (=> b!1161838 (= lt!522974 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!647 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161839 () Bool)

(declare-fun res!770786 () Bool)

(assert (=> b!1161839 (=> (not res!770786) (not e!660663))))

(assert (=> b!1161839 (= res!770786 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36719 _keys!1208))))))

(declare-fun b!1161840 () Bool)

(declare-fun e!660666 () Bool)

(declare-fun arrayContainsKey!0 (array!75065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161840 (= e!660666 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56536 () Bool)

(declare-fun call!56544 () Unit!38321)

(assert (=> bm!56536 (= call!56538 call!56544)))

(declare-fun b!1161841 () Bool)

(declare-fun e!660660 () Bool)

(declare-fun mapRes!45494 () Bool)

(assert (=> b!1161841 (= e!660652 (and e!660660 mapRes!45494))))

(declare-fun condMapEmpty!45494 () Bool)

(declare-fun mapDefault!45494 () ValueCell!13847)

