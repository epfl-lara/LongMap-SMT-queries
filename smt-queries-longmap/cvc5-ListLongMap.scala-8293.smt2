; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101068 () Bool)

(assert start!101068)

(declare-fun b_free!26029 () Bool)

(declare-fun b_next!26029 () Bool)

(assert (=> start!101068 (= b_free!26029 (not b_next!26029))))

(declare-fun tp!91106 () Bool)

(declare-fun b_and!43157 () Bool)

(assert (=> start!101068 (= tp!91106 b_and!43157)))

(declare-fun b!1211193 () Bool)

(declare-fun res!804667 () Bool)

(declare-fun e!687876 () Bool)

(assert (=> b!1211193 (=> (not res!804667) (not e!687876))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211193 (= res!804667 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!47971 () Bool)

(declare-fun mapRes!47971 () Bool)

(declare-fun tp!91105 () Bool)

(declare-fun e!687870 () Bool)

(assert (=> mapNonEmpty!47971 (= mapRes!47971 (and tp!91105 e!687870))))

(declare-datatypes ((V!46105 0))(
  ( (V!46106 (val!15423 Int)) )
))
(declare-datatypes ((ValueCell!14657 0))(
  ( (ValueCellFull!14657 (v!18075 V!46105)) (EmptyCell!14657) )
))
(declare-fun mapValue!47971 () ValueCell!14657)

(declare-fun mapKey!47971 () (_ BitVec 32))

(declare-fun mapRest!47971 () (Array (_ BitVec 32) ValueCell!14657))

(declare-datatypes ((array!78253 0))(
  ( (array!78254 (arr!37762 (Array (_ BitVec 32) ValueCell!14657)) (size!38298 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78253)

(assert (=> mapNonEmpty!47971 (= (arr!37762 _values!996) (store mapRest!47971 mapKey!47971 mapValue!47971))))

(declare-fun zeroValue!944 () V!46105)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!550081 () array!78253)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78255 0))(
  ( (array!78256 (arr!37763 (Array (_ BitVec 32) (_ BitVec 64))) (size!38299 (_ BitVec 32))) )
))
(declare-fun lt!550083 () array!78255)

(declare-datatypes ((tuple2!19810 0))(
  ( (tuple2!19811 (_1!9916 (_ BitVec 64)) (_2!9916 V!46105)) )
))
(declare-datatypes ((List!26611 0))(
  ( (Nil!26608) (Cons!26607 (h!27816 tuple2!19810) (t!39620 List!26611)) )
))
(declare-datatypes ((ListLongMap!17779 0))(
  ( (ListLongMap!17780 (toList!8905 List!26611)) )
))
(declare-fun call!59813 () ListLongMap!17779)

(declare-fun bm!59807 () Bool)

(declare-fun minValue!944 () V!46105)

(declare-fun getCurrentListMapNoExtraKeys!5337 (array!78255 array!78253 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 32) Int) ListLongMap!17779)

(assert (=> bm!59807 (= call!59813 (getCurrentListMapNoExtraKeys!5337 lt!550083 lt!550081 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211194 () Bool)

(declare-fun e!687866 () Bool)

(declare-fun call!59817 () ListLongMap!17779)

(assert (=> b!1211194 (= e!687866 (= call!59813 call!59817))))

(declare-fun mapIsEmpty!47971 () Bool)

(assert (=> mapIsEmpty!47971 mapRes!47971))

(declare-fun b!1211195 () Bool)

(declare-fun res!804666 () Bool)

(assert (=> b!1211195 (=> (not res!804666) (not e!687876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211195 (= res!804666 (validMask!0 mask!1564))))

(declare-fun lt!550075 () ListLongMap!17779)

(declare-fun c!119422 () Bool)

(declare-fun c!119424 () Bool)

(declare-fun bm!59808 () Bool)

(declare-fun lt!550085 () ListLongMap!17779)

(declare-fun call!59811 () ListLongMap!17779)

(declare-fun +!4023 (ListLongMap!17779 tuple2!19810) ListLongMap!17779)

(assert (=> bm!59808 (= call!59811 (+!4023 (ite c!119422 lt!550075 lt!550085) (ite c!119422 (tuple2!19811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119424 (tuple2!19811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1211196 () Bool)

(declare-fun e!687875 () Bool)

(assert (=> b!1211196 (= e!687875 true)))

(declare-fun e!687864 () Bool)

(assert (=> b!1211196 e!687864))

(declare-fun res!804661 () Bool)

(assert (=> b!1211196 (=> (not res!804661) (not e!687864))))

(declare-fun _keys!1208 () array!78255)

(declare-fun lt!550082 () V!46105)

(declare-fun -!1854 (ListLongMap!17779 (_ BitVec 64)) ListLongMap!17779)

(assert (=> b!1211196 (= res!804661 (= (-!1854 (+!4023 lt!550085 (tuple2!19811 (select (arr!37763 _keys!1208) from!1455) lt!550082)) (select (arr!37763 _keys!1208) from!1455)) lt!550085))))

(declare-datatypes ((Unit!40156 0))(
  ( (Unit!40157) )
))
(declare-fun lt!550074 () Unit!40156)

(declare-fun addThenRemoveForNewKeyIsSame!272 (ListLongMap!17779 (_ BitVec 64) V!46105) Unit!40156)

(assert (=> b!1211196 (= lt!550074 (addThenRemoveForNewKeyIsSame!272 lt!550085 (select (arr!37763 _keys!1208) from!1455) lt!550082))))

(declare-fun lt!550090 () V!46105)

(declare-fun get!19243 (ValueCell!14657 V!46105) V!46105)

(assert (=> b!1211196 (= lt!550082 (get!19243 (select (arr!37762 _values!996) from!1455) lt!550090))))

(declare-fun lt!550087 () Unit!40156)

(declare-fun e!687871 () Unit!40156)

(assert (=> b!1211196 (= lt!550087 e!687871)))

(declare-fun c!119421 () Bool)

(declare-fun contains!6978 (ListLongMap!17779 (_ BitVec 64)) Bool)

(assert (=> b!1211196 (= c!119421 (contains!6978 lt!550085 k!934))))

(assert (=> b!1211196 (= lt!550085 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211197 () Bool)

(declare-fun res!804665 () Bool)

(declare-fun e!687862 () Bool)

(assert (=> b!1211197 (=> (not res!804665) (not e!687862))))

(declare-datatypes ((List!26612 0))(
  ( (Nil!26609) (Cons!26608 (h!27817 (_ BitVec 64)) (t!39621 List!26612)) )
))
(declare-fun arrayNoDuplicates!0 (array!78255 (_ BitVec 32) List!26612) Bool)

(assert (=> b!1211197 (= res!804665 (arrayNoDuplicates!0 lt!550083 #b00000000000000000000000000000000 Nil!26609))))

(declare-fun e!687861 () Bool)

(declare-fun b!1211198 () Bool)

(declare-fun arrayContainsKey!0 (array!78255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211198 (= e!687861 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211199 () Bool)

(declare-fun Unit!40158 () Unit!40156)

(assert (=> b!1211199 (= e!687871 Unit!40158)))

(declare-fun b!1211200 () Bool)

(declare-fun e!687860 () Bool)

(assert (=> b!1211200 (= e!687862 (not e!687860))))

(declare-fun res!804657 () Bool)

(assert (=> b!1211200 (=> res!804657 e!687860)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211200 (= res!804657 (bvsgt from!1455 i!673))))

(assert (=> b!1211200 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!550091 () Unit!40156)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78255 (_ BitVec 64) (_ BitVec 32)) Unit!40156)

(assert (=> b!1211200 (= lt!550091 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1211201 () Bool)

(declare-fun res!804664 () Bool)

(assert (=> b!1211201 (=> (not res!804664) (not e!687876))))

(assert (=> b!1211201 (= res!804664 (= (select (arr!37763 _keys!1208) i!673) k!934))))

(declare-fun b!1211202 () Bool)

(declare-fun res!804669 () Bool)

(assert (=> b!1211202 (=> (not res!804669) (not e!687876))))

(assert (=> b!1211202 (= res!804669 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38299 _keys!1208))))))

(declare-fun b!1211203 () Bool)

(declare-fun e!687867 () Bool)

(assert (=> b!1211203 (= e!687867 e!687875)))

(declare-fun res!804659 () Bool)

(assert (=> b!1211203 (=> res!804659 e!687875)))

(assert (=> b!1211203 (= res!804659 (not (= (select (arr!37763 _keys!1208) from!1455) k!934)))))

(assert (=> b!1211203 e!687866))

(declare-fun c!119423 () Bool)

(assert (=> b!1211203 (= c!119423 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550084 () Unit!40156)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1064 (array!78255 array!78253 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40156)

(assert (=> b!1211203 (= lt!550084 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1064 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211204 () Bool)

(declare-fun e!687869 () Unit!40156)

(declare-fun e!687865 () Unit!40156)

(assert (=> b!1211204 (= e!687869 e!687865)))

(declare-fun c!119425 () Bool)

(declare-fun lt!550093 () Bool)

(assert (=> b!1211204 (= c!119425 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550093))))

(declare-fun b!1211205 () Bool)

(assert (=> b!1211205 (= c!119424 (and (not lt!550093) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687863 () Unit!40156)

(assert (=> b!1211205 (= e!687863 e!687869)))

(declare-fun bm!59809 () Bool)

(declare-fun call!59816 () ListLongMap!17779)

(declare-fun call!59814 () Bool)

(assert (=> bm!59809 (= call!59814 (contains!6978 (ite c!119422 lt!550075 call!59816) k!934))))

(declare-fun b!1211206 () Bool)

(declare-fun call!59810 () Bool)

(assert (=> b!1211206 call!59810))

(declare-fun lt!550076 () Unit!40156)

(declare-fun call!59815 () Unit!40156)

(assert (=> b!1211206 (= lt!550076 call!59815)))

(assert (=> b!1211206 (= e!687865 lt!550076)))

(declare-fun b!1211207 () Bool)

(declare-fun lt!550080 () Unit!40156)

(assert (=> b!1211207 (= e!687869 lt!550080)))

(assert (=> b!1211207 (= lt!550080 call!59815)))

(assert (=> b!1211207 call!59810))

(declare-fun b!1211208 () Bool)

(declare-fun Unit!40159 () Unit!40156)

(assert (=> b!1211208 (= e!687865 Unit!40159)))

(declare-fun e!687868 () Bool)

(declare-fun b!1211209 () Bool)

(assert (=> b!1211209 (= e!687868 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550093) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211210 () Bool)

(declare-fun Unit!40160 () Unit!40156)

(assert (=> b!1211210 (= e!687871 Unit!40160)))

(assert (=> b!1211210 (= lt!550093 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211210 (= c!119422 (and (not lt!550093) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550086 () Unit!40156)

(assert (=> b!1211210 (= lt!550086 e!687863)))

(declare-fun lt!550079 () Unit!40156)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!602 (array!78255 array!78253 (_ BitVec 32) (_ BitVec 32) V!46105 V!46105 (_ BitVec 64) (_ BitVec 32) Int) Unit!40156)

(assert (=> b!1211210 (= lt!550079 (lemmaListMapContainsThenArrayContainsFrom!602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119420 () Bool)

(assert (=> b!1211210 (= c!119420 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804660 () Bool)

(assert (=> b!1211210 (= res!804660 e!687868)))

(assert (=> b!1211210 (=> (not res!804660) (not e!687861))))

(assert (=> b!1211210 e!687861))

(declare-fun lt!550092 () Unit!40156)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78255 (_ BitVec 32) (_ BitVec 32)) Unit!40156)

(assert (=> b!1211210 (= lt!550092 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1211210 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26609)))

(declare-fun lt!550078 () Unit!40156)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78255 (_ BitVec 64) (_ BitVec 32) List!26612) Unit!40156)

(assert (=> b!1211210 (= lt!550078 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26609))))

(assert (=> b!1211210 false))

(declare-fun b!1211211 () Bool)

(declare-fun tp_is_empty!30733 () Bool)

(assert (=> b!1211211 (= e!687870 tp_is_empty!30733)))

(declare-fun bm!59810 () Bool)

(assert (=> bm!59810 (= call!59817 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211212 () Bool)

(assert (=> b!1211212 (contains!6978 call!59811 k!934)))

(declare-fun lt!550094 () Unit!40156)

(declare-fun addStillContains!1051 (ListLongMap!17779 (_ BitVec 64) V!46105 (_ BitVec 64)) Unit!40156)

(assert (=> b!1211212 (= lt!550094 (addStillContains!1051 lt!550075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1211212 call!59814))

(assert (=> b!1211212 (= lt!550075 (+!4023 lt!550085 (tuple2!19811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550089 () Unit!40156)

(declare-fun call!59812 () Unit!40156)

(assert (=> b!1211212 (= lt!550089 call!59812)))

(assert (=> b!1211212 (= e!687863 lt!550094)))

(declare-fun b!1211213 () Bool)

(assert (=> b!1211213 (= e!687868 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!804658 () Bool)

(assert (=> start!101068 (=> (not res!804658) (not e!687876))))

(assert (=> start!101068 (= res!804658 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38299 _keys!1208))))))

(assert (=> start!101068 e!687876))

(assert (=> start!101068 tp_is_empty!30733))

(declare-fun array_inv!28764 (array!78255) Bool)

(assert (=> start!101068 (array_inv!28764 _keys!1208)))

(assert (=> start!101068 true))

(assert (=> start!101068 tp!91106))

(declare-fun e!687872 () Bool)

(declare-fun array_inv!28765 (array!78253) Bool)

(assert (=> start!101068 (and (array_inv!28765 _values!996) e!687872)))

(declare-fun b!1211214 () Bool)

(declare-fun res!804662 () Bool)

(assert (=> b!1211214 (=> (not res!804662) (not e!687876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78255 (_ BitVec 32)) Bool)

(assert (=> b!1211214 (= res!804662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211215 () Bool)

(declare-fun lt!550077 () ListLongMap!17779)

(assert (=> b!1211215 (= e!687864 (= (-!1854 lt!550077 k!934) lt!550085))))

(declare-fun b!1211216 () Bool)

(assert (=> b!1211216 (= e!687876 e!687862)))

(declare-fun res!804670 () Bool)

(assert (=> b!1211216 (=> (not res!804670) (not e!687862))))

(assert (=> b!1211216 (= res!804670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550083 mask!1564))))

(assert (=> b!1211216 (= lt!550083 (array!78256 (store (arr!37763 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38299 _keys!1208)))))

(declare-fun bm!59811 () Bool)

(assert (=> bm!59811 (= call!59812 (addStillContains!1051 lt!550085 (ite (or c!119422 c!119424) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119422 c!119424) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1211217 () Bool)

(assert (=> b!1211217 (= e!687866 (= call!59813 (-!1854 call!59817 k!934)))))

(declare-fun b!1211218 () Bool)

(declare-fun res!804656 () Bool)

(assert (=> b!1211218 (=> (not res!804656) (not e!687876))))

(assert (=> b!1211218 (= res!804656 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26609))))

(declare-fun bm!59812 () Bool)

(assert (=> bm!59812 (= call!59816 call!59811)))

(declare-fun b!1211219 () Bool)

(declare-fun e!687874 () Bool)

(assert (=> b!1211219 (= e!687874 tp_is_empty!30733)))

(declare-fun b!1211220 () Bool)

(assert (=> b!1211220 (= e!687872 (and e!687874 mapRes!47971))))

(declare-fun condMapEmpty!47971 () Bool)

(declare-fun mapDefault!47971 () ValueCell!14657)

