; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98954 () Bool)

(assert start!98954)

(declare-fun b_free!24559 () Bool)

(declare-fun b_next!24559 () Bool)

(assert (=> start!98954 (= b_free!24559 (not b_next!24559))))

(declare-fun tp!86388 () Bool)

(declare-fun b_and!39967 () Bool)

(assert (=> start!98954 (= tp!86388 b_and!39967)))

(declare-fun b!1160726 () Bool)

(declare-datatypes ((V!43913 0))(
  ( (V!43914 (val!14601 Int)) )
))
(declare-datatypes ((tuple2!18600 0))(
  ( (tuple2!18601 (_1!9311 (_ BitVec 64)) (_2!9311 V!43913)) )
))
(declare-datatypes ((List!25337 0))(
  ( (Nil!25334) (Cons!25333 (h!26542 tuple2!18600) (t!36888 List!25337)) )
))
(declare-datatypes ((ListLongMap!16569 0))(
  ( (ListLongMap!16570 (toList!8300 List!25337)) )
))
(declare-fun call!56251 () ListLongMap!16569)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6806 (ListLongMap!16569 (_ BitVec 64)) Bool)

(assert (=> b!1160726 (contains!6806 call!56251 k!934)))

(declare-datatypes ((Unit!38272 0))(
  ( (Unit!38273) )
))
(declare-fun lt!522189 () Unit!38272)

(declare-fun lt!522193 () ListLongMap!16569)

(declare-fun minValue!944 () V!43913)

(declare-fun addStillContains!947 (ListLongMap!16569 (_ BitVec 64) V!43913 (_ BitVec 64)) Unit!38272)

