; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98544 () Bool)

(assert start!98544)

(declare-fun b_free!24149 () Bool)

(declare-fun b_next!24149 () Bool)

(assert (=> start!98544 (= b_free!24149 (not b_next!24149))))

(declare-fun tp!85157 () Bool)

(declare-fun b_and!39147 () Bool)

(assert (=> start!98544 (= tp!85157 b_and!39147)))

(declare-fun b!1141939 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!508886 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!649669 () Bool)

(assert (=> b!1141939 (= e!649669 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508886) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141940 () Bool)

(declare-fun call!51332 () Bool)

(assert (=> b!1141940 call!51332))

(declare-datatypes ((Unit!37456 0))(
  ( (Unit!37457) )
))
(declare-fun lt!508887 () Unit!37456)

(declare-fun call!51334 () Unit!37456)

(assert (=> b!1141940 (= lt!508887 call!51334)))

(declare-fun e!649656 () Unit!37456)

(assert (=> b!1141940 (= e!649656 lt!508887)))

(declare-fun b!1141941 () Bool)

(declare-fun c!112199 () Bool)

(assert (=> b!1141941 (= c!112199 (and (not lt!508886) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649670 () Unit!37456)

(declare-fun e!649668 () Unit!37456)

(assert (=> b!1141941 (= e!649670 e!649668)))

(declare-fun b!1141942 () Bool)

(declare-fun e!649662 () Unit!37456)

(declare-fun Unit!37458 () Unit!37456)

(assert (=> b!1141942 (= e!649662 Unit!37458)))

(assert (=> b!1141942 (= lt!508886 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112202 () Bool)

(assert (=> b!1141942 (= c!112202 (and (not lt!508886) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508902 () Unit!37456)

(assert (=> b!1141942 (= lt!508902 e!649670)))

(declare-datatypes ((V!43365 0))(
  ( (V!43366 (val!14396 Int)) )
))
(declare-fun zeroValue!944 () V!43365)

(declare-datatypes ((array!74211 0))(
  ( (array!74212 (arr!35756 (Array (_ BitVec 32) (_ BitVec 64))) (size!36292 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74211)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13630 0))(
  ( (ValueCellFull!13630 (v!17033 V!43365)) (EmptyCell!13630) )
))
(declare-datatypes ((array!74213 0))(
  ( (array!74214 (arr!35757 (Array (_ BitVec 32) ValueCell!13630)) (size!36293 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74213)

(declare-fun minValue!944 () V!43365)

(declare-fun lt!508896 () Unit!37456)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!390 (array!74211 array!74213 (_ BitVec 32) (_ BitVec 32) V!43365 V!43365 (_ BitVec 64) (_ BitVec 32) Int) Unit!37456)

(assert (=> b!1141942 (= lt!508896 (lemmaListMapContainsThenArrayContainsFrom!390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112203 () Bool)

(assert (=> b!1141942 (= c!112203 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761105 () Bool)

(assert (=> b!1141942 (= res!761105 e!649669)))

(declare-fun e!649660 () Bool)

(assert (=> b!1141942 (=> (not res!761105) (not e!649660))))

(assert (=> b!1141942 e!649660))

(declare-fun lt!508898 () Unit!37456)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74211 (_ BitVec 32) (_ BitVec 32)) Unit!37456)

(assert (=> b!1141942 (= lt!508898 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24967 0))(
  ( (Nil!24964) (Cons!24963 (h!26172 (_ BitVec 64)) (t!36108 List!24967)) )
))
(declare-fun arrayNoDuplicates!0 (array!74211 (_ BitVec 32) List!24967) Bool)

(assert (=> b!1141942 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24964)))

(declare-fun lt!508890 () Unit!37456)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74211 (_ BitVec 64) (_ BitVec 32) List!24967) Unit!37456)

(assert (=> b!1141942 (= lt!508890 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24964))))

(assert (=> b!1141942 false))

(declare-datatypes ((tuple2!18212 0))(
  ( (tuple2!18213 (_1!9117 (_ BitVec 64)) (_2!9117 V!43365)) )
))
(declare-datatypes ((List!24968 0))(
  ( (Nil!24965) (Cons!24964 (h!26173 tuple2!18212) (t!36109 List!24968)) )
))
(declare-datatypes ((ListLongMap!16181 0))(
  ( (ListLongMap!16182 (toList!8106 List!24968)) )
))
(declare-fun call!51335 () ListLongMap!16181)

(declare-fun bm!51327 () Bool)

(declare-fun lt!508888 () ListLongMap!16181)

(declare-fun call!51336 () Bool)

(declare-fun contains!6641 (ListLongMap!16181 (_ BitVec 64)) Bool)

(assert (=> bm!51327 (= call!51336 (contains!6641 (ite c!112202 lt!508888 call!51335) k!934))))

(declare-fun b!1141943 () Bool)

(declare-fun arrayContainsKey!0 (array!74211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141943 (= e!649660 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141944 () Bool)

(declare-fun Unit!37459 () Unit!37456)

(assert (=> b!1141944 (= e!649662 Unit!37459)))

(declare-fun bm!51328 () Bool)

(assert (=> bm!51328 (= call!51332 call!51336)))

(declare-fun b!1141945 () Bool)

(declare-fun call!51331 () ListLongMap!16181)

(assert (=> b!1141945 (contains!6641 call!51331 k!934)))

(declare-fun lt!508900 () Unit!37456)

(declare-fun addStillContains!794 (ListLongMap!16181 (_ BitVec 64) V!43365 (_ BitVec 64)) Unit!37456)

(assert (=> b!1141945 (= lt!508900 (addStillContains!794 lt!508888 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1141945 call!51336))

(declare-fun lt!508895 () ListLongMap!16181)

(declare-fun +!3537 (ListLongMap!16181 tuple2!18212) ListLongMap!16181)

(assert (=> b!1141945 (= lt!508888 (+!3537 lt!508895 (tuple2!18213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508897 () Unit!37456)

(declare-fun call!51330 () Unit!37456)

(assert (=> b!1141945 (= lt!508897 call!51330)))

(assert (=> b!1141945 (= e!649670 lt!508900)))

(declare-fun b!1141946 () Bool)

(declare-fun Unit!37460 () Unit!37456)

(assert (=> b!1141946 (= e!649656 Unit!37460)))

(declare-fun bm!51329 () Bool)

(assert (=> bm!51329 (= call!51331 (+!3537 (ite c!112202 lt!508888 lt!508895) (ite c!112202 (tuple2!18213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112199 (tuple2!18213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1141947 () Bool)

(declare-fun res!761093 () Bool)

(declare-fun e!649663 () Bool)

(assert (=> b!1141947 (=> (not res!761093) (not e!649663))))

(assert (=> b!1141947 (= res!761093 (and (= (size!36293 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36292 _keys!1208) (size!36293 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141948 () Bool)

(declare-fun res!761094 () Bool)

(assert (=> b!1141948 (=> (not res!761094) (not e!649663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141948 (= res!761094 (validKeyInArray!0 k!934))))

(declare-fun bm!51330 () Bool)

(assert (=> bm!51330 (= call!51330 (addStillContains!794 lt!508895 (ite (or c!112202 c!112199) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112202 c!112199) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1141949 () Bool)

(assert (=> b!1141949 (= e!649668 e!649656)))

(declare-fun c!112204 () Bool)

(assert (=> b!1141949 (= c!112204 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508886))))

(declare-fun b!1141950 () Bool)

(declare-fun res!761097 () Bool)

(declare-fun e!649664 () Bool)

(assert (=> b!1141950 (=> (not res!761097) (not e!649664))))

(declare-fun lt!508891 () array!74211)

(assert (=> b!1141950 (= res!761097 (arrayNoDuplicates!0 lt!508891 #b00000000000000000000000000000000 Nil!24964))))

(declare-fun res!761096 () Bool)

(assert (=> start!98544 (=> (not res!761096) (not e!649663))))

(assert (=> start!98544 (= res!761096 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36292 _keys!1208))))))

(assert (=> start!98544 e!649663))

(declare-fun tp_is_empty!28679 () Bool)

(assert (=> start!98544 tp_is_empty!28679))

(declare-fun array_inv!27406 (array!74211) Bool)

(assert (=> start!98544 (array_inv!27406 _keys!1208)))

(assert (=> start!98544 true))

(assert (=> start!98544 tp!85157))

(declare-fun e!649657 () Bool)

(declare-fun array_inv!27407 (array!74213) Bool)

(assert (=> start!98544 (and (array_inv!27407 _values!996) e!649657)))

(declare-fun b!1141951 () Bool)

(declare-fun e!649667 () Bool)

(assert (=> b!1141951 (= e!649667 true)))

(declare-fun lt!508904 () V!43365)

(declare-fun -!1256 (ListLongMap!16181 (_ BitVec 64)) ListLongMap!16181)

(assert (=> b!1141951 (= (-!1256 (+!3537 lt!508895 (tuple2!18213 (select (arr!35756 _keys!1208) from!1455) lt!508904)) (select (arr!35756 _keys!1208) from!1455)) lt!508895)))

(declare-fun lt!508893 () Unit!37456)

(declare-fun addThenRemoveForNewKeyIsSame!109 (ListLongMap!16181 (_ BitVec 64) V!43365) Unit!37456)

(assert (=> b!1141951 (= lt!508893 (addThenRemoveForNewKeyIsSame!109 lt!508895 (select (arr!35756 _keys!1208) from!1455) lt!508904))))

(declare-fun lt!508899 () V!43365)

(declare-fun get!18171 (ValueCell!13630 V!43365) V!43365)

(assert (=> b!1141951 (= lt!508904 (get!18171 (select (arr!35757 _values!996) from!1455) lt!508899))))

(declare-fun lt!508905 () Unit!37456)

(assert (=> b!1141951 (= lt!508905 e!649662)))

(declare-fun c!112201 () Bool)

(assert (=> b!1141951 (= c!112201 (contains!6641 lt!508895 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4588 (array!74211 array!74213 (_ BitVec 32) (_ BitVec 32) V!43365 V!43365 (_ BitVec 32) Int) ListLongMap!16181)

(assert (=> b!1141951 (= lt!508895 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141952 () Bool)

(declare-fun e!649665 () Bool)

(assert (=> b!1141952 (= e!649665 e!649667)))

(declare-fun res!761099 () Bool)

(assert (=> b!1141952 (=> res!761099 e!649667)))

(assert (=> b!1141952 (= res!761099 (not (= (select (arr!35756 _keys!1208) from!1455) k!934)))))

(declare-fun e!649659 () Bool)

(assert (=> b!1141952 e!649659))

(declare-fun c!112200 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141952 (= c!112200 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508892 () Unit!37456)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!500 (array!74211 array!74213 (_ BitVec 32) (_ BitVec 32) V!43365 V!43365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37456)

(assert (=> b!1141952 (= lt!508892 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141953 () Bool)

(declare-fun e!649661 () Bool)

(assert (=> b!1141953 (= e!649664 (not e!649661))))

(declare-fun res!761098 () Bool)

(assert (=> b!1141953 (=> res!761098 e!649661)))

(assert (=> b!1141953 (= res!761098 (bvsgt from!1455 i!673))))

(assert (=> b!1141953 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!508903 () Unit!37456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74211 (_ BitVec 64) (_ BitVec 32)) Unit!37456)

(assert (=> b!1141953 (= lt!508903 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1141954 () Bool)

(declare-fun res!761092 () Bool)

(assert (=> b!1141954 (=> (not res!761092) (not e!649663))))

(assert (=> b!1141954 (= res!761092 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24964))))

(declare-fun call!51337 () ListLongMap!16181)

(declare-fun bm!51331 () Bool)

(declare-fun lt!508885 () array!74213)

(assert (=> bm!51331 (= call!51337 (getCurrentListMapNoExtraKeys!4588 lt!508891 lt!508885 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141955 () Bool)

(declare-fun res!761102 () Bool)

(assert (=> b!1141955 (=> (not res!761102) (not e!649663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141955 (= res!761102 (validMask!0 mask!1564))))

(declare-fun b!1141956 () Bool)

(assert (=> b!1141956 (= e!649663 e!649664)))

(declare-fun res!761103 () Bool)

(assert (=> b!1141956 (=> (not res!761103) (not e!649664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74211 (_ BitVec 32)) Bool)

(assert (=> b!1141956 (= res!761103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508891 mask!1564))))

(assert (=> b!1141956 (= lt!508891 (array!74212 (store (arr!35756 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36292 _keys!1208)))))

(declare-fun bm!51332 () Bool)

(declare-fun call!51333 () ListLongMap!16181)

(assert (=> bm!51332 (= call!51333 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141957 () Bool)

(declare-fun e!649658 () Bool)

(assert (=> b!1141957 (= e!649658 tp_is_empty!28679)))

(declare-fun mapNonEmpty!44843 () Bool)

(declare-fun mapRes!44843 () Bool)

(declare-fun tp!85158 () Bool)

(declare-fun e!649671 () Bool)

(assert (=> mapNonEmpty!44843 (= mapRes!44843 (and tp!85158 e!649671))))

(declare-fun mapRest!44843 () (Array (_ BitVec 32) ValueCell!13630))

(declare-fun mapKey!44843 () (_ BitVec 32))

(declare-fun mapValue!44843 () ValueCell!13630)

(assert (=> mapNonEmpty!44843 (= (arr!35757 _values!996) (store mapRest!44843 mapKey!44843 mapValue!44843))))

(declare-fun b!1141958 () Bool)

(declare-fun res!761104 () Bool)

(assert (=> b!1141958 (=> (not res!761104) (not e!649663))))

(assert (=> b!1141958 (= res!761104 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36292 _keys!1208))))))

(declare-fun b!1141959 () Bool)

(assert (=> b!1141959 (= e!649657 (and e!649658 mapRes!44843))))

(declare-fun condMapEmpty!44843 () Bool)

(declare-fun mapDefault!44843 () ValueCell!13630)

