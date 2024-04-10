; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98888 () Bool)

(assert start!98888)

(declare-fun b_free!24493 () Bool)

(declare-fun b_next!24493 () Bool)

(assert (=> start!98888 (= b_free!24493 (not b_next!24493))))

(declare-fun tp!86190 () Bool)

(declare-fun b_and!39835 () Bool)

(assert (=> start!98888 (= tp!86190 b_and!39835)))

(declare-fun bm!55455 () Bool)

(declare-fun call!55465 () Bool)

(declare-fun call!55464 () Bool)

(assert (=> bm!55455 (= call!55465 call!55464)))

(declare-fun res!768768 () Bool)

(declare-fun e!658355 () Bool)

(assert (=> start!98888 (=> (not res!768768) (not e!658355))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74889 0))(
  ( (array!74890 (arr!36095 (Array (_ BitVec 32) (_ BitVec 64))) (size!36631 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74889)

(assert (=> start!98888 (= res!768768 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36631 _keys!1208))))))

(assert (=> start!98888 e!658355))

(declare-fun tp_is_empty!29023 () Bool)

(assert (=> start!98888 tp_is_empty!29023))

(declare-fun array_inv!27624 (array!74889) Bool)

(assert (=> start!98888 (array_inv!27624 _keys!1208)))

(assert (=> start!98888 true))

(assert (=> start!98888 tp!86190))

(declare-datatypes ((V!43825 0))(
  ( (V!43826 (val!14568 Int)) )
))
(declare-datatypes ((ValueCell!13802 0))(
  ( (ValueCellFull!13802 (v!17205 V!43825)) (EmptyCell!13802) )
))
(declare-datatypes ((array!74891 0))(
  ( (array!74892 (arr!36096 (Array (_ BitVec 32) ValueCell!13802)) (size!36632 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74891)

(declare-fun e!658356 () Bool)

(declare-fun array_inv!27625 (array!74891) Bool)

(assert (=> start!98888 (and (array_inv!27625 _values!996) e!658356)))

(declare-fun zeroValue!944 () V!43825)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!55456 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43825)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18538 0))(
  ( (tuple2!18539 (_1!9280 (_ BitVec 64)) (_2!9280 V!43825)) )
))
(declare-datatypes ((List!25279 0))(
  ( (Nil!25276) (Cons!25275 (h!26484 tuple2!18538) (t!36764 List!25279)) )
))
(declare-datatypes ((ListLongMap!16507 0))(
  ( (ListLongMap!16508 (toList!8269 List!25279)) )
))
(declare-fun call!55461 () ListLongMap!16507)

(declare-fun getCurrentListMapNoExtraKeys!4736 (array!74889 array!74891 (_ BitVec 32) (_ BitVec 32) V!43825 V!43825 (_ BitVec 32) Int) ListLongMap!16507)

