; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98392 () Bool)

(assert start!98392)

(declare-fun b_free!23997 () Bool)

(declare-fun b_next!23997 () Bool)

(assert (=> start!98392 (= b_free!23997 (not b_next!23997))))

(declare-fun tp!84702 () Bool)

(declare-fun b_and!38843 () Bool)

(assert (=> start!98392 (= tp!84702 b_and!38843)))

(declare-fun b!1135077 () Bool)

(declare-fun e!645975 () Bool)

(declare-fun tp_is_empty!28527 () Bool)

(assert (=> b!1135077 (= e!645975 tp_is_empty!28527)))

(declare-datatypes ((V!43163 0))(
  ( (V!43164 (val!14320 Int)) )
))
(declare-fun zeroValue!944 () V!43163)

(declare-datatypes ((tuple2!18070 0))(
  ( (tuple2!18071 (_1!9046 (_ BitVec 64)) (_2!9046 V!43163)) )
))
(declare-datatypes ((List!24828 0))(
  ( (Nil!24825) (Cons!24824 (h!26033 tuple2!18070) (t!35817 List!24828)) )
))
(declare-datatypes ((ListLongMap!16039 0))(
  ( (ListLongMap!16040 (toList!8035 List!24828)) )
))
(declare-fun call!49506 () ListLongMap!16039)

