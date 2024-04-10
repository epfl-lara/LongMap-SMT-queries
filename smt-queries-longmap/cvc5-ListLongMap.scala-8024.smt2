; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98984 () Bool)

(assert start!98984)

(declare-fun b_free!24589 () Bool)

(declare-fun b_next!24589 () Bool)

(assert (=> start!98984 (= b_free!24589 (not b_next!24589))))

(declare-fun tp!86477 () Bool)

(declare-fun b_and!40027 () Bool)

(assert (=> start!98984 (= tp!86477 b_and!40027)))

(declare-fun b!1162106 () Bool)

(declare-fun res!770931 () Bool)

(declare-fun e!660805 () Bool)

(assert (=> b!1162106 (=> (not res!770931) (not e!660805))))

(declare-datatypes ((array!75077 0))(
  ( (array!75078 (arr!36189 (Array (_ BitVec 32) (_ BitVec 64))) (size!36725 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75077)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75077 (_ BitVec 32)) Bool)

(assert (=> b!1162106 (= res!770931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162107 () Bool)

(declare-fun e!660812 () Bool)

(declare-fun e!660813 () Bool)

(assert (=> b!1162107 (= e!660812 e!660813)))

(declare-fun res!770928 () Bool)

(assert (=> b!1162107 (=> res!770928 e!660813)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162107 (= res!770928 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43953 0))(
  ( (V!43954 (val!14616 Int)) )
))
(declare-fun zeroValue!944 () V!43953)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13850 0))(
  ( (ValueCellFull!13850 (v!17253 V!43953)) (EmptyCell!13850) )
))
(declare-datatypes ((array!75079 0))(
  ( (array!75080 (arr!36190 (Array (_ BitVec 32) ValueCell!13850)) (size!36726 (_ BitVec 32))) )
))
(declare-fun lt!523188 () array!75079)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43953)

(declare-fun lt!523180 () array!75077)

(declare-datatypes ((tuple2!18628 0))(
  ( (tuple2!18629 (_1!9325 (_ BitVec 64)) (_2!9325 V!43953)) )
))
(declare-datatypes ((List!25362 0))(
  ( (Nil!25359) (Cons!25358 (h!26567 tuple2!18628) (t!36943 List!25362)) )
))
(declare-datatypes ((ListLongMap!16597 0))(
  ( (ListLongMap!16598 (toList!8314 List!25362)) )
))
(declare-fun lt!523183 () ListLongMap!16597)

(declare-fun getCurrentListMapNoExtraKeys!4778 (array!75077 array!75079 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 32) Int) ListLongMap!16597)