(assert (=> bm!55456 (= call!55461 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157690 () Bool)

(declare-datatypes ((Unit!38142 0))(
  ( (Unit!38143) )
))
(declare-fun e!658366 () Unit!38142)

(declare-fun e!658357 () Unit!38142)

(assert (=> b!1157690 (= e!658366 e!658357)))

(declare-fun c!115299 () Bool)

(declare-fun lt!520014 () Bool)

(assert (=> b!1157690 (= c!115299 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520014))))

(declare-fun b!1157691 () Bool)

(declare-fun e!658360 () Bool)

(declare-fun e!658367 () Bool)

(assert (=> b!1157691 (= e!658360 (not e!658367))))

(declare-fun res!768760 () Bool)

(assert (=> b!1157691 (=> res!768760 e!658367)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157691 (= res!768760 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157691 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!520009 () Unit!38142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74889 (_ BitVec 64) (_ BitVec 32)) Unit!38142)

(assert (=> b!1157691 (= lt!520009 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1157692 () Bool)

(declare-fun lt!520021 () ListLongMap!16507)

(declare-fun contains!6780 (ListLongMap!16507 (_ BitVec 64)) Bool)

(declare-fun +!3680 (ListLongMap!16507 tuple2!18538) ListLongMap!16507)

(assert (=> b!1157692 (contains!6780 (+!3680 lt!520021 (tuple2!18539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!520008 () Unit!38142)

(declare-fun addStillContains!922 (ListLongMap!16507 (_ BitVec 64) V!43825 (_ BitVec 64)) Unit!38142)

(assert (=> b!1157692 (= lt!520008 (addStillContains!922 lt!520021 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1157692 call!55464))

(declare-fun call!55458 () ListLongMap!16507)

(assert (=> b!1157692 (= lt!520021 call!55458)))

(declare-fun lt!520020 () Unit!38142)

(declare-fun call!55460 () Unit!38142)

(assert (=> b!1157692 (= lt!520020 call!55460)))

(declare-fun e!658369 () Unit!38142)

(assert (=> b!1157692 (= e!658369 lt!520008)))

(declare-fun b!1157693 () Bool)

(declare-fun e!658361 () Bool)

(assert (=> b!1157693 (= e!658361 tp_is_empty!29023)))

(declare-fun mapIsEmpty!45359 () Bool)

(declare-fun mapRes!45359 () Bool)

(assert (=> mapIsEmpty!45359 mapRes!45359))

(declare-fun b!1157694 () Bool)

(assert (=> b!1157694 call!55465))

(declare-fun lt!520013 () Unit!38142)

(declare-fun call!55462 () Unit!38142)

(assert (=> b!1157694 (= lt!520013 call!55462)))

(assert (=> b!1157694 (= e!658357 lt!520013)))

(declare-fun call!55459 () ListLongMap!16507)

(declare-fun lt!520006 () array!74891)

(declare-fun lt!520015 () array!74889)

(declare-fun bm!55457 () Bool)

(assert (=> bm!55457 (= call!55459 (getCurrentListMapNoExtraKeys!4736 lt!520015 lt!520006 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157695 () Bool)

(declare-fun lt!520018 () Unit!38142)

(assert (=> b!1157695 (= e!658366 lt!520018)))

(assert (=> b!1157695 (= lt!520018 call!55462)))

(assert (=> b!1157695 call!55465))

(declare-fun e!658364 () Bool)

(declare-fun b!1157696 () Bool)

(assert (=> b!1157696 (= e!658364 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520014) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157697 () Bool)

(declare-fun e!658368 () Bool)

(assert (=> b!1157697 (= e!658367 e!658368)))

(declare-fun res!768763 () Bool)

(assert (=> b!1157697 (=> res!768763 e!658368)))

(assert (=> b!1157697 (= res!768763 (not (= from!1455 i!673)))))

(declare-fun lt!520016 () ListLongMap!16507)

(assert (=> b!1157697 (= lt!520016 (getCurrentListMapNoExtraKeys!4736 lt!520015 lt!520006 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520005 () V!43825)

(assert (=> b!1157697 (= lt!520006 (array!74892 (store (arr!36096 _values!996) i!673 (ValueCellFull!13802 lt!520005)) (size!36632 _values!996)))))

(declare-fun dynLambda!2742 (Int (_ BitVec 64)) V!43825)

(assert (=> b!1157697 (= lt!520005 (dynLambda!2742 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520004 () ListLongMap!16507)

(assert (=> b!1157697 (= lt!520004 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157698 () Bool)

(declare-fun res!768767 () Bool)

(assert (=> b!1157698 (=> (not res!768767) (not e!658355))))

(assert (=> b!1157698 (= res!768767 (= (select (arr!36095 _keys!1208) i!673) k!934))))

(declare-fun b!1157699 () Bool)

(declare-fun e!658370 () Bool)

(assert (=> b!1157699 (= e!658370 true)))

(declare-fun e!658371 () Bool)

(assert (=> b!1157699 e!658371))

(declare-fun res!768772 () Bool)

(assert (=> b!1157699 (=> (not res!768772) (not e!658371))))

(declare-fun lt!520019 () ListLongMap!16507)

(declare-fun lt!520023 () ListLongMap!16507)

(assert (=> b!1157699 (= res!768772 (= lt!520019 lt!520023))))

(declare-fun -!1383 (ListLongMap!16507 (_ BitVec 64)) ListLongMap!16507)

(assert (=> b!1157699 (= lt!520019 (-!1383 lt!520004 k!934))))

(declare-fun lt!520007 () V!43825)

(assert (=> b!1157699 (= (-!1383 (+!3680 lt!520023 (tuple2!18539 (select (arr!36095 _keys!1208) from!1455) lt!520007)) (select (arr!36095 _keys!1208) from!1455)) lt!520023)))

(declare-fun lt!520012 () Unit!38142)

(declare-fun addThenRemoveForNewKeyIsSame!222 (ListLongMap!16507 (_ BitVec 64) V!43825) Unit!38142)

(assert (=> b!1157699 (= lt!520012 (addThenRemoveForNewKeyIsSame!222 lt!520023 (select (arr!36095 _keys!1208) from!1455) lt!520007))))

(declare-fun get!18400 (ValueCell!13802 V!43825) V!43825)

(assert (=> b!1157699 (= lt!520007 (get!18400 (select (arr!36096 _values!996) from!1455) lt!520005))))

(declare-fun lt!520011 () Unit!38142)

(declare-fun e!658365 () Unit!38142)

(assert (=> b!1157699 (= lt!520011 e!658365)))

(declare-fun c!115300 () Bool)

(assert (=> b!1157699 (= c!115300 (contains!6780 lt!520023 k!934))))

(assert (=> b!1157699 (= lt!520023 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157700 () Bool)

(declare-fun e!658363 () Bool)

(assert (=> b!1157700 (= e!658356 (and e!658363 mapRes!45359))))

(declare-fun condMapEmpty!45359 () Bool)

(declare-fun mapDefault!45359 () ValueCell!13802)

