; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98546 () Bool)

(assert start!98546)

(declare-fun b_free!24151 () Bool)

(declare-fun b_next!24151 () Bool)

(assert (=> start!98546 (= b_free!24151 (not b_next!24151))))

(declare-fun tp!85164 () Bool)

(declare-fun b_and!39151 () Bool)

(assert (=> start!98546 (= tp!85164 b_and!39151)))

(declare-fun b!1142028 () Bool)

(declare-datatypes ((array!74215 0))(
  ( (array!74216 (arr!35758 (Array (_ BitVec 32) (_ BitVec 64))) (size!36294 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74215)

(declare-fun e!649714 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142028 (= e!649714 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44846 () Bool)

(declare-fun mapRes!44846 () Bool)

(declare-fun tp!85163 () Bool)

(declare-fun e!649715 () Bool)

(assert (=> mapNonEmpty!44846 (= mapRes!44846 (and tp!85163 e!649715))))

(declare-datatypes ((V!43369 0))(
  ( (V!43370 (val!14397 Int)) )
))
(declare-datatypes ((ValueCell!13631 0))(
  ( (ValueCellFull!13631 (v!17034 V!43369)) (EmptyCell!13631) )
))
(declare-fun mapRest!44846 () (Array (_ BitVec 32) ValueCell!13631))

(declare-fun mapKey!44846 () (_ BitVec 32))

(declare-datatypes ((array!74217 0))(
  ( (array!74218 (arr!35759 (Array (_ BitVec 32) ValueCell!13631)) (size!36295 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74217)

(declare-fun mapValue!44846 () ValueCell!13631)

(assert (=> mapNonEmpty!44846 (= (arr!35759 _values!996) (store mapRest!44846 mapKey!44846 mapValue!44846))))

(declare-fun bm!51351 () Bool)

(declare-fun call!51358 () Bool)

(declare-fun call!51359 () Bool)

(assert (=> bm!51351 (= call!51358 call!51359)))

(declare-fun b!1142029 () Bool)

(declare-fun e!649704 () Bool)

(declare-datatypes ((tuple2!18214 0))(
  ( (tuple2!18215 (_1!9118 (_ BitVec 64)) (_2!9118 V!43369)) )
))
(declare-datatypes ((List!24969 0))(
  ( (Nil!24966) (Cons!24965 (h!26174 tuple2!18214) (t!36112 List!24969)) )
))
(declare-datatypes ((ListLongMap!16183 0))(
  ( (ListLongMap!16184 (toList!8107 List!24969)) )
))
(declare-fun call!51361 () ListLongMap!16183)

(declare-fun call!51356 () ListLongMap!16183)

(assert (=> b!1142029 (= e!649704 (= call!51361 call!51356))))

(declare-fun zeroValue!944 () V!43369)

(declare-fun lt!508961 () ListLongMap!16183)

(declare-fun c!112222 () Bool)

(declare-fun call!51357 () ListLongMap!16183)

(declare-fun c!112220 () Bool)

(declare-fun lt!508950 () ListLongMap!16183)

(declare-fun minValue!944 () V!43369)

(declare-fun bm!51352 () Bool)

(declare-fun +!3538 (ListLongMap!16183 tuple2!18214) ListLongMap!16183)

(assert (=> bm!51352 (= call!51357 (+!3538 (ite c!112222 lt!508961 lt!508950) (ite c!112222 (tuple2!18215 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112220 (tuple2!18215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18215 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1142030 () Bool)

(declare-fun res!761138 () Bool)

(declare-fun e!649717 () Bool)

(assert (=> b!1142030 (=> (not res!761138) (not e!649717))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142030 (= res!761138 (validMask!0 mask!1564))))

(declare-fun b!1142031 () Bool)

(declare-fun tp_is_empty!28681 () Bool)

(assert (=> b!1142031 (= e!649715 tp_is_empty!28681)))

(declare-fun b!1142032 () Bool)

(declare-fun res!761135 () Bool)

(assert (=> b!1142032 (=> (not res!761135) (not e!649717))))

(declare-datatypes ((List!24970 0))(
  ( (Nil!24967) (Cons!24966 (h!26175 (_ BitVec 64)) (t!36113 List!24970)) )
))
(declare-fun arrayNoDuplicates!0 (array!74215 (_ BitVec 32) List!24970) Bool)

(assert (=> b!1142032 (= res!761135 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24967))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1142033 () Bool)

(declare-fun lt!508948 () Bool)

(assert (=> b!1142033 (= e!649714 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508948) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142034 () Bool)

(declare-fun res!761143 () Bool)

(assert (=> b!1142034 (=> (not res!761143) (not e!649717))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142034 (= res!761143 (= (select (arr!35758 _keys!1208) i!673) k!934))))

(declare-fun b!1142035 () Bool)

(assert (=> b!1142035 (= c!112220 (and (not lt!508948) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37461 0))(
  ( (Unit!37462) )
))
(declare-fun e!649706 () Unit!37461)

(declare-fun e!649708 () Unit!37461)

(assert (=> b!1142035 (= e!649706 e!649708)))

(declare-fun bm!51353 () Bool)

(declare-fun call!51354 () ListLongMap!16183)

(declare-fun contains!6642 (ListLongMap!16183 (_ BitVec 64)) Bool)

(assert (=> bm!51353 (= call!51359 (contains!6642 (ite c!112222 lt!508961 call!51354) k!934))))

(declare-fun b!1142036 () Bool)

(declare-fun lt!508967 () Unit!37461)

(assert (=> b!1142036 (= e!649708 lt!508967)))

(declare-fun call!51355 () Unit!37461)

(assert (=> b!1142036 (= lt!508967 call!51355)))

(assert (=> b!1142036 call!51358))

(declare-fun b!1142037 () Bool)

(declare-fun res!761146 () Bool)

(assert (=> b!1142037 (=> (not res!761146) (not e!649717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74215 (_ BitVec 32)) Bool)

(assert (=> b!1142037 (= res!761146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!51360 () Unit!37461)

(declare-fun bm!51354 () Bool)

(declare-fun addStillContains!795 (ListLongMap!16183 (_ BitVec 64) V!43369 (_ BitVec 64)) Unit!37461)

(assert (=> bm!51354 (= call!51360 (addStillContains!795 (ite c!112222 lt!508961 lt!508950) (ite c!112222 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112220 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112222 minValue!944 (ite c!112220 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1142038 () Bool)

(declare-fun -!1257 (ListLongMap!16183 (_ BitVec 64)) ListLongMap!16183)

(assert (=> b!1142038 (= e!649704 (= call!51361 (-!1257 call!51356 k!934)))))

(declare-fun bm!51355 () Bool)

(assert (=> bm!51355 (= call!51354 call!51357)))

(declare-fun b!1142039 () Bool)

(declare-fun e!649707 () Bool)

(assert (=> b!1142039 (= e!649707 true)))

(declare-fun lt!508968 () V!43369)

(assert (=> b!1142039 (= (-!1257 (+!3538 lt!508950 (tuple2!18215 (select (arr!35758 _keys!1208) from!1455) lt!508968)) (select (arr!35758 _keys!1208) from!1455)) lt!508950)))

(declare-fun lt!508958 () Unit!37461)

(declare-fun addThenRemoveForNewKeyIsSame!110 (ListLongMap!16183 (_ BitVec 64) V!43369) Unit!37461)

(assert (=> b!1142039 (= lt!508958 (addThenRemoveForNewKeyIsSame!110 lt!508950 (select (arr!35758 _keys!1208) from!1455) lt!508968))))

(declare-fun lt!508962 () V!43369)

(declare-fun get!18174 (ValueCell!13631 V!43369) V!43369)

(assert (=> b!1142039 (= lt!508968 (get!18174 (select (arr!35759 _values!996) from!1455) lt!508962))))

(declare-fun lt!508953 () Unit!37461)

(declare-fun e!649716 () Unit!37461)

(assert (=> b!1142039 (= lt!508953 e!649716)))

(declare-fun c!112218 () Bool)

(assert (=> b!1142039 (= c!112218 (contains!6642 lt!508950 k!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4589 (array!74215 array!74217 (_ BitVec 32) (_ BitVec 32) V!43369 V!43369 (_ BitVec 32) Int) ListLongMap!16183)

(assert (=> b!1142039 (= lt!508950 (getCurrentListMapNoExtraKeys!4589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142040 () Bool)

(declare-fun e!649711 () Unit!37461)

(assert (=> b!1142040 (= e!649708 e!649711)))

(declare-fun c!112221 () Bool)

(assert (=> b!1142040 (= c!112221 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508948))))

(declare-fun lt!508960 () array!74217)

(declare-fun bm!51356 () Bool)

(declare-fun lt!508966 () array!74215)

(assert (=> bm!51356 (= call!51361 (getCurrentListMapNoExtraKeys!4589 lt!508966 lt!508960 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142041 () Bool)

(declare-fun e!649718 () Bool)

(declare-fun e!649710 () Bool)

(assert (=> b!1142041 (= e!649718 e!649710)))

(declare-fun res!761137 () Bool)

(assert (=> b!1142041 (=> res!761137 e!649710)))

(assert (=> b!1142041 (= res!761137 (not (= from!1455 i!673)))))

(declare-fun lt!508964 () ListLongMap!16183)

(assert (=> b!1142041 (= lt!508964 (getCurrentListMapNoExtraKeys!4589 lt!508966 lt!508960 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142041 (= lt!508960 (array!74218 (store (arr!35759 _values!996) i!673 (ValueCellFull!13631 lt!508962)) (size!36295 _values!996)))))

(declare-fun dynLambda!2631 (Int (_ BitVec 64)) V!43369)

(assert (=> b!1142041 (= lt!508962 (dynLambda!2631 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508963 () ListLongMap!16183)

(assert (=> b!1142041 (= lt!508963 (getCurrentListMapNoExtraKeys!4589 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1142042 () Bool)

(declare-fun e!649709 () Bool)

(assert (=> b!1142042 (= e!649717 e!649709)))

(declare-fun res!761136 () Bool)

(assert (=> b!1142042 (=> (not res!761136) (not e!649709))))

(assert (=> b!1142042 (= res!761136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508966 mask!1564))))

(assert (=> b!1142042 (= lt!508966 (array!74216 (store (arr!35758 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36294 _keys!1208)))))

(declare-fun b!1142043 () Bool)

(declare-fun res!761147 () Bool)

(assert (=> b!1142043 (=> (not res!761147) (not e!649717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142043 (= res!761147 (validKeyInArray!0 k!934))))

(declare-fun b!1142044 () Bool)

(declare-fun e!649712 () Bool)

(assert (=> b!1142044 (= e!649712 tp_is_empty!28681)))

(declare-fun b!1142045 () Bool)

(assert (=> b!1142045 call!51358))

(declare-fun lt!508959 () Unit!37461)

(assert (=> b!1142045 (= lt!508959 call!51355)))

(assert (=> b!1142045 (= e!649711 lt!508959)))

(declare-fun b!1142046 () Bool)

(assert (=> b!1142046 (contains!6642 call!51357 k!934)))

(declare-fun lt!508957 () Unit!37461)

(assert (=> b!1142046 (= lt!508957 call!51360)))

(assert (=> b!1142046 call!51359))

(assert (=> b!1142046 (= lt!508961 (+!3538 lt!508950 (tuple2!18215 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508952 () Unit!37461)

(assert (=> b!1142046 (= lt!508952 (addStillContains!795 lt!508950 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1142046 (= e!649706 lt!508957)))

(declare-fun b!1142047 () Bool)

(declare-fun e!649713 () Bool)

(assert (=> b!1142047 (= e!649713 (and e!649712 mapRes!44846))))

(declare-fun condMapEmpty!44846 () Bool)

(declare-fun mapDefault!44846 () ValueCell!13631)

