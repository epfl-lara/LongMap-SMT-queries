; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98538 () Bool)

(assert start!98538)

(declare-fun b_free!24143 () Bool)

(declare-fun b_next!24143 () Bool)

(assert (=> start!98538 (= b_free!24143 (not b_next!24143))))

(declare-fun tp!85139 () Bool)

(declare-fun b_and!39135 () Bool)

(assert (=> start!98538 (= tp!85139 b_and!39135)))

(declare-fun e!649520 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!508704 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1141672 () Bool)

(assert (=> b!1141672 (= e!649520 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508704) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141673 () Bool)

(declare-fun res!760966 () Bool)

(declare-fun e!649524 () Bool)

(assert (=> b!1141673 (=> (not res!760966) (not e!649524))))

(declare-datatypes ((array!74201 0))(
  ( (array!74202 (arr!35751 (Array (_ BitVec 32) (_ BitVec 64))) (size!36287 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74201)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43357 0))(
  ( (V!43358 (val!14393 Int)) )
))
(declare-datatypes ((ValueCell!13627 0))(
  ( (ValueCellFull!13627 (v!17030 V!43357)) (EmptyCell!13627) )
))
(declare-datatypes ((array!74203 0))(
  ( (array!74204 (arr!35752 (Array (_ BitVec 32) ValueCell!13627)) (size!36288 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74203)

(assert (=> b!1141673 (= res!760966 (and (= (size!36288 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36287 _keys!1208) (size!36288 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141674 () Bool)

(declare-fun res!760974 () Bool)

(assert (=> b!1141674 (=> (not res!760974) (not e!649524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141674 (= res!760974 (validKeyInArray!0 k!934))))

(declare-fun bm!51255 () Bool)

(declare-datatypes ((tuple2!18208 0))(
  ( (tuple2!18209 (_1!9115 (_ BitVec 64)) (_2!9115 V!43357)) )
))
(declare-datatypes ((List!24963 0))(
  ( (Nil!24960) (Cons!24959 (h!26168 tuple2!18208) (t!36098 List!24963)) )
))
(declare-datatypes ((ListLongMap!16177 0))(
  ( (ListLongMap!16178 (toList!8104 List!24963)) )
))
(declare-fun call!51265 () ListLongMap!16177)

(declare-fun call!51262 () ListLongMap!16177)

(assert (=> bm!51255 (= call!51265 call!51262)))

(declare-fun b!1141675 () Bool)

(declare-fun res!760967 () Bool)

(assert (=> b!1141675 (=> (not res!760967) (not e!649524))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141675 (= res!760967 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36287 _keys!1208))))))

(declare-fun b!1141676 () Bool)

(declare-fun e!649517 () Bool)

(assert (=> b!1141676 (= e!649524 e!649517)))

(declare-fun res!760968 () Bool)

(assert (=> b!1141676 (=> (not res!760968) (not e!649517))))

(declare-fun lt!508710 () array!74201)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74201 (_ BitVec 32)) Bool)

(assert (=> b!1141676 (= res!760968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508710 mask!1564))))

(assert (=> b!1141676 (= lt!508710 (array!74202 (store (arr!35751 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36287 _keys!1208)))))

(declare-fun b!1141678 () Bool)

(declare-fun e!649515 () Bool)

(assert (=> b!1141678 (= e!649515 true)))

(declare-fun lt!508701 () V!43357)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!508709 () ListLongMap!16177)

(declare-fun -!1254 (ListLongMap!16177 (_ BitVec 64)) ListLongMap!16177)

(declare-fun +!3535 (ListLongMap!16177 tuple2!18208) ListLongMap!16177)

(assert (=> b!1141678 (= (-!1254 (+!3535 lt!508709 (tuple2!18209 (select (arr!35751 _keys!1208) from!1455) lt!508701)) (select (arr!35751 _keys!1208) from!1455)) lt!508709)))

(declare-datatypes ((Unit!37448 0))(
  ( (Unit!37449) )
))
(declare-fun lt!508697 () Unit!37448)

(declare-fun addThenRemoveForNewKeyIsSame!107 (ListLongMap!16177 (_ BitVec 64) V!43357) Unit!37448)

(assert (=> b!1141678 (= lt!508697 (addThenRemoveForNewKeyIsSame!107 lt!508709 (select (arr!35751 _keys!1208) from!1455) lt!508701))))

(declare-fun lt!508711 () V!43357)

(declare-fun get!18167 (ValueCell!13627 V!43357) V!43357)

(assert (=> b!1141678 (= lt!508701 (get!18167 (select (arr!35752 _values!996) from!1455) lt!508711))))

(declare-fun lt!508708 () Unit!37448)

(declare-fun e!649513 () Unit!37448)

(assert (=> b!1141678 (= lt!508708 e!649513)))

(declare-fun c!112148 () Bool)

(declare-fun contains!6639 (ListLongMap!16177 (_ BitVec 64)) Bool)

(assert (=> b!1141678 (= c!112148 (contains!6639 lt!508709 k!934))))

(declare-fun zeroValue!944 () V!43357)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43357)

(declare-fun getCurrentListMapNoExtraKeys!4586 (array!74201 array!74203 (_ BitVec 32) (_ BitVec 32) V!43357 V!43357 (_ BitVec 32) Int) ListLongMap!16177)

(assert (=> b!1141678 (= lt!508709 (getCurrentListMapNoExtraKeys!4586 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141679 () Bool)

(declare-fun e!649525 () Unit!37448)

(declare-fun Unit!37450 () Unit!37448)

(assert (=> b!1141679 (= e!649525 Unit!37450)))

(declare-fun b!1141680 () Bool)

(declare-fun res!760978 () Bool)

(assert (=> b!1141680 (=> (not res!760978) (not e!649524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141680 (= res!760978 (validMask!0 mask!1564))))

(declare-fun b!1141681 () Bool)

(declare-fun e!649522 () Bool)

(declare-fun call!51264 () ListLongMap!16177)

(declare-fun call!51258 () ListLongMap!16177)

(assert (=> b!1141681 (= e!649522 (= call!51264 call!51258))))

(declare-fun b!1141682 () Bool)

(declare-fun arrayContainsKey!0 (array!74201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141682 (= e!649520 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141683 () Bool)

(declare-fun res!760972 () Bool)

(assert (=> b!1141683 (=> (not res!760972) (not e!649517))))

(declare-datatypes ((List!24964 0))(
  ( (Nil!24961) (Cons!24960 (h!26169 (_ BitVec 64)) (t!36099 List!24964)) )
))
(declare-fun arrayNoDuplicates!0 (array!74201 (_ BitVec 32) List!24964) Bool)

(assert (=> b!1141683 (= res!760972 (arrayNoDuplicates!0 lt!508710 #b00000000000000000000000000000000 Nil!24961))))

(declare-fun mapIsEmpty!44834 () Bool)

(declare-fun mapRes!44834 () Bool)

(assert (=> mapIsEmpty!44834 mapRes!44834))

(declare-fun b!1141684 () Bool)

(assert (=> b!1141684 (= e!649522 (= call!51264 (-!1254 call!51258 k!934)))))

(declare-fun c!112146 () Bool)

(declare-fun c!112150 () Bool)

(declare-fun bm!51256 () Bool)

(assert (=> bm!51256 (= call!51262 (+!3535 lt!508709 (ite (or c!112146 c!112150) (tuple2!18209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1141685 () Bool)

(declare-fun e!649527 () Bool)

(declare-fun tp_is_empty!28673 () Bool)

(assert (=> b!1141685 (= e!649527 tp_is_empty!28673)))

(declare-fun b!1141686 () Bool)

(declare-fun res!760973 () Bool)

(assert (=> b!1141686 (=> (not res!760973) (not e!649524))))

(assert (=> b!1141686 (= res!760973 (= (select (arr!35751 _keys!1208) i!673) k!934))))

(declare-fun b!1141687 () Bool)

(declare-fun call!51261 () Bool)

(assert (=> b!1141687 call!51261))

(declare-fun lt!508703 () Unit!37448)

(declare-fun call!51263 () Unit!37448)

(assert (=> b!1141687 (= lt!508703 call!51263)))

(assert (=> b!1141687 (= e!649525 lt!508703)))

(declare-fun mapNonEmpty!44834 () Bool)

(declare-fun tp!85140 () Bool)

(assert (=> mapNonEmpty!44834 (= mapRes!44834 (and tp!85140 e!649527))))

(declare-fun mapValue!44834 () ValueCell!13627)

(declare-fun mapRest!44834 () (Array (_ BitVec 32) ValueCell!13627))

(declare-fun mapKey!44834 () (_ BitVec 32))

(assert (=> mapNonEmpty!44834 (= (arr!35752 _values!996) (store mapRest!44834 mapKey!44834 mapValue!44834))))

(declare-fun bm!51257 () Bool)

(declare-fun call!51259 () Unit!37448)

(declare-fun addStillContains!792 (ListLongMap!16177 (_ BitVec 64) V!43357 (_ BitVec 64)) Unit!37448)

(assert (=> bm!51257 (= call!51259 (addStillContains!792 lt!508709 (ite (or c!112146 c!112150) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112146 c!112150) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1141688 () Bool)

(declare-fun e!649526 () Bool)

(declare-fun e!649519 () Bool)

(assert (=> b!1141688 (= e!649526 (and e!649519 mapRes!44834))))

(declare-fun condMapEmpty!44834 () Bool)

(declare-fun mapDefault!44834 () ValueCell!13627)