(assert (=> b!1160726 (= lt!522189 (addStillContains!947 lt!522193 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!56257 () Bool)

(assert (=> b!1160726 call!56257))

(declare-fun lt!522185 () ListLongMap!16569)

(declare-fun zeroValue!944 () V!43913)

(declare-fun +!3705 (ListLongMap!16569 tuple2!18600) ListLongMap!16569)

(assert (=> b!1160726 (= lt!522193 (+!3705 lt!522185 (tuple2!18601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522183 () Unit!38272)

(declare-fun call!56253 () Unit!38272)

(assert (=> b!1160726 (= lt!522183 call!56253)))

(declare-fun e!660045 () Unit!38272)

(assert (=> b!1160726 (= e!660045 lt!522189)))

(declare-fun b!1160727 () Bool)

(declare-fun e!660043 () Unit!38272)

(declare-fun Unit!38274 () Unit!38272)

(assert (=> b!1160727 (= e!660043 Unit!38274)))

(declare-fun b!1160728 () Bool)

(declare-fun e!660052 () Bool)

(assert (=> b!1160728 (= e!660052 true)))

(declare-fun e!660054 () Bool)

(assert (=> b!1160728 e!660054))

(declare-fun res!770244 () Bool)

(assert (=> b!1160728 (=> (not res!770244) (not e!660054))))

(declare-fun lt!522191 () ListLongMap!16569)

(assert (=> b!1160728 (= res!770244 (= lt!522191 lt!522185))))

(declare-fun lt!522190 () ListLongMap!16569)

(declare-fun -!1409 (ListLongMap!16569 (_ BitVec 64)) ListLongMap!16569)

(assert (=> b!1160728 (= lt!522191 (-!1409 lt!522190 k!934))))

(declare-datatypes ((array!75019 0))(
  ( (array!75020 (arr!36160 (Array (_ BitVec 32) (_ BitVec 64))) (size!36696 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75019)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!522201 () V!43913)

(assert (=> b!1160728 (= (-!1409 (+!3705 lt!522185 (tuple2!18601 (select (arr!36160 _keys!1208) from!1455) lt!522201)) (select (arr!36160 _keys!1208) from!1455)) lt!522185)))

(declare-fun lt!522200 () Unit!38272)

(declare-fun addThenRemoveForNewKeyIsSame!243 (ListLongMap!16569 (_ BitVec 64) V!43913) Unit!38272)

(assert (=> b!1160728 (= lt!522200 (addThenRemoveForNewKeyIsSame!243 lt!522185 (select (arr!36160 _keys!1208) from!1455) lt!522201))))

(declare-datatypes ((ValueCell!13835 0))(
  ( (ValueCellFull!13835 (v!17238 V!43913)) (EmptyCell!13835) )
))
(declare-datatypes ((array!75021 0))(
  ( (array!75022 (arr!36161 (Array (_ BitVec 32) ValueCell!13835)) (size!36697 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75021)

(declare-fun lt!522196 () V!43913)

(declare-fun get!18443 (ValueCell!13835 V!43913) V!43913)

(assert (=> b!1160728 (= lt!522201 (get!18443 (select (arr!36161 _values!996) from!1455) lt!522196))))

(declare-fun lt!522197 () Unit!38272)

(assert (=> b!1160728 (= lt!522197 e!660043)))

(declare-fun c!115891 () Bool)

(assert (=> b!1160728 (= c!115891 (contains!6806 lt!522185 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4764 (array!75019 array!75021 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 32) Int) ListLongMap!16569)

(assert (=> b!1160728 (= lt!522185 (getCurrentListMapNoExtraKeys!4764 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770258 () Bool)

(declare-fun e!660046 () Bool)

(assert (=> start!98954 (=> (not res!770258) (not e!660046))))

(assert (=> start!98954 (= res!770258 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36696 _keys!1208))))))

(assert (=> start!98954 e!660046))

(declare-fun tp_is_empty!29089 () Bool)

(assert (=> start!98954 tp_is_empty!29089))

(declare-fun array_inv!27668 (array!75019) Bool)

(assert (=> start!98954 (array_inv!27668 _keys!1208)))

(assert (=> start!98954 true))

(assert (=> start!98954 tp!86388))

(declare-fun e!660039 () Bool)

(declare-fun array_inv!27669 (array!75021) Bool)

(assert (=> start!98954 (and (array_inv!27669 _values!996) e!660039)))

(declare-fun b!1160729 () Bool)

(declare-fun e!660048 () Bool)

(assert (=> b!1160729 (= e!660048 tp_is_empty!29089)))

(declare-fun b!1160730 () Bool)

(declare-fun e!660047 () Bool)

(assert (=> b!1160730 (= e!660047 e!660052)))

(declare-fun res!770249 () Bool)

(assert (=> b!1160730 (=> res!770249 e!660052)))

(assert (=> b!1160730 (= res!770249 (not (= (select (arr!36160 _keys!1208) from!1455) k!934)))))

(declare-fun e!660053 () Bool)

(assert (=> b!1160730 e!660053))

(declare-fun c!115894 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160730 (= c!115894 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522186 () Unit!38272)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!638 (array!75019 array!75021 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38272)

(assert (=> b!1160730 (= lt!522186 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!638 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160731 () Bool)

(declare-fun e!660041 () Bool)

(assert (=> b!1160731 (= e!660046 e!660041)))

(declare-fun res!770245 () Bool)

(assert (=> b!1160731 (=> (not res!770245) (not e!660041))))

(declare-fun lt!522195 () array!75019)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75019 (_ BitVec 32)) Bool)

(assert (=> b!1160731 (= res!770245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!522195 mask!1564))))

(assert (=> b!1160731 (= lt!522195 (array!75020 (store (arr!36160 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36696 _keys!1208)))))

(declare-fun b!1160732 () Bool)

(declare-fun res!770256 () Bool)

(assert (=> b!1160732 (=> (not res!770256) (not e!660046))))

(assert (=> b!1160732 (= res!770256 (and (= (size!36697 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36696 _keys!1208) (size!36697 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56247 () Bool)

(declare-fun lt!522199 () array!75021)

(declare-fun call!56255 () ListLongMap!16569)

(assert (=> bm!56247 (= call!56255 (getCurrentListMapNoExtraKeys!4764 (ite c!115894 lt!522195 _keys!1208) (ite c!115894 lt!522199 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!660049 () Bool)

(declare-fun b!1160733 () Bool)

(declare-fun arrayContainsKey!0 (array!75019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160733 (= e!660049 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160734 () Bool)

(declare-fun call!56250 () ListLongMap!16569)

(assert (=> b!1160734 (= e!660053 (= call!56250 call!56255))))

(declare-fun b!1160735 () Bool)

(declare-fun e!660038 () Unit!38272)

(declare-fun e!660040 () Unit!38272)

(assert (=> b!1160735 (= e!660038 e!660040)))

(declare-fun c!115892 () Bool)

(declare-fun lt!522181 () Bool)

(assert (=> b!1160735 (= c!115892 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522181))))

(declare-fun mapIsEmpty!45458 () Bool)

(declare-fun mapRes!45458 () Bool)

(assert (=> mapIsEmpty!45458 mapRes!45458))

(declare-fun b!1160736 () Bool)

(assert (=> b!1160736 (= e!660039 (and e!660048 mapRes!45458))))

(declare-fun condMapEmpty!45458 () Bool)

(declare-fun mapDefault!45458 () ValueCell!13835)