(declare-datatypes ((array!73915 0))(
  ( (array!73916 (arr!35608 (Array (_ BitVec 32) (_ BitVec 64))) (size!36144 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73915)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!49503 () Bool)

(declare-datatypes ((ValueCell!13554 0))(
  ( (ValueCellFull!13554 (v!16957 V!43163)) (EmptyCell!13554) )
))
(declare-datatypes ((array!73917 0))(
  ( (array!73918 (arr!35609 (Array (_ BitVec 32) ValueCell!13554)) (size!36145 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73917)

(declare-fun minValue!944 () V!43163)

(declare-fun getCurrentListMapNoExtraKeys!4521 (array!73915 array!73917 (_ BitVec 32) (_ BitVec 32) V!43163 V!43163 (_ BitVec 32) Int) ListLongMap!16039)

(assert (=> bm!49503 (= call!49506 (getCurrentListMapNoExtraKeys!4521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49504 () Bool)

(declare-fun call!49509 () ListLongMap!16039)

(declare-fun call!49511 () ListLongMap!16039)

(assert (=> bm!49504 (= call!49509 call!49511)))

(declare-fun b!1135078 () Bool)

(declare-fun e!645966 () Bool)

(declare-fun e!645973 () Bool)

(assert (=> b!1135078 (= e!645966 (not e!645973))))

(declare-fun res!757717 () Bool)

(assert (=> b!1135078 (=> res!757717 e!645973)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135078 (= res!757717 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135078 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37186 0))(
  ( (Unit!37187) )
))
(declare-fun lt!504555 () Unit!37186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73915 (_ BitVec 64) (_ BitVec 32)) Unit!37186)

(assert (=> b!1135078 (= lt!504555 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun lt!504570 () ListLongMap!16039)

(declare-fun call!49513 () Bool)

(declare-fun c!110883 () Bool)

(declare-fun bm!49505 () Bool)

(declare-fun contains!6564 (ListLongMap!16039 (_ BitVec 64)) Bool)

(assert (=> bm!49505 (= call!49513 (contains!6564 (ite c!110883 lt!504570 call!49509) k0!934))))

(declare-fun b!1135079 () Bool)

(declare-fun e!645968 () Bool)

(assert (=> b!1135079 (= e!645968 e!645966)))

(declare-fun res!757718 () Bool)

(assert (=> b!1135079 (=> (not res!757718) (not e!645966))))

(declare-fun lt!504556 () array!73915)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73915 (_ BitVec 32)) Bool)

(assert (=> b!1135079 (= res!757718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504556 mask!1564))))

(assert (=> b!1135079 (= lt!504556 (array!73916 (store (arr!35608 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36144 _keys!1208)))))

(declare-fun e!645974 () Bool)

(declare-fun b!1135080 () Bool)

(assert (=> b!1135080 (= e!645974 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135081 () Bool)

(declare-fun res!757721 () Bool)

(declare-fun e!645970 () Bool)

(assert (=> b!1135081 (=> res!757721 e!645970)))

(declare-datatypes ((List!24829 0))(
  ( (Nil!24826) (Cons!24825 (h!26034 (_ BitVec 64)) (t!35818 List!24829)) )
))
(declare-fun contains!6565 (List!24829 (_ BitVec 64)) Bool)

(assert (=> b!1135081 (= res!757721 (contains!6565 Nil!24826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135082 () Bool)

(assert (=> b!1135082 (= e!645970 true)))

(declare-fun lt!504569 () Bool)

(assert (=> b!1135082 (= lt!504569 (contains!6565 Nil!24826 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135083 () Bool)

(declare-fun e!645961 () Unit!37186)

(declare-fun Unit!37188 () Unit!37186)

(assert (=> b!1135083 (= e!645961 Unit!37188)))

(declare-fun res!757707 () Bool)

(assert (=> start!98392 (=> (not res!757707) (not e!645968))))

(assert (=> start!98392 (= res!757707 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36144 _keys!1208))))))

(assert (=> start!98392 e!645968))

(assert (=> start!98392 tp_is_empty!28527))

(declare-fun array_inv!27308 (array!73915) Bool)

(assert (=> start!98392 (array_inv!27308 _keys!1208)))

(assert (=> start!98392 true))

(assert (=> start!98392 tp!84702))

(declare-fun e!645960 () Bool)

(declare-fun array_inv!27309 (array!73917) Bool)

(assert (=> start!98392 (and (array_inv!27309 _values!996) e!645960)))

(declare-fun b!1135084 () Bool)

(declare-fun e!645965 () Bool)

(assert (=> b!1135084 (= e!645965 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135085 () Bool)

(declare-fun call!49507 () Bool)

(assert (=> b!1135085 call!49507))

(declare-fun lt!504557 () Unit!37186)

(declare-fun call!49510 () Unit!37186)

(assert (=> b!1135085 (= lt!504557 call!49510)))

(declare-fun e!645962 () Unit!37186)

(assert (=> b!1135085 (= e!645962 lt!504557)))

(declare-fun b!1135086 () Bool)

(declare-fun res!757719 () Bool)

(assert (=> b!1135086 (=> (not res!757719) (not e!645968))))

(assert (=> b!1135086 (= res!757719 (and (= (size!36145 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36144 _keys!1208) (size!36145 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1135087 () Bool)

(declare-fun e!645964 () Bool)

(assert (=> b!1135087 (= e!645964 e!645970)))

(declare-fun res!757713 () Bool)

(assert (=> b!1135087 (=> res!757713 e!645970)))

(assert (=> b!1135087 (= res!757713 (or (bvsge (size!36144 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36144 _keys!1208)) (bvsge from!1455 (size!36144 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!73915 (_ BitVec 32) List!24829) Bool)

(assert (=> b!1135087 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24826)))

(declare-fun lt!504562 () Unit!37186)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73915 (_ BitVec 32) (_ BitVec 32)) Unit!37186)

(assert (=> b!1135087 (= lt!504562 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1135087 e!645974))

(declare-fun res!757705 () Bool)

(assert (=> b!1135087 (=> (not res!757705) (not e!645974))))

(assert (=> b!1135087 (= res!757705 e!645965)))

(declare-fun c!110881 () Bool)

(assert (=> b!1135087 (= c!110881 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504558 () Unit!37186)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!341 (array!73915 array!73917 (_ BitVec 32) (_ BitVec 32) V!43163 V!43163 (_ BitVec 64) (_ BitVec 32) Int) Unit!37186)

(assert (=> b!1135087 (= lt!504558 (lemmaListMapContainsThenArrayContainsFrom!341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504559 () Unit!37186)

(declare-fun e!645969 () Unit!37186)

(assert (=> b!1135087 (= lt!504559 e!645969)))

(declare-fun lt!504567 () Bool)

(assert (=> b!1135087 (= c!110883 (and (not lt!504567) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135087 (= lt!504567 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1135088 () Bool)

(declare-fun res!757704 () Bool)

(assert (=> b!1135088 (=> (not res!757704) (not e!645968))))

(assert (=> b!1135088 (= res!757704 (= (select (arr!35608 _keys!1208) i!673) k0!934))))

(declare-fun b!1135089 () Bool)

(declare-fun c!110880 () Bool)

(assert (=> b!1135089 (= c!110880 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504567))))

(assert (=> b!1135089 (= e!645962 e!645961)))

(declare-fun b!1135090 () Bool)

(declare-fun res!757712 () Bool)

(assert (=> b!1135090 (=> (not res!757712) (not e!645968))))

(assert (=> b!1135090 (= res!757712 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36144 _keys!1208))))))

(declare-fun b!1135091 () Bool)

(declare-fun e!645959 () Bool)

(assert (=> b!1135091 (= e!645959 tp_is_empty!28527)))

(declare-fun b!1135092 () Bool)

(declare-fun e!645972 () Bool)

(assert (=> b!1135092 (= e!645972 e!645964)))

(declare-fun res!757709 () Bool)

(assert (=> b!1135092 (=> res!757709 e!645964)))

(declare-fun lt!504563 () ListLongMap!16039)

(assert (=> b!1135092 (= res!757709 (not (contains!6564 lt!504563 k0!934)))))

(assert (=> b!1135092 (= lt!504563 (getCurrentListMapNoExtraKeys!4521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49506 () Bool)

(declare-fun call!49508 () Unit!37186)

(assert (=> bm!49506 (= call!49510 call!49508)))

(declare-fun b!1135093 () Bool)

(declare-fun e!645971 () Bool)

(declare-fun call!49512 () ListLongMap!16039)

(assert (=> b!1135093 (= e!645971 (= call!49512 call!49506))))

(declare-fun c!110884 () Bool)

(declare-fun bm!49507 () Bool)

(declare-fun +!3472 (ListLongMap!16039 tuple2!18070) ListLongMap!16039)

(assert (=> bm!49507 (= call!49511 (+!3472 (ite c!110883 lt!504570 lt!504563) (ite c!110883 (tuple2!18071 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110884 (tuple2!18071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18071 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1135094 () Bool)

(declare-fun mapRes!44615 () Bool)

(assert (=> b!1135094 (= e!645960 (and e!645975 mapRes!44615))))

(declare-fun condMapEmpty!44615 () Bool)

(declare-fun mapDefault!44615 () ValueCell!13554)

(assert (=> b!1135094 (= condMapEmpty!44615 (= (arr!35609 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13554)) mapDefault!44615)))))

(declare-fun bm!49508 () Bool)

(assert (=> bm!49508 (= call!49507 call!49513)))

(declare-fun b!1135095 () Bool)

(declare-fun e!645963 () Bool)

(assert (=> b!1135095 (= e!645973 e!645963)))

(declare-fun res!757708 () Bool)

(assert (=> b!1135095 (=> res!757708 e!645963)))

(assert (=> b!1135095 (= res!757708 (not (= from!1455 i!673)))))

(declare-fun lt!504565 () array!73917)

(declare-fun lt!504561 () ListLongMap!16039)

(assert (=> b!1135095 (= lt!504561 (getCurrentListMapNoExtraKeys!4521 lt!504556 lt!504565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2584 (Int (_ BitVec 64)) V!43163)

(assert (=> b!1135095 (= lt!504565 (array!73918 (store (arr!35609 _values!996) i!673 (ValueCellFull!13554 (dynLambda!2584 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36145 _values!996)))))

(declare-fun lt!504566 () ListLongMap!16039)

(assert (=> b!1135095 (= lt!504566 (getCurrentListMapNoExtraKeys!4521 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1135096 () Bool)

(declare-fun res!757710 () Bool)

(assert (=> b!1135096 (=> (not res!757710) (not e!645968))))

(assert (=> b!1135096 (= res!757710 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24826))))

(declare-fun b!1135097 () Bool)

(declare-fun -!1199 (ListLongMap!16039 (_ BitVec 64)) ListLongMap!16039)

(assert (=> b!1135097 (= e!645971 (= call!49512 (-!1199 call!49506 k0!934)))))

(declare-fun b!1135098 () Bool)

(assert (=> b!1135098 (= e!645965 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504567) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1135099 () Bool)

(declare-fun res!757720 () Bool)

(assert (=> b!1135099 (=> (not res!757720) (not e!645966))))

(assert (=> b!1135099 (= res!757720 (arrayNoDuplicates!0 lt!504556 #b00000000000000000000000000000000 Nil!24826))))

(declare-fun b!1135100 () Bool)

(declare-fun res!757706 () Bool)

(assert (=> b!1135100 (=> (not res!757706) (not e!645968))))

(assert (=> b!1135100 (= res!757706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!49509 () Bool)

(assert (=> bm!49509 (= call!49512 (getCurrentListMapNoExtraKeys!4521 lt!504556 lt!504565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135101 () Bool)

(declare-fun lt!504568 () Unit!37186)

(assert (=> b!1135101 (= e!645969 lt!504568)))

(declare-fun lt!504560 () Unit!37186)

(declare-fun addStillContains!736 (ListLongMap!16039 (_ BitVec 64) V!43163 (_ BitVec 64)) Unit!37186)

(assert (=> b!1135101 (= lt!504560 (addStillContains!736 lt!504563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1135101 (= lt!504570 (+!3472 lt!504563 (tuple2!18071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1135101 call!49513))

(assert (=> b!1135101 (= lt!504568 call!49508)))

(assert (=> b!1135101 (contains!6564 call!49511 k0!934)))

(declare-fun b!1135102 () Bool)

(declare-fun lt!504554 () Unit!37186)

(assert (=> b!1135102 (= e!645961 lt!504554)))

(assert (=> b!1135102 (= lt!504554 call!49510)))

(assert (=> b!1135102 call!49507))

(declare-fun b!1135103 () Bool)

(assert (=> b!1135103 (= e!645969 e!645962)))

(assert (=> b!1135103 (= c!110884 (and (not lt!504567) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1135104 () Bool)

(declare-fun res!757711 () Bool)

(assert (=> b!1135104 (=> (not res!757711) (not e!645968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135104 (= res!757711 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44615 () Bool)

(declare-fun tp!84701 () Bool)

(assert (=> mapNonEmpty!44615 (= mapRes!44615 (and tp!84701 e!645959))))

(declare-fun mapRest!44615 () (Array (_ BitVec 32) ValueCell!13554))

(declare-fun mapValue!44615 () ValueCell!13554)

(declare-fun mapKey!44615 () (_ BitVec 32))

(assert (=> mapNonEmpty!44615 (= (arr!35609 _values!996) (store mapRest!44615 mapKey!44615 mapValue!44615))))

(declare-fun b!1135105 () Bool)

(declare-fun res!757716 () Bool)

(assert (=> b!1135105 (=> res!757716 e!645970)))

(declare-fun noDuplicate!1596 (List!24829) Bool)

(assert (=> b!1135105 (= res!757716 (not (noDuplicate!1596 Nil!24826)))))

(declare-fun mapIsEmpty!44615 () Bool)

(assert (=> mapIsEmpty!44615 mapRes!44615))

(declare-fun b!1135106 () Bool)

(declare-fun res!757714 () Bool)

(assert (=> b!1135106 (=> (not res!757714) (not e!645968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135106 (= res!757714 (validMask!0 mask!1564))))

(declare-fun bm!49510 () Bool)

(assert (=> bm!49510 (= call!49508 (addStillContains!736 (ite c!110883 lt!504570 lt!504563) (ite c!110883 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110884 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110883 minValue!944 (ite c!110884 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1135107 () Bool)

(assert (=> b!1135107 (= e!645963 e!645972)))

(declare-fun res!757715 () Bool)

(assert (=> b!1135107 (=> res!757715 e!645972)))

(assert (=> b!1135107 (= res!757715 (not (= (select (arr!35608 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1135107 e!645971))

(declare-fun c!110882 () Bool)

(assert (=> b!1135107 (= c!110882 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504564 () Unit!37186)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!449 (array!73915 array!73917 (_ BitVec 32) (_ BitVec 32) V!43163 V!43163 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37186)

(assert (=> b!1135107 (= lt!504564 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!449 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98392 res!757707) b!1135106))

(assert (= (and b!1135106 res!757714) b!1135086))

(assert (= (and b!1135086 res!757719) b!1135100))

(assert (= (and b!1135100 res!757706) b!1135096))

(assert (= (and b!1135096 res!757710) b!1135090))

(assert (= (and b!1135090 res!757712) b!1135104))

(assert (= (and b!1135104 res!757711) b!1135088))

(assert (= (and b!1135088 res!757704) b!1135079))

(assert (= (and b!1135079 res!757718) b!1135099))

(assert (= (and b!1135099 res!757720) b!1135078))

(assert (= (and b!1135078 (not res!757717)) b!1135095))

(assert (= (and b!1135095 (not res!757708)) b!1135107))

(assert (= (and b!1135107 c!110882) b!1135097))

(assert (= (and b!1135107 (not c!110882)) b!1135093))

(assert (= (or b!1135097 b!1135093) bm!49509))

(assert (= (or b!1135097 b!1135093) bm!49503))

(assert (= (and b!1135107 (not res!757715)) b!1135092))

(assert (= (and b!1135092 (not res!757709)) b!1135087))

(assert (= (and b!1135087 c!110883) b!1135101))

(assert (= (and b!1135087 (not c!110883)) b!1135103))

(assert (= (and b!1135103 c!110884) b!1135085))

(assert (= (and b!1135103 (not c!110884)) b!1135089))

(assert (= (and b!1135089 c!110880) b!1135102))

(assert (= (and b!1135089 (not c!110880)) b!1135083))

(assert (= (or b!1135085 b!1135102) bm!49506))

(assert (= (or b!1135085 b!1135102) bm!49504))

(assert (= (or b!1135085 b!1135102) bm!49508))

(assert (= (or b!1135101 bm!49508) bm!49505))

(assert (= (or b!1135101 bm!49506) bm!49510))

(assert (= (or b!1135101 bm!49504) bm!49507))

(assert (= (and b!1135087 c!110881) b!1135084))

(assert (= (and b!1135087 (not c!110881)) b!1135098))

(assert (= (and b!1135087 res!757705) b!1135080))

(assert (= (and b!1135087 (not res!757713)) b!1135105))

(assert (= (and b!1135105 (not res!757716)) b!1135081))

(assert (= (and b!1135081 (not res!757721)) b!1135082))

(assert (= (and b!1135094 condMapEmpty!44615) mapIsEmpty!44615))

(assert (= (and b!1135094 (not condMapEmpty!44615)) mapNonEmpty!44615))

(get-info :version)

(assert (= (and mapNonEmpty!44615 ((_ is ValueCellFull!13554) mapValue!44615)) b!1135091))

(assert (= (and b!1135094 ((_ is ValueCellFull!13554) mapDefault!44615)) b!1135077))

(assert (= start!98392 b!1135094))

(declare-fun b_lambda!19103 () Bool)

(assert (=> (not b_lambda!19103) (not b!1135095)))

(declare-fun t!35816 () Bool)

(declare-fun tb!8809 () Bool)

(assert (=> (and start!98392 (= defaultEntry!1004 defaultEntry!1004) t!35816) tb!8809))

(declare-fun result!18183 () Bool)

(assert (=> tb!8809 (= result!18183 tp_is_empty!28527)))

(assert (=> b!1135095 t!35816))

(declare-fun b_and!38845 () Bool)

(assert (= b_and!38843 (and (=> t!35816 result!18183) b_and!38845)))

(declare-fun m!1047729 () Bool)

(assert (=> bm!49509 m!1047729))

(declare-fun m!1047731 () Bool)

(assert (=> bm!49507 m!1047731))

(declare-fun m!1047733 () Bool)

(assert (=> b!1135101 m!1047733))

(declare-fun m!1047735 () Bool)

(assert (=> b!1135101 m!1047735))

(declare-fun m!1047737 () Bool)

(assert (=> b!1135101 m!1047737))

(declare-fun m!1047739 () Bool)

(assert (=> b!1135081 m!1047739))

(declare-fun m!1047741 () Bool)

(assert (=> b!1135096 m!1047741))

(declare-fun m!1047743 () Bool)

(assert (=> b!1135100 m!1047743))

(declare-fun m!1047745 () Bool)

(assert (=> bm!49510 m!1047745))

(declare-fun m!1047747 () Bool)

(assert (=> b!1135082 m!1047747))

(declare-fun m!1047749 () Bool)

(assert (=> start!98392 m!1047749))

(declare-fun m!1047751 () Bool)

(assert (=> start!98392 m!1047751))

(declare-fun m!1047753 () Bool)

(assert (=> b!1135084 m!1047753))

(declare-fun m!1047755 () Bool)

(assert (=> b!1135104 m!1047755))

(declare-fun m!1047757 () Bool)

(assert (=> b!1135105 m!1047757))

(declare-fun m!1047759 () Bool)

(assert (=> b!1135097 m!1047759))

(declare-fun m!1047761 () Bool)

(assert (=> b!1135106 m!1047761))

(declare-fun m!1047763 () Bool)

(assert (=> b!1135087 m!1047763))

(declare-fun m!1047765 () Bool)

(assert (=> b!1135087 m!1047765))

(declare-fun m!1047767 () Bool)

(assert (=> b!1135087 m!1047767))

(declare-fun m!1047769 () Bool)

(assert (=> b!1135079 m!1047769))

(declare-fun m!1047771 () Bool)

(assert (=> b!1135079 m!1047771))

(declare-fun m!1047773 () Bool)

(assert (=> mapNonEmpty!44615 m!1047773))

(declare-fun m!1047775 () Bool)

(assert (=> b!1135095 m!1047775))

(declare-fun m!1047777 () Bool)

(assert (=> b!1135095 m!1047777))

(declare-fun m!1047779 () Bool)

(assert (=> b!1135095 m!1047779))

(declare-fun m!1047781 () Bool)

(assert (=> b!1135095 m!1047781))

(declare-fun m!1047783 () Bool)

(assert (=> b!1135088 m!1047783))

(assert (=> b!1135080 m!1047753))

(declare-fun m!1047785 () Bool)

(assert (=> b!1135092 m!1047785))

(declare-fun m!1047787 () Bool)

(assert (=> b!1135092 m!1047787))

(declare-fun m!1047789 () Bool)

(assert (=> bm!49505 m!1047789))

(declare-fun m!1047791 () Bool)

(assert (=> b!1135099 m!1047791))

(declare-fun m!1047793 () Bool)

(assert (=> b!1135107 m!1047793))

(declare-fun m!1047795 () Bool)

(assert (=> b!1135107 m!1047795))

(assert (=> bm!49503 m!1047787))

(declare-fun m!1047797 () Bool)

(assert (=> b!1135078 m!1047797))

(declare-fun m!1047799 () Bool)

(assert (=> b!1135078 m!1047799))

(check-sat (not bm!49507) (not mapNonEmpty!44615) (not b!1135084) (not b!1135100) (not bm!49509) (not bm!49503) (not b!1135081) (not b!1135095) (not b!1135082) (not b_lambda!19103) (not b!1135101) (not b!1135104) (not b!1135080) (not b!1135079) (not b!1135099) (not b!1135097) b_and!38845 tp_is_empty!28527 (not bm!49510) (not b!1135106) (not b!1135096) (not b!1135107) (not bm!49505) (not b!1135078) (not b!1135087) (not b!1135092) (not b_next!23997) (not start!98392) (not b!1135105))
(check-sat b_and!38845 (not b_next!23997))