(assert (=> b!1162107 (= lt!523183 (getCurrentListMapNoExtraKeys!4778 lt!523180 lt!523188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523187 () V!43953)

(declare-fun _values!996 () array!75079)

(assert (=> b!1162107 (= lt!523188 (array!75080 (store (arr!36190 _values!996) i!673 (ValueCellFull!13850 lt!523187)) (size!36726 _values!996)))))

(declare-fun dynLambda!2774 (Int (_ BitVec 64)) V!43953)

(assert (=> b!1162107 (= lt!523187 (dynLambda!2774 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523176 () ListLongMap!16597)

(assert (=> b!1162107 (= lt!523176 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162108 () Bool)

(declare-fun e!660807 () Bool)

(declare-fun tp_is_empty!29119 () Bool)

(assert (=> b!1162108 (= e!660807 tp_is_empty!29119)))

(declare-fun b!1162109 () Bool)

(declare-datatypes ((Unit!38334 0))(
  ( (Unit!38335) )
))
(declare-fun e!660809 () Unit!38334)

(declare-fun e!660810 () Unit!38334)

(assert (=> b!1162109 (= e!660809 e!660810)))

(declare-fun c!116159 () Bool)

(declare-fun lt!523171 () Bool)

(assert (=> b!1162109 (= c!116159 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523171))))

(declare-fun b!1162110 () Bool)

(declare-fun e!660808 () Bool)

(assert (=> b!1162110 (= e!660805 e!660808)))

(declare-fun res!770930 () Bool)

(assert (=> b!1162110 (=> (not res!770930) (not e!660808))))

(assert (=> b!1162110 (= res!770930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523180 mask!1564))))

(assert (=> b!1162110 (= lt!523180 (array!75078 (store (arr!36189 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36725 _keys!1208)))))

(declare-fun b!1162111 () Bool)

(declare-fun res!770927 () Bool)

(assert (=> b!1162111 (=> (not res!770927) (not e!660805))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1162111 (= res!770927 (= (select (arr!36189 _keys!1208) i!673) k!934))))

(declare-fun bm!56608 () Bool)

(declare-fun call!56617 () ListLongMap!16597)

(assert (=> bm!56608 (= call!56617 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162112 () Bool)

(declare-fun e!660818 () Unit!38334)

(declare-fun Unit!38336 () Unit!38334)

(assert (=> b!1162112 (= e!660818 Unit!38336)))

(assert (=> b!1162112 (= lt!523171 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116164 () Bool)

(assert (=> b!1162112 (= c!116164 (and (not lt!523171) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523186 () Unit!38334)

(declare-fun e!660804 () Unit!38334)

(assert (=> b!1162112 (= lt!523186 e!660804)))

(declare-fun lt!523175 () Unit!38334)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!544 (array!75077 array!75079 (_ BitVec 32) (_ BitVec 32) V!43953 V!43953 (_ BitVec 64) (_ BitVec 32) Int) Unit!38334)

(assert (=> b!1162112 (= lt!523175 (lemmaListMapContainsThenArrayContainsFrom!544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116161 () Bool)

(assert (=> b!1162112 (= c!116161 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770925 () Bool)

(declare-fun e!660814 () Bool)

(assert (=> b!1162112 (= res!770925 e!660814)))

(declare-fun e!660816 () Bool)

(assert (=> b!1162112 (=> (not res!770925) (not e!660816))))

(assert (=> b!1162112 e!660816))

(declare-fun lt!523178 () Unit!38334)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75077 (_ BitVec 32) (_ BitVec 32)) Unit!38334)

(assert (=> b!1162112 (= lt!523178 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25363 0))(
  ( (Nil!25360) (Cons!25359 (h!26568 (_ BitVec 64)) (t!36944 List!25363)) )
))
(declare-fun arrayNoDuplicates!0 (array!75077 (_ BitVec 32) List!25363) Bool)

(assert (=> b!1162112 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25360)))

(declare-fun lt!523189 () Unit!38334)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75077 (_ BitVec 64) (_ BitVec 32) List!25363) Unit!38334)

(assert (=> b!1162112 (= lt!523189 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25360))))

(assert (=> b!1162112 false))

(declare-fun b!1162113 () Bool)

(declare-fun e!660806 () Bool)

(assert (=> b!1162113 (= e!660806 tp_is_empty!29119)))

(declare-fun mapNonEmpty!45503 () Bool)

(declare-fun mapRes!45503 () Bool)

(declare-fun tp!86478 () Bool)

(assert (=> mapNonEmpty!45503 (= mapRes!45503 (and tp!86478 e!660807))))

(declare-fun mapRest!45503 () (Array (_ BitVec 32) ValueCell!13850))

(declare-fun mapValue!45503 () ValueCell!13850)

(declare-fun mapKey!45503 () (_ BitVec 32))

(assert (=> mapNonEmpty!45503 (= (arr!36190 _values!996) (store mapRest!45503 mapKey!45503 mapValue!45503))))

(declare-fun res!770919 () Bool)

(assert (=> start!98984 (=> (not res!770919) (not e!660805))))

(assert (=> start!98984 (= res!770919 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36725 _keys!1208))))))

(assert (=> start!98984 e!660805))

(assert (=> start!98984 tp_is_empty!29119))

(declare-fun array_inv!27692 (array!75077) Bool)

(assert (=> start!98984 (array_inv!27692 _keys!1208)))

(assert (=> start!98984 true))

(assert (=> start!98984 tp!86477))

(declare-fun e!660815 () Bool)

(declare-fun array_inv!27693 (array!75079) Bool)

(assert (=> start!98984 (and (array_inv!27693 _values!996) e!660815)))

(declare-fun bm!56607 () Bool)

(declare-fun call!56610 () Bool)

(declare-fun call!56612 () Bool)

(assert (=> bm!56607 (= call!56610 call!56612)))

(declare-fun b!1162114 () Bool)

(declare-fun res!770929 () Bool)

(assert (=> b!1162114 (=> (not res!770929) (not e!660805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162114 (= res!770929 (validMask!0 mask!1564))))

(declare-fun bm!56609 () Bool)

(declare-fun call!56616 () Unit!38334)

(declare-fun call!56613 () Unit!38334)

(assert (=> bm!56609 (= call!56616 call!56613)))

(declare-fun bm!56610 () Bool)

(declare-fun lt!523170 () ListLongMap!16597)

(declare-fun c!116160 () Bool)

(declare-fun lt!523182 () ListLongMap!16597)

(declare-fun addStillContains!959 (ListLongMap!16597 (_ BitVec 64) V!43953 (_ BitVec 64)) Unit!38334)

(assert (=> bm!56610 (= call!56613 (addStillContains!959 (ite c!116164 lt!523170 lt!523182) (ite c!116164 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116160 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116164 minValue!944 (ite c!116160 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1162115 () Bool)

(declare-fun e!660803 () Bool)

(assert (=> b!1162115 (= e!660803 true)))

(declare-fun e!660819 () Bool)

(assert (=> b!1162115 e!660819))

(declare-fun res!770932 () Bool)

(assert (=> b!1162115 (=> (not res!770932) (not e!660819))))

(declare-fun lt!523173 () ListLongMap!16597)

(assert (=> b!1162115 (= res!770932 (= lt!523173 lt!523182))))

(declare-fun -!1420 (ListLongMap!16597 (_ BitVec 64)) ListLongMap!16597)

(assert (=> b!1162115 (= lt!523173 (-!1420 lt!523176 k!934))))

(declare-fun lt!523174 () V!43953)

(declare-fun +!3718 (ListLongMap!16597 tuple2!18628) ListLongMap!16597)

(assert (=> b!1162115 (= (-!1420 (+!3718 lt!523182 (tuple2!18629 (select (arr!36189 _keys!1208) from!1455) lt!523174)) (select (arr!36189 _keys!1208) from!1455)) lt!523182)))

(declare-fun lt!523177 () Unit!38334)

(declare-fun addThenRemoveForNewKeyIsSame!254 (ListLongMap!16597 (_ BitVec 64) V!43953) Unit!38334)

(assert (=> b!1162115 (= lt!523177 (addThenRemoveForNewKeyIsSame!254 lt!523182 (select (arr!36189 _keys!1208) from!1455) lt!523174))))

(declare-fun get!18464 (ValueCell!13850 V!43953) V!43953)

(assert (=> b!1162115 (= lt!523174 (get!18464 (select (arr!36190 _values!996) from!1455) lt!523187))))

(declare-fun lt!523184 () Unit!38334)

(assert (=> b!1162115 (= lt!523184 e!660818)))

(declare-fun c!116163 () Bool)

(declare-fun contains!6819 (ListLongMap!16597 (_ BitVec 64)) Bool)

(assert (=> b!1162115 (= c!116163 (contains!6819 lt!523182 k!934))))

(assert (=> b!1162115 (= lt!523182 (getCurrentListMapNoExtraKeys!4778 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45503 () Bool)

(assert (=> mapIsEmpty!45503 mapRes!45503))

(declare-fun b!1162116 () Bool)

(declare-fun Unit!38337 () Unit!38334)

(assert (=> b!1162116 (= e!660818 Unit!38337)))

(declare-fun b!1162117 () Bool)

(assert (=> b!1162117 (contains!6819 (+!3718 lt!523170 (tuple2!18629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!523191 () Unit!38334)

(assert (=> b!1162117 (= lt!523191 call!56613)))

(assert (=> b!1162117 call!56612))

(declare-fun call!56615 () ListLongMap!16597)

(assert (=> b!1162117 (= lt!523170 call!56615)))

(declare-fun lt!523179 () Unit!38334)

(assert (=> b!1162117 (= lt!523179 (addStillContains!959 lt!523182 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1162117 (= e!660804 lt!523191)))

(declare-fun call!56611 () ListLongMap!16597)

(declare-fun b!1162118 () Bool)

(declare-fun e!660811 () Bool)

(assert (=> b!1162118 (= e!660811 (= call!56611 (-!1420 call!56617 k!934)))))

(declare-fun bm!56611 () Bool)

(assert (=> bm!56611 (= call!56611 (getCurrentListMapNoExtraKeys!4778 lt!523180 lt!523188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162119 () Bool)

(assert (=> b!1162119 (= e!660819 (= lt!523173 (getCurrentListMapNoExtraKeys!4778 lt!523180 lt!523188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1162120 () Bool)

(declare-fun Unit!38338 () Unit!38334)

(assert (=> b!1162120 (= e!660810 Unit!38338)))

(declare-fun b!1162121 () Bool)

(assert (=> b!1162121 (= e!660811 (= call!56611 call!56617))))

(declare-fun b!1162122 () Bool)

(declare-fun res!770921 () Bool)

(assert (=> b!1162122 (=> (not res!770921) (not e!660808))))

(assert (=> b!1162122 (= res!770921 (arrayNoDuplicates!0 lt!523180 #b00000000000000000000000000000000 Nil!25360))))

(declare-fun b!1162123 () Bool)

(assert (=> b!1162123 (= c!116160 (and (not lt!523171) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1162123 (= e!660804 e!660809)))

(declare-fun b!1162124 () Bool)

(assert (=> b!1162124 (= e!660814 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523171) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162125 () Bool)

(assert (=> b!1162125 (= e!660815 (and e!660806 mapRes!45503))))

(declare-fun condMapEmpty!45503 () Bool)

(declare-fun mapDefault!45503 () ValueCell!13850)

