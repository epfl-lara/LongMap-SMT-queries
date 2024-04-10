; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100908 () Bool)

(assert start!100908)

(declare-fun b_free!25977 () Bool)

(declare-fun b_next!25977 () Bool)

(assert (=> start!100908 (= b_free!25977 (not b_next!25977))))

(declare-fun tp!90941 () Bool)

(declare-fun b_and!42995 () Bool)

(assert (=> start!100908 (= tp!90941 b_and!42995)))

(declare-datatypes ((V!46035 0))(
  ( (V!46036 (val!15397 Int)) )
))
(declare-fun zeroValue!944 () V!46035)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!78143 0))(
  ( (array!78144 (arr!37710 (Array (_ BitVec 32) (_ BitVec 64))) (size!38246 (_ BitVec 32))) )
))
(declare-fun lt!548344 () array!78143)

(declare-fun defaultEntry!1004 () Int)

(declare-fun c!118855 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59119 () Bool)

(declare-datatypes ((ValueCell!14631 0))(
  ( (ValueCellFull!14631 (v!18045 V!46035)) (EmptyCell!14631) )
))
(declare-datatypes ((array!78145 0))(
  ( (array!78146 (arr!37711 (Array (_ BitVec 32) ValueCell!14631)) (size!38247 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78145)

(declare-fun minValue!944 () V!46035)

(declare-fun lt!548352 () array!78145)

(declare-fun _keys!1208 () array!78143)

(declare-datatypes ((tuple2!19762 0))(
  ( (tuple2!19763 (_1!9892 (_ BitVec 64)) (_2!9892 V!46035)) )
))
(declare-datatypes ((List!26563 0))(
  ( (Nil!26560) (Cons!26559 (h!27768 tuple2!19762) (t!39520 List!26563)) )
))
(declare-datatypes ((ListLongMap!17731 0))(
  ( (ListLongMap!17732 (toList!8881 List!26563)) )
))
(declare-fun call!59128 () ListLongMap!17731)

(declare-fun getCurrentListMapNoExtraKeys!5315 (array!78143 array!78145 (_ BitVec 32) (_ BitVec 32) V!46035 V!46035 (_ BitVec 32) Int) ListLongMap!17731)

(assert (=> bm!59119 (= call!59128 (getCurrentListMapNoExtraKeys!5315 (ite c!118855 _keys!1208 lt!548344) (ite c!118855 _values!996 lt!548352) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208288 () Bool)

(declare-fun e!686208 () Bool)

(declare-fun e!686212 () Bool)

(assert (=> b!1208288 (= e!686208 e!686212)))

(declare-fun res!803212 () Bool)

(assert (=> b!1208288 (=> res!803212 e!686212)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1208288 (= res!803212 (not (= (select (arr!37710 _keys!1208) from!1455) k0!934)))))

(declare-fun e!686221 () Bool)

(assert (=> b!1208288 e!686221))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208288 (= c!118855 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!40054 0))(
  ( (Unit!40055) )
))
(declare-fun lt!548353 () Unit!40054)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1043 (array!78143 array!78145 (_ BitVec 32) (_ BitVec 32) V!46035 V!46035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40054)

(assert (=> b!1208288 (= lt!548353 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208289 () Bool)

(declare-fun e!686215 () Unit!40054)

(declare-fun Unit!40056 () Unit!40054)

(assert (=> b!1208289 (= e!686215 Unit!40056)))

(declare-fun b!1208291 () Bool)

(declare-fun e!686207 () Bool)

(declare-fun e!686211 () Bool)

(assert (=> b!1208291 (= e!686207 (not e!686211))))

(declare-fun res!803204 () Bool)

(assert (=> b!1208291 (=> res!803204 e!686211)))

(assert (=> b!1208291 (= res!803204 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208291 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548347 () Unit!40054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78143 (_ BitVec 64) (_ BitVec 32)) Unit!40054)

(assert (=> b!1208291 (= lt!548347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1208292 () Bool)

(assert (=> b!1208292 (= e!686211 e!686208)))

(declare-fun res!803213 () Bool)

(assert (=> b!1208292 (=> res!803213 e!686208)))

(assert (=> b!1208292 (= res!803213 (not (= from!1455 i!673)))))

(declare-fun lt!548341 () ListLongMap!17731)

(assert (=> b!1208292 (= lt!548341 (getCurrentListMapNoExtraKeys!5315 lt!548344 lt!548352 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3216 (Int (_ BitVec 64)) V!46035)

(assert (=> b!1208292 (= lt!548352 (array!78146 (store (arr!37711 _values!996) i!673 (ValueCellFull!14631 (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38247 _values!996)))))

(declare-fun lt!548354 () ListLongMap!17731)

(assert (=> b!1208292 (= lt!548354 (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1208293 () Bool)

(declare-fun c!118857 () Bool)

(declare-fun lt!548350 () Bool)

(assert (=> b!1208293 (= c!118857 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548350))))

(declare-fun e!686219 () Unit!40054)

(assert (=> b!1208293 (= e!686219 e!686215)))

(declare-fun bm!59120 () Bool)

(declare-fun call!59125 () Unit!40054)

(declare-fun call!59129 () Unit!40054)

(assert (=> bm!59120 (= call!59125 call!59129)))

(declare-fun lt!548348 () ListLongMap!17731)

(declare-fun lt!548342 () ListLongMap!17731)

(declare-fun c!118853 () Bool)

(declare-fun bm!59121 () Bool)

(declare-fun c!118854 () Bool)

(declare-fun addStillContains!1029 (ListLongMap!17731 (_ BitVec 64) V!46035 (_ BitVec 64)) Unit!40054)

(assert (=> bm!59121 (= call!59129 (addStillContains!1029 (ite c!118853 lt!548348 lt!548342) (ite c!118853 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118854 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118853 minValue!944 (ite c!118854 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1208294 () Bool)

(declare-fun e!686214 () Bool)

(assert (=> b!1208294 (= e!686214 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208295 () Bool)

(declare-fun e!686213 () Bool)

(assert (=> b!1208295 (= e!686213 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548350) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1208296 () Bool)

(declare-fun e!686210 () Bool)

(declare-fun e!686217 () Bool)

(assert (=> b!1208296 (= e!686210 e!686217)))

(declare-fun res!803200 () Bool)

(assert (=> b!1208296 (=> res!803200 e!686217)))

(assert (=> b!1208296 (= res!803200 (or (bvsge (size!38246 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _keys!1208)) (bvsge from!1455 (size!38246 _keys!1208))))))

(declare-datatypes ((List!26564 0))(
  ( (Nil!26561) (Cons!26560 (h!27769 (_ BitVec 64)) (t!39521 List!26564)) )
))
(declare-fun arrayNoDuplicates!0 (array!78143 (_ BitVec 32) List!26564) Bool)

(assert (=> b!1208296 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26561)))

(declare-fun lt!548349 () Unit!40054)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78143 (_ BitVec 32) (_ BitVec 32)) Unit!40054)

(assert (=> b!1208296 (= lt!548349 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1208296 e!686214))

(declare-fun res!803211 () Bool)

(assert (=> b!1208296 (=> (not res!803211) (not e!686214))))

(assert (=> b!1208296 (= res!803211 e!686213)))

(declare-fun c!118856 () Bool)

(assert (=> b!1208296 (= c!118856 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548355 () Unit!40054)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!583 (array!78143 array!78145 (_ BitVec 32) (_ BitVec 32) V!46035 V!46035 (_ BitVec 64) (_ BitVec 32) Int) Unit!40054)

(assert (=> b!1208296 (= lt!548355 (lemmaListMapContainsThenArrayContainsFrom!583 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548340 () Unit!40054)

(declare-fun e!686218 () Unit!40054)

(assert (=> b!1208296 (= lt!548340 e!686218)))

(assert (=> b!1208296 (= c!118853 (and (not lt!548350) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208296 (= lt!548350 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!59123 () ListLongMap!17731)

(declare-fun bm!59122 () Bool)

(declare-fun call!59126 () Bool)

(declare-fun contains!6941 (ListLongMap!17731 (_ BitVec 64)) Bool)

(assert (=> bm!59122 (= call!59126 (contains!6941 (ite c!118853 lt!548348 call!59123) k0!934))))

(declare-fun b!1208297 () Bool)

(declare-fun res!803207 () Bool)

(declare-fun e!686206 () Bool)

(assert (=> b!1208297 (=> (not res!803207) (not e!686206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78143 (_ BitVec 32)) Bool)

(assert (=> b!1208297 (= res!803207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208298 () Bool)

(declare-fun res!803210 () Bool)

(assert (=> b!1208298 (=> (not res!803210) (not e!686206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208298 (= res!803210 (validKeyInArray!0 k0!934))))

(declare-fun b!1208299 () Bool)

(declare-fun lt!548343 () Unit!40054)

(assert (=> b!1208299 (= e!686215 lt!548343)))

(assert (=> b!1208299 (= lt!548343 call!59125)))

(declare-fun call!59122 () Bool)

(assert (=> b!1208299 call!59122))

(declare-fun bm!59123 () Bool)

(declare-fun call!59124 () ListLongMap!17731)

(assert (=> bm!59123 (= call!59123 call!59124)))

(declare-fun b!1208300 () Bool)

(declare-fun res!803205 () Bool)

(assert (=> b!1208300 (=> (not res!803205) (not e!686206))))

(assert (=> b!1208300 (= res!803205 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26561))))

(declare-fun call!59127 () ListLongMap!17731)

(declare-fun b!1208301 () Bool)

(declare-fun -!1835 (ListLongMap!17731 (_ BitVec 64)) ListLongMap!17731)

(assert (=> b!1208301 (= e!686221 (= call!59127 (-!1835 call!59128 k0!934)))))

(declare-fun res!803206 () Bool)

(assert (=> start!100908 (=> (not res!803206) (not e!686206))))

(assert (=> start!100908 (= res!803206 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38246 _keys!1208))))))

(assert (=> start!100908 e!686206))

(declare-fun tp_is_empty!30681 () Bool)

(assert (=> start!100908 tp_is_empty!30681))

(declare-fun array_inv!28724 (array!78143) Bool)

(assert (=> start!100908 (array_inv!28724 _keys!1208)))

(assert (=> start!100908 true))

(assert (=> start!100908 tp!90941))

(declare-fun e!686220 () Bool)

(declare-fun array_inv!28725 (array!78145) Bool)

(assert (=> start!100908 (and (array_inv!28725 _values!996) e!686220)))

(declare-fun b!1208290 () Bool)

(declare-fun res!803202 () Bool)

(assert (=> b!1208290 (=> (not res!803202) (not e!686206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208290 (= res!803202 (validMask!0 mask!1564))))

(declare-fun bm!59124 () Bool)

(assert (=> bm!59124 (= call!59122 call!59126)))

(declare-fun b!1208302 () Bool)

(assert (=> b!1208302 call!59122))

(declare-fun lt!548351 () Unit!40054)

(assert (=> b!1208302 (= lt!548351 call!59125)))

(assert (=> b!1208302 (= e!686219 lt!548351)))

(declare-fun mapIsEmpty!47884 () Bool)

(declare-fun mapRes!47884 () Bool)

(assert (=> mapIsEmpty!47884 mapRes!47884))

(declare-fun b!1208303 () Bool)

(declare-fun e!686209 () Bool)

(assert (=> b!1208303 (= e!686209 tp_is_empty!30681)))

(declare-fun b!1208304 () Bool)

(assert (=> b!1208304 (= e!686221 (= call!59128 call!59127))))

(declare-fun b!1208305 () Bool)

(declare-fun e!686216 () Bool)

(assert (=> b!1208305 (= e!686220 (and e!686216 mapRes!47884))))

(declare-fun condMapEmpty!47884 () Bool)

(declare-fun mapDefault!47884 () ValueCell!14631)

(assert (=> b!1208305 (= condMapEmpty!47884 (= (arr!37711 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14631)) mapDefault!47884)))))

(declare-fun b!1208306 () Bool)

(declare-fun res!803201 () Bool)

(assert (=> b!1208306 (=> (not res!803201) (not e!686207))))

(assert (=> b!1208306 (= res!803201 (arrayNoDuplicates!0 lt!548344 #b00000000000000000000000000000000 Nil!26561))))

(declare-fun b!1208307 () Bool)

(declare-fun noDuplicate!1624 (List!26564) Bool)

(assert (=> b!1208307 (= e!686217 (noDuplicate!1624 Nil!26561))))

(declare-fun b!1208308 () Bool)

(declare-fun res!803203 () Bool)

(assert (=> b!1208308 (=> (not res!803203) (not e!686206))))

(assert (=> b!1208308 (= res!803203 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38246 _keys!1208))))))

(declare-fun b!1208309 () Bool)

(assert (=> b!1208309 (= e!686212 e!686210)))

(declare-fun res!803208 () Bool)

(assert (=> b!1208309 (=> res!803208 e!686210)))

(assert (=> b!1208309 (= res!803208 (not (contains!6941 lt!548342 k0!934)))))

(assert (=> b!1208309 (= lt!548342 (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59125 () Bool)

(assert (=> bm!59125 (= call!59127 (getCurrentListMapNoExtraKeys!5315 (ite c!118855 lt!548344 _keys!1208) (ite c!118855 lt!548352 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208310 () Bool)

(declare-fun res!803199 () Bool)

(assert (=> b!1208310 (=> (not res!803199) (not e!686206))))

(assert (=> b!1208310 (= res!803199 (and (= (size!38247 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38246 _keys!1208) (size!38247 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47884 () Bool)

(declare-fun tp!90940 () Bool)

(assert (=> mapNonEmpty!47884 (= mapRes!47884 (and tp!90940 e!686209))))

(declare-fun mapRest!47884 () (Array (_ BitVec 32) ValueCell!14631))

(declare-fun mapKey!47884 () (_ BitVec 32))

(declare-fun mapValue!47884 () ValueCell!14631)

(assert (=> mapNonEmpty!47884 (= (arr!37711 _values!996) (store mapRest!47884 mapKey!47884 mapValue!47884))))

(declare-fun b!1208311 () Bool)

(declare-fun res!803198 () Bool)

(assert (=> b!1208311 (=> (not res!803198) (not e!686206))))

(assert (=> b!1208311 (= res!803198 (= (select (arr!37710 _keys!1208) i!673) k0!934))))

(declare-fun b!1208312 () Bool)

(assert (=> b!1208312 (= e!686216 tp_is_empty!30681)))

(declare-fun bm!59126 () Bool)

(declare-fun +!4000 (ListLongMap!17731 tuple2!19762) ListLongMap!17731)

(assert (=> bm!59126 (= call!59124 (+!4000 lt!548342 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1208313 () Bool)

(assert (=> b!1208313 (= e!686213 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208314 () Bool)

(assert (=> b!1208314 (= e!686206 e!686207)))

(declare-fun res!803209 () Bool)

(assert (=> b!1208314 (=> (not res!803209) (not e!686207))))

(assert (=> b!1208314 (= res!803209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548344 mask!1564))))

(assert (=> b!1208314 (= lt!548344 (array!78144 (store (arr!37710 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38246 _keys!1208)))))

(declare-fun b!1208315 () Bool)

(declare-fun lt!548346 () Unit!40054)

(assert (=> b!1208315 (= e!686218 lt!548346)))

(declare-fun lt!548345 () Unit!40054)

(assert (=> b!1208315 (= lt!548345 (addStillContains!1029 lt!548342 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1208315 (= lt!548348 call!59124)))

(assert (=> b!1208315 call!59126))

(assert (=> b!1208315 (= lt!548346 call!59129)))

(assert (=> b!1208315 (contains!6941 (+!4000 lt!548348 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1208316 () Bool)

(assert (=> b!1208316 (= e!686218 e!686219)))

(assert (=> b!1208316 (= c!118854 (and (not lt!548350) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!100908 res!803206) b!1208290))

(assert (= (and b!1208290 res!803202) b!1208310))

(assert (= (and b!1208310 res!803199) b!1208297))

(assert (= (and b!1208297 res!803207) b!1208300))

(assert (= (and b!1208300 res!803205) b!1208308))

(assert (= (and b!1208308 res!803203) b!1208298))

(assert (= (and b!1208298 res!803210) b!1208311))

(assert (= (and b!1208311 res!803198) b!1208314))

(assert (= (and b!1208314 res!803209) b!1208306))

(assert (= (and b!1208306 res!803201) b!1208291))

(assert (= (and b!1208291 (not res!803204)) b!1208292))

(assert (= (and b!1208292 (not res!803213)) b!1208288))

(assert (= (and b!1208288 c!118855) b!1208301))

(assert (= (and b!1208288 (not c!118855)) b!1208304))

(assert (= (or b!1208301 b!1208304) bm!59119))

(assert (= (or b!1208301 b!1208304) bm!59125))

(assert (= (and b!1208288 (not res!803212)) b!1208309))

(assert (= (and b!1208309 (not res!803208)) b!1208296))

(assert (= (and b!1208296 c!118853) b!1208315))

(assert (= (and b!1208296 (not c!118853)) b!1208316))

(assert (= (and b!1208316 c!118854) b!1208302))

(assert (= (and b!1208316 (not c!118854)) b!1208293))

(assert (= (and b!1208293 c!118857) b!1208299))

(assert (= (and b!1208293 (not c!118857)) b!1208289))

(assert (= (or b!1208302 b!1208299) bm!59120))

(assert (= (or b!1208302 b!1208299) bm!59123))

(assert (= (or b!1208302 b!1208299) bm!59124))

(assert (= (or b!1208315 bm!59124) bm!59122))

(assert (= (or b!1208315 bm!59120) bm!59121))

(assert (= (or b!1208315 bm!59123) bm!59126))

(assert (= (and b!1208296 c!118856) b!1208313))

(assert (= (and b!1208296 (not c!118856)) b!1208295))

(assert (= (and b!1208296 res!803211) b!1208294))

(assert (= (and b!1208296 (not res!803200)) b!1208307))

(assert (= (and b!1208305 condMapEmpty!47884) mapIsEmpty!47884))

(assert (= (and b!1208305 (not condMapEmpty!47884)) mapNonEmpty!47884))

(get-info :version)

(assert (= (and mapNonEmpty!47884 ((_ is ValueCellFull!14631) mapValue!47884)) b!1208303))

(assert (= (and b!1208305 ((_ is ValueCellFull!14631) mapDefault!47884)) b!1208312))

(assert (= start!100908 b!1208305))

(declare-fun b_lambda!21493 () Bool)

(assert (=> (not b_lambda!21493) (not b!1208292)))

(declare-fun t!39519 () Bool)

(declare-fun tb!10777 () Bool)

(assert (=> (and start!100908 (= defaultEntry!1004 defaultEntry!1004) t!39519) tb!10777))

(declare-fun result!22143 () Bool)

(assert (=> tb!10777 (= result!22143 tp_is_empty!30681)))

(assert (=> b!1208292 t!39519))

(declare-fun b_and!42997 () Bool)

(assert (= b_and!42995 (and (=> t!39519 result!22143) b_and!42997)))

(declare-fun m!1114071 () Bool)

(assert (=> b!1208309 m!1114071))

(declare-fun m!1114073 () Bool)

(assert (=> b!1208309 m!1114073))

(declare-fun m!1114075 () Bool)

(assert (=> mapNonEmpty!47884 m!1114075))

(declare-fun m!1114077 () Bool)

(assert (=> b!1208291 m!1114077))

(declare-fun m!1114079 () Bool)

(assert (=> b!1208291 m!1114079))

(declare-fun m!1114081 () Bool)

(assert (=> start!100908 m!1114081))

(declare-fun m!1114083 () Bool)

(assert (=> start!100908 m!1114083))

(declare-fun m!1114085 () Bool)

(assert (=> b!1208288 m!1114085))

(declare-fun m!1114087 () Bool)

(assert (=> b!1208288 m!1114087))

(declare-fun m!1114089 () Bool)

(assert (=> b!1208296 m!1114089))

(declare-fun m!1114091 () Bool)

(assert (=> b!1208296 m!1114091))

(declare-fun m!1114093 () Bool)

(assert (=> b!1208296 m!1114093))

(declare-fun m!1114095 () Bool)

(assert (=> b!1208297 m!1114095))

(declare-fun m!1114097 () Bool)

(assert (=> b!1208300 m!1114097))

(declare-fun m!1114099 () Bool)

(assert (=> b!1208311 m!1114099))

(declare-fun m!1114101 () Bool)

(assert (=> bm!59125 m!1114101))

(declare-fun m!1114103 () Bool)

(assert (=> bm!59119 m!1114103))

(declare-fun m!1114105 () Bool)

(assert (=> b!1208294 m!1114105))

(declare-fun m!1114107 () Bool)

(assert (=> b!1208298 m!1114107))

(declare-fun m!1114109 () Bool)

(assert (=> bm!59121 m!1114109))

(declare-fun m!1114111 () Bool)

(assert (=> b!1208315 m!1114111))

(declare-fun m!1114113 () Bool)

(assert (=> b!1208315 m!1114113))

(assert (=> b!1208315 m!1114113))

(declare-fun m!1114115 () Bool)

(assert (=> b!1208315 m!1114115))

(declare-fun m!1114117 () Bool)

(assert (=> b!1208292 m!1114117))

(declare-fun m!1114119 () Bool)

(assert (=> b!1208292 m!1114119))

(declare-fun m!1114121 () Bool)

(assert (=> b!1208292 m!1114121))

(declare-fun m!1114123 () Bool)

(assert (=> b!1208292 m!1114123))

(declare-fun m!1114125 () Bool)

(assert (=> b!1208301 m!1114125))

(declare-fun m!1114127 () Bool)

(assert (=> b!1208290 m!1114127))

(declare-fun m!1114129 () Bool)

(assert (=> bm!59126 m!1114129))

(declare-fun m!1114131 () Bool)

(assert (=> b!1208306 m!1114131))

(assert (=> b!1208313 m!1114105))

(declare-fun m!1114133 () Bool)

(assert (=> bm!59122 m!1114133))

(declare-fun m!1114135 () Bool)

(assert (=> b!1208314 m!1114135))

(declare-fun m!1114137 () Bool)

(assert (=> b!1208314 m!1114137))

(declare-fun m!1114139 () Bool)

(assert (=> b!1208307 m!1114139))

(check-sat (not b!1208290) (not bm!59122) (not b!1208292) (not b_lambda!21493) (not b!1208306) (not bm!59126) (not b!1208296) (not b_next!25977) (not b!1208297) (not mapNonEmpty!47884) (not bm!59121) (not b!1208288) (not b!1208315) (not b!1208301) (not b!1208300) (not b!1208314) (not b!1208291) (not bm!59119) (not bm!59125) (not b!1208309) (not b!1208313) (not b!1208294) (not start!100908) (not b!1208298) (not b!1208307) b_and!42997 tp_is_empty!30681)
(check-sat b_and!42997 (not b_next!25977))
(get-model)

(declare-fun b_lambda!21497 () Bool)

(assert (= b_lambda!21493 (or (and start!100908 b_free!25977) b_lambda!21497)))

(check-sat (not b!1208290) (not bm!59122) (not b!1208292) (not b!1208306) (not bm!59126) (not b!1208296) (not b_next!25977) (not mapNonEmpty!47884) (not bm!59121) (not b!1208288) (not b!1208315) (not b!1208301) (not b!1208300) (not b!1208314) (not b!1208291) (not bm!59119) (not bm!59125) (not b!1208309) (not b!1208313) (not b!1208294) (not start!100908) (not b!1208298) (not b!1208307) b_and!42997 tp_is_empty!30681 (not b!1208297) (not b_lambda!21497))
(check-sat b_and!42997 (not b_next!25977))
(get-model)

(declare-fun d!133219 () Bool)

(assert (=> d!133219 (= (array_inv!28724 _keys!1208) (bvsge (size!38246 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100908 d!133219))

(declare-fun d!133221 () Bool)

(assert (=> d!133221 (= (array_inv!28725 _values!996) (bvsge (size!38247 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100908 d!133221))

(declare-fun b!1208432 () Bool)

(declare-fun e!686292 () ListLongMap!17731)

(declare-fun call!59156 () ListLongMap!17731)

(assert (=> b!1208432 (= e!686292 call!59156)))

(declare-fun b!1208433 () Bool)

(declare-fun e!686293 () ListLongMap!17731)

(assert (=> b!1208433 (= e!686293 (ListLongMap!17732 Nil!26560))))

(declare-fun b!1208434 () Bool)

(assert (=> b!1208434 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 lt!548344 _keys!1208))))))

(assert (=> b!1208434 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38247 (ite c!118855 lt!548352 _values!996))))))

(declare-fun lt!548419 () ListLongMap!17731)

(declare-fun e!686294 () Bool)

(declare-fun apply!966 (ListLongMap!17731 (_ BitVec 64)) V!46035)

(declare-fun get!19218 (ValueCell!14631 V!46035) V!46035)

(assert (=> b!1208434 (= e!686294 (= (apply!966 lt!548419 (select (arr!37710 (ite c!118855 lt!548344 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19218 (select (arr!37711 (ite c!118855 lt!548352 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!59153 () Bool)

(assert (=> bm!59153 (= call!59156 (getCurrentListMapNoExtraKeys!5315 (ite c!118855 lt!548344 _keys!1208) (ite c!118855 lt!548352 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208435 () Bool)

(declare-fun e!686289 () Bool)

(declare-fun isEmpty!990 (ListLongMap!17731) Bool)

(assert (=> b!1208435 (= e!686289 (isEmpty!990 lt!548419))))

(declare-fun b!1208436 () Bool)

(declare-fun e!686291 () Bool)

(assert (=> b!1208436 (= e!686291 (validKeyInArray!0 (select (arr!37710 (ite c!118855 lt!548344 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208436 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208437 () Bool)

(assert (=> b!1208437 (= e!686289 (= lt!548419 (getCurrentListMapNoExtraKeys!5315 (ite c!118855 lt!548344 _keys!1208) (ite c!118855 lt!548352 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208438 () Bool)

(assert (=> b!1208438 (= e!686293 e!686292)))

(declare-fun c!118882 () Bool)

(assert (=> b!1208438 (= c!118882 (validKeyInArray!0 (select (arr!37710 (ite c!118855 lt!548344 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133223 () Bool)

(declare-fun e!686288 () Bool)

(assert (=> d!133223 e!686288))

(declare-fun res!803272 () Bool)

(assert (=> d!133223 (=> (not res!803272) (not e!686288))))

(assert (=> d!133223 (= res!803272 (not (contains!6941 lt!548419 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133223 (= lt!548419 e!686293)))

(declare-fun c!118881 () Bool)

(assert (=> d!133223 (= c!118881 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 lt!548344 _keys!1208))))))

(assert (=> d!133223 (validMask!0 mask!1564)))

(assert (=> d!133223 (= (getCurrentListMapNoExtraKeys!5315 (ite c!118855 lt!548344 _keys!1208) (ite c!118855 lt!548352 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548419)))

(declare-fun b!1208439 () Bool)

(declare-fun e!686290 () Bool)

(assert (=> b!1208439 (= e!686290 e!686289)))

(declare-fun c!118884 () Bool)

(assert (=> b!1208439 (= c!118884 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 lt!548344 _keys!1208))))))

(declare-fun b!1208440 () Bool)

(declare-fun res!803273 () Bool)

(assert (=> b!1208440 (=> (not res!803273) (not e!686288))))

(assert (=> b!1208440 (= res!803273 (not (contains!6941 lt!548419 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208441 () Bool)

(assert (=> b!1208441 (= e!686288 e!686290)))

(declare-fun c!118883 () Bool)

(assert (=> b!1208441 (= c!118883 e!686291)))

(declare-fun res!803271 () Bool)

(assert (=> b!1208441 (=> (not res!803271) (not e!686291))))

(assert (=> b!1208441 (= res!803271 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 lt!548344 _keys!1208))))))

(declare-fun b!1208442 () Bool)

(assert (=> b!1208442 (= e!686290 e!686294)))

(assert (=> b!1208442 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 lt!548344 _keys!1208))))))

(declare-fun res!803270 () Bool)

(assert (=> b!1208442 (= res!803270 (contains!6941 lt!548419 (select (arr!37710 (ite c!118855 lt!548344 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208442 (=> (not res!803270) (not e!686294))))

(declare-fun b!1208443 () Bool)

(declare-fun lt!548422 () Unit!40054)

(declare-fun lt!548420 () Unit!40054)

(assert (=> b!1208443 (= lt!548422 lt!548420)))

(declare-fun lt!548421 () V!46035)

(declare-fun lt!548423 () ListLongMap!17731)

(declare-fun lt!548418 () (_ BitVec 64))

(declare-fun lt!548424 () (_ BitVec 64))

(assert (=> b!1208443 (not (contains!6941 (+!4000 lt!548423 (tuple2!19763 lt!548418 lt!548421)) lt!548424))))

(declare-fun addStillNotContains!294 (ListLongMap!17731 (_ BitVec 64) V!46035 (_ BitVec 64)) Unit!40054)

(assert (=> b!1208443 (= lt!548420 (addStillNotContains!294 lt!548423 lt!548418 lt!548421 lt!548424))))

(assert (=> b!1208443 (= lt!548424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208443 (= lt!548421 (get!19218 (select (arr!37711 (ite c!118855 lt!548352 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208443 (= lt!548418 (select (arr!37710 (ite c!118855 lt!548344 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208443 (= lt!548423 call!59156)))

(assert (=> b!1208443 (= e!686292 (+!4000 call!59156 (tuple2!19763 (select (arr!37710 (ite c!118855 lt!548344 _keys!1208)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19218 (select (arr!37711 (ite c!118855 lt!548352 _values!996)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133223 c!118881) b!1208433))

(assert (= (and d!133223 (not c!118881)) b!1208438))

(assert (= (and b!1208438 c!118882) b!1208443))

(assert (= (and b!1208438 (not c!118882)) b!1208432))

(assert (= (or b!1208443 b!1208432) bm!59153))

(assert (= (and d!133223 res!803272) b!1208440))

(assert (= (and b!1208440 res!803273) b!1208441))

(assert (= (and b!1208441 res!803271) b!1208436))

(assert (= (and b!1208441 c!118883) b!1208442))

(assert (= (and b!1208441 (not c!118883)) b!1208439))

(assert (= (and b!1208442 res!803270) b!1208434))

(assert (= (and b!1208439 c!118884) b!1208437))

(assert (= (and b!1208439 (not c!118884)) b!1208435))

(declare-fun b_lambda!21499 () Bool)

(assert (=> (not b_lambda!21499) (not b!1208434)))

(assert (=> b!1208434 t!39519))

(declare-fun b_and!43003 () Bool)

(assert (= b_and!42997 (and (=> t!39519 result!22143) b_and!43003)))

(declare-fun b_lambda!21501 () Bool)

(assert (=> (not b_lambda!21501) (not b!1208443)))

(assert (=> b!1208443 t!39519))

(declare-fun b_and!43005 () Bool)

(assert (= b_and!43003 (and (=> t!39519 result!22143) b_and!43005)))

(declare-fun m!1114209 () Bool)

(assert (=> d!133223 m!1114209))

(assert (=> d!133223 m!1114127))

(declare-fun m!1114211 () Bool)

(assert (=> b!1208437 m!1114211))

(declare-fun m!1114213 () Bool)

(assert (=> b!1208443 m!1114213))

(declare-fun m!1114215 () Bool)

(assert (=> b!1208443 m!1114215))

(assert (=> b!1208443 m!1114119))

(declare-fun m!1114217 () Bool)

(assert (=> b!1208443 m!1114217))

(declare-fun m!1114219 () Bool)

(assert (=> b!1208443 m!1114219))

(declare-fun m!1114221 () Bool)

(assert (=> b!1208443 m!1114221))

(assert (=> b!1208443 m!1114215))

(declare-fun m!1114223 () Bool)

(assert (=> b!1208443 m!1114223))

(declare-fun m!1114225 () Bool)

(assert (=> b!1208443 m!1114225))

(assert (=> b!1208443 m!1114219))

(assert (=> b!1208443 m!1114119))

(assert (=> bm!59153 m!1114211))

(assert (=> b!1208442 m!1114223))

(assert (=> b!1208442 m!1114223))

(declare-fun m!1114227 () Bool)

(assert (=> b!1208442 m!1114227))

(declare-fun m!1114229 () Bool)

(assert (=> b!1208435 m!1114229))

(assert (=> b!1208436 m!1114223))

(assert (=> b!1208436 m!1114223))

(declare-fun m!1114231 () Bool)

(assert (=> b!1208436 m!1114231))

(assert (=> b!1208438 m!1114223))

(assert (=> b!1208438 m!1114223))

(assert (=> b!1208438 m!1114231))

(assert (=> b!1208434 m!1114215))

(assert (=> b!1208434 m!1114119))

(assert (=> b!1208434 m!1114217))

(assert (=> b!1208434 m!1114215))

(assert (=> b!1208434 m!1114119))

(assert (=> b!1208434 m!1114223))

(assert (=> b!1208434 m!1114223))

(declare-fun m!1114233 () Bool)

(assert (=> b!1208434 m!1114233))

(declare-fun m!1114235 () Bool)

(assert (=> b!1208440 m!1114235))

(assert (=> bm!59125 d!133223))

(declare-fun d!133225 () Bool)

(assert (=> d!133225 (contains!6941 (+!4000 (ite c!118853 lt!548348 lt!548342) (tuple2!19763 (ite c!118853 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118854 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118853 minValue!944 (ite c!118854 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!548427 () Unit!40054)

(declare-fun choose!1807 (ListLongMap!17731 (_ BitVec 64) V!46035 (_ BitVec 64)) Unit!40054)

(assert (=> d!133225 (= lt!548427 (choose!1807 (ite c!118853 lt!548348 lt!548342) (ite c!118853 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118854 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118853 minValue!944 (ite c!118854 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133225 (contains!6941 (ite c!118853 lt!548348 lt!548342) k0!934)))

(assert (=> d!133225 (= (addStillContains!1029 (ite c!118853 lt!548348 lt!548342) (ite c!118853 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118854 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118853 minValue!944 (ite c!118854 zeroValue!944 minValue!944)) k0!934) lt!548427)))

(declare-fun bs!34158 () Bool)

(assert (= bs!34158 d!133225))

(declare-fun m!1114237 () Bool)

(assert (=> bs!34158 m!1114237))

(assert (=> bs!34158 m!1114237))

(declare-fun m!1114239 () Bool)

(assert (=> bs!34158 m!1114239))

(declare-fun m!1114241 () Bool)

(assert (=> bs!34158 m!1114241))

(declare-fun m!1114243 () Bool)

(assert (=> bs!34158 m!1114243))

(assert (=> bm!59121 d!133225))

(declare-fun d!133227 () Bool)

(declare-fun res!803278 () Bool)

(declare-fun e!686299 () Bool)

(assert (=> d!133227 (=> res!803278 e!686299)))

(assert (=> d!133227 (= res!803278 (= (select (arr!37710 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133227 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!686299)))

(declare-fun b!1208449 () Bool)

(declare-fun e!686300 () Bool)

(assert (=> b!1208449 (= e!686299 e!686300)))

(declare-fun res!803279 () Bool)

(assert (=> b!1208449 (=> (not res!803279) (not e!686300))))

(assert (=> b!1208449 (= res!803279 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38246 _keys!1208)))))

(declare-fun b!1208450 () Bool)

(assert (=> b!1208450 (= e!686300 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133227 (not res!803278)) b!1208449))

(assert (= (and b!1208449 res!803279) b!1208450))

(declare-fun m!1114245 () Bool)

(assert (=> d!133227 m!1114245))

(declare-fun m!1114247 () Bool)

(assert (=> b!1208450 m!1114247))

(assert (=> b!1208294 d!133227))

(declare-fun b!1208451 () Bool)

(declare-fun e!686305 () ListLongMap!17731)

(declare-fun call!59157 () ListLongMap!17731)

(assert (=> b!1208451 (= e!686305 call!59157)))

(declare-fun b!1208452 () Bool)

(declare-fun e!686306 () ListLongMap!17731)

(assert (=> b!1208452 (= e!686306 (ListLongMap!17732 Nil!26560))))

(declare-fun b!1208453 () Bool)

(assert (=> b!1208453 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38246 lt!548344)))))

(assert (=> b!1208453 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38247 lt!548352)))))

(declare-fun e!686307 () Bool)

(declare-fun lt!548429 () ListLongMap!17731)

(assert (=> b!1208453 (= e!686307 (= (apply!966 lt!548429 (select (arr!37710 lt!548344) from!1455)) (get!19218 (select (arr!37711 lt!548352) from!1455) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!59154 () Bool)

(assert (=> bm!59154 (= call!59157 (getCurrentListMapNoExtraKeys!5315 lt!548344 lt!548352 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208454 () Bool)

(declare-fun e!686302 () Bool)

(assert (=> b!1208454 (= e!686302 (isEmpty!990 lt!548429))))

(declare-fun b!1208455 () Bool)

(declare-fun e!686304 () Bool)

(assert (=> b!1208455 (= e!686304 (validKeyInArray!0 (select (arr!37710 lt!548344) from!1455)))))

(assert (=> b!1208455 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208456 () Bool)

(assert (=> b!1208456 (= e!686302 (= lt!548429 (getCurrentListMapNoExtraKeys!5315 lt!548344 lt!548352 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208457 () Bool)

(assert (=> b!1208457 (= e!686306 e!686305)))

(declare-fun c!118886 () Bool)

(assert (=> b!1208457 (= c!118886 (validKeyInArray!0 (select (arr!37710 lt!548344) from!1455)))))

(declare-fun d!133229 () Bool)

(declare-fun e!686301 () Bool)

(assert (=> d!133229 e!686301))

(declare-fun res!803282 () Bool)

(assert (=> d!133229 (=> (not res!803282) (not e!686301))))

(assert (=> d!133229 (= res!803282 (not (contains!6941 lt!548429 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133229 (= lt!548429 e!686306)))

(declare-fun c!118885 () Bool)

(assert (=> d!133229 (= c!118885 (bvsge from!1455 (size!38246 lt!548344)))))

(assert (=> d!133229 (validMask!0 mask!1564)))

(assert (=> d!133229 (= (getCurrentListMapNoExtraKeys!5315 lt!548344 lt!548352 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548429)))

(declare-fun b!1208458 () Bool)

(declare-fun e!686303 () Bool)

(assert (=> b!1208458 (= e!686303 e!686302)))

(declare-fun c!118888 () Bool)

(assert (=> b!1208458 (= c!118888 (bvslt from!1455 (size!38246 lt!548344)))))

(declare-fun b!1208459 () Bool)

(declare-fun res!803283 () Bool)

(assert (=> b!1208459 (=> (not res!803283) (not e!686301))))

(assert (=> b!1208459 (= res!803283 (not (contains!6941 lt!548429 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208460 () Bool)

(assert (=> b!1208460 (= e!686301 e!686303)))

(declare-fun c!118887 () Bool)

(assert (=> b!1208460 (= c!118887 e!686304)))

(declare-fun res!803281 () Bool)

(assert (=> b!1208460 (=> (not res!803281) (not e!686304))))

(assert (=> b!1208460 (= res!803281 (bvslt from!1455 (size!38246 lt!548344)))))

(declare-fun b!1208461 () Bool)

(assert (=> b!1208461 (= e!686303 e!686307)))

(assert (=> b!1208461 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38246 lt!548344)))))

(declare-fun res!803280 () Bool)

(assert (=> b!1208461 (= res!803280 (contains!6941 lt!548429 (select (arr!37710 lt!548344) from!1455)))))

(assert (=> b!1208461 (=> (not res!803280) (not e!686307))))

(declare-fun b!1208462 () Bool)

(declare-fun lt!548432 () Unit!40054)

(declare-fun lt!548430 () Unit!40054)

(assert (=> b!1208462 (= lt!548432 lt!548430)))

(declare-fun lt!548431 () V!46035)

(declare-fun lt!548434 () (_ BitVec 64))

(declare-fun lt!548433 () ListLongMap!17731)

(declare-fun lt!548428 () (_ BitVec 64))

(assert (=> b!1208462 (not (contains!6941 (+!4000 lt!548433 (tuple2!19763 lt!548428 lt!548431)) lt!548434))))

(assert (=> b!1208462 (= lt!548430 (addStillNotContains!294 lt!548433 lt!548428 lt!548431 lt!548434))))

(assert (=> b!1208462 (= lt!548434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208462 (= lt!548431 (get!19218 (select (arr!37711 lt!548352) from!1455) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208462 (= lt!548428 (select (arr!37710 lt!548344) from!1455))))

(assert (=> b!1208462 (= lt!548433 call!59157)))

(assert (=> b!1208462 (= e!686305 (+!4000 call!59157 (tuple2!19763 (select (arr!37710 lt!548344) from!1455) (get!19218 (select (arr!37711 lt!548352) from!1455) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133229 c!118885) b!1208452))

(assert (= (and d!133229 (not c!118885)) b!1208457))

(assert (= (and b!1208457 c!118886) b!1208462))

(assert (= (and b!1208457 (not c!118886)) b!1208451))

(assert (= (or b!1208462 b!1208451) bm!59154))

(assert (= (and d!133229 res!803282) b!1208459))

(assert (= (and b!1208459 res!803283) b!1208460))

(assert (= (and b!1208460 res!803281) b!1208455))

(assert (= (and b!1208460 c!118887) b!1208461))

(assert (= (and b!1208460 (not c!118887)) b!1208458))

(assert (= (and b!1208461 res!803280) b!1208453))

(assert (= (and b!1208458 c!118888) b!1208456))

(assert (= (and b!1208458 (not c!118888)) b!1208454))

(declare-fun b_lambda!21503 () Bool)

(assert (=> (not b_lambda!21503) (not b!1208453)))

(assert (=> b!1208453 t!39519))

(declare-fun b_and!43007 () Bool)

(assert (= b_and!43005 (and (=> t!39519 result!22143) b_and!43007)))

(declare-fun b_lambda!21505 () Bool)

(assert (=> (not b_lambda!21505) (not b!1208462)))

(assert (=> b!1208462 t!39519))

(declare-fun b_and!43009 () Bool)

(assert (= b_and!43007 (and (=> t!39519 result!22143) b_and!43009)))

(declare-fun m!1114249 () Bool)

(assert (=> d!133229 m!1114249))

(assert (=> d!133229 m!1114127))

(declare-fun m!1114251 () Bool)

(assert (=> b!1208456 m!1114251))

(declare-fun m!1114253 () Bool)

(assert (=> b!1208462 m!1114253))

(declare-fun m!1114255 () Bool)

(assert (=> b!1208462 m!1114255))

(assert (=> b!1208462 m!1114119))

(declare-fun m!1114257 () Bool)

(assert (=> b!1208462 m!1114257))

(declare-fun m!1114259 () Bool)

(assert (=> b!1208462 m!1114259))

(declare-fun m!1114261 () Bool)

(assert (=> b!1208462 m!1114261))

(assert (=> b!1208462 m!1114255))

(declare-fun m!1114263 () Bool)

(assert (=> b!1208462 m!1114263))

(declare-fun m!1114265 () Bool)

(assert (=> b!1208462 m!1114265))

(assert (=> b!1208462 m!1114259))

(assert (=> b!1208462 m!1114119))

(assert (=> bm!59154 m!1114251))

(assert (=> b!1208461 m!1114263))

(assert (=> b!1208461 m!1114263))

(declare-fun m!1114267 () Bool)

(assert (=> b!1208461 m!1114267))

(declare-fun m!1114269 () Bool)

(assert (=> b!1208454 m!1114269))

(assert (=> b!1208455 m!1114263))

(assert (=> b!1208455 m!1114263))

(declare-fun m!1114271 () Bool)

(assert (=> b!1208455 m!1114271))

(assert (=> b!1208457 m!1114263))

(assert (=> b!1208457 m!1114263))

(assert (=> b!1208457 m!1114271))

(assert (=> b!1208453 m!1114255))

(assert (=> b!1208453 m!1114119))

(assert (=> b!1208453 m!1114257))

(assert (=> b!1208453 m!1114255))

(assert (=> b!1208453 m!1114119))

(assert (=> b!1208453 m!1114263))

(assert (=> b!1208453 m!1114263))

(declare-fun m!1114273 () Bool)

(assert (=> b!1208453 m!1114273))

(declare-fun m!1114275 () Bool)

(assert (=> b!1208459 m!1114275))

(assert (=> b!1208292 d!133229))

(declare-fun b!1208463 () Bool)

(declare-fun e!686312 () ListLongMap!17731)

(declare-fun call!59158 () ListLongMap!17731)

(assert (=> b!1208463 (= e!686312 call!59158)))

(declare-fun b!1208464 () Bool)

(declare-fun e!686313 () ListLongMap!17731)

(assert (=> b!1208464 (= e!686313 (ListLongMap!17732 Nil!26560))))

(declare-fun b!1208465 () Bool)

(assert (=> b!1208465 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38246 _keys!1208)))))

(assert (=> b!1208465 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38247 _values!996)))))

(declare-fun lt!548436 () ListLongMap!17731)

(declare-fun e!686314 () Bool)

(assert (=> b!1208465 (= e!686314 (= (apply!966 lt!548436 (select (arr!37710 _keys!1208) from!1455)) (get!19218 (select (arr!37711 _values!996) from!1455) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!59155 () Bool)

(assert (=> bm!59155 (= call!59158 (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208466 () Bool)

(declare-fun e!686309 () Bool)

(assert (=> b!1208466 (= e!686309 (isEmpty!990 lt!548436))))

(declare-fun b!1208467 () Bool)

(declare-fun e!686311 () Bool)

(assert (=> b!1208467 (= e!686311 (validKeyInArray!0 (select (arr!37710 _keys!1208) from!1455)))))

(assert (=> b!1208467 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208468 () Bool)

(assert (=> b!1208468 (= e!686309 (= lt!548436 (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208469 () Bool)

(assert (=> b!1208469 (= e!686313 e!686312)))

(declare-fun c!118890 () Bool)

(assert (=> b!1208469 (= c!118890 (validKeyInArray!0 (select (arr!37710 _keys!1208) from!1455)))))

(declare-fun d!133231 () Bool)

(declare-fun e!686308 () Bool)

(assert (=> d!133231 e!686308))

(declare-fun res!803286 () Bool)

(assert (=> d!133231 (=> (not res!803286) (not e!686308))))

(assert (=> d!133231 (= res!803286 (not (contains!6941 lt!548436 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133231 (= lt!548436 e!686313)))

(declare-fun c!118889 () Bool)

(assert (=> d!133231 (= c!118889 (bvsge from!1455 (size!38246 _keys!1208)))))

(assert (=> d!133231 (validMask!0 mask!1564)))

(assert (=> d!133231 (= (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548436)))

(declare-fun b!1208470 () Bool)

(declare-fun e!686310 () Bool)

(assert (=> b!1208470 (= e!686310 e!686309)))

(declare-fun c!118892 () Bool)

(assert (=> b!1208470 (= c!118892 (bvslt from!1455 (size!38246 _keys!1208)))))

(declare-fun b!1208471 () Bool)

(declare-fun res!803287 () Bool)

(assert (=> b!1208471 (=> (not res!803287) (not e!686308))))

(assert (=> b!1208471 (= res!803287 (not (contains!6941 lt!548436 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208472 () Bool)

(assert (=> b!1208472 (= e!686308 e!686310)))

(declare-fun c!118891 () Bool)

(assert (=> b!1208472 (= c!118891 e!686311)))

(declare-fun res!803285 () Bool)

(assert (=> b!1208472 (=> (not res!803285) (not e!686311))))

(assert (=> b!1208472 (= res!803285 (bvslt from!1455 (size!38246 _keys!1208)))))

(declare-fun b!1208473 () Bool)

(assert (=> b!1208473 (= e!686310 e!686314)))

(assert (=> b!1208473 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38246 _keys!1208)))))

(declare-fun res!803284 () Bool)

(assert (=> b!1208473 (= res!803284 (contains!6941 lt!548436 (select (arr!37710 _keys!1208) from!1455)))))

(assert (=> b!1208473 (=> (not res!803284) (not e!686314))))

(declare-fun b!1208474 () Bool)

(declare-fun lt!548439 () Unit!40054)

(declare-fun lt!548437 () Unit!40054)

(assert (=> b!1208474 (= lt!548439 lt!548437)))

(declare-fun lt!548440 () ListLongMap!17731)

(declare-fun lt!548435 () (_ BitVec 64))

(declare-fun lt!548438 () V!46035)

(declare-fun lt!548441 () (_ BitVec 64))

(assert (=> b!1208474 (not (contains!6941 (+!4000 lt!548440 (tuple2!19763 lt!548435 lt!548438)) lt!548441))))

(assert (=> b!1208474 (= lt!548437 (addStillNotContains!294 lt!548440 lt!548435 lt!548438 lt!548441))))

(assert (=> b!1208474 (= lt!548441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208474 (= lt!548438 (get!19218 (select (arr!37711 _values!996) from!1455) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208474 (= lt!548435 (select (arr!37710 _keys!1208) from!1455))))

(assert (=> b!1208474 (= lt!548440 call!59158)))

(assert (=> b!1208474 (= e!686312 (+!4000 call!59158 (tuple2!19763 (select (arr!37710 _keys!1208) from!1455) (get!19218 (select (arr!37711 _values!996) from!1455) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133231 c!118889) b!1208464))

(assert (= (and d!133231 (not c!118889)) b!1208469))

(assert (= (and b!1208469 c!118890) b!1208474))

(assert (= (and b!1208469 (not c!118890)) b!1208463))

(assert (= (or b!1208474 b!1208463) bm!59155))

(assert (= (and d!133231 res!803286) b!1208471))

(assert (= (and b!1208471 res!803287) b!1208472))

(assert (= (and b!1208472 res!803285) b!1208467))

(assert (= (and b!1208472 c!118891) b!1208473))

(assert (= (and b!1208472 (not c!118891)) b!1208470))

(assert (= (and b!1208473 res!803284) b!1208465))

(assert (= (and b!1208470 c!118892) b!1208468))

(assert (= (and b!1208470 (not c!118892)) b!1208466))

(declare-fun b_lambda!21507 () Bool)

(assert (=> (not b_lambda!21507) (not b!1208465)))

(assert (=> b!1208465 t!39519))

(declare-fun b_and!43011 () Bool)

(assert (= b_and!43009 (and (=> t!39519 result!22143) b_and!43011)))

(declare-fun b_lambda!21509 () Bool)

(assert (=> (not b_lambda!21509) (not b!1208474)))

(assert (=> b!1208474 t!39519))

(declare-fun b_and!43013 () Bool)

(assert (= b_and!43011 (and (=> t!39519 result!22143) b_and!43013)))

(declare-fun m!1114277 () Bool)

(assert (=> d!133231 m!1114277))

(assert (=> d!133231 m!1114127))

(declare-fun m!1114279 () Bool)

(assert (=> b!1208468 m!1114279))

(declare-fun m!1114281 () Bool)

(assert (=> b!1208474 m!1114281))

(declare-fun m!1114283 () Bool)

(assert (=> b!1208474 m!1114283))

(assert (=> b!1208474 m!1114119))

(declare-fun m!1114285 () Bool)

(assert (=> b!1208474 m!1114285))

(declare-fun m!1114287 () Bool)

(assert (=> b!1208474 m!1114287))

(declare-fun m!1114289 () Bool)

(assert (=> b!1208474 m!1114289))

(assert (=> b!1208474 m!1114283))

(assert (=> b!1208474 m!1114085))

(declare-fun m!1114291 () Bool)

(assert (=> b!1208474 m!1114291))

(assert (=> b!1208474 m!1114287))

(assert (=> b!1208474 m!1114119))

(assert (=> bm!59155 m!1114279))

(assert (=> b!1208473 m!1114085))

(assert (=> b!1208473 m!1114085))

(declare-fun m!1114293 () Bool)

(assert (=> b!1208473 m!1114293))

(declare-fun m!1114295 () Bool)

(assert (=> b!1208466 m!1114295))

(assert (=> b!1208467 m!1114085))

(assert (=> b!1208467 m!1114085))

(declare-fun m!1114297 () Bool)

(assert (=> b!1208467 m!1114297))

(assert (=> b!1208469 m!1114085))

(assert (=> b!1208469 m!1114085))

(assert (=> b!1208469 m!1114297))

(assert (=> b!1208465 m!1114283))

(assert (=> b!1208465 m!1114119))

(assert (=> b!1208465 m!1114285))

(assert (=> b!1208465 m!1114283))

(assert (=> b!1208465 m!1114119))

(assert (=> b!1208465 m!1114085))

(assert (=> b!1208465 m!1114085))

(declare-fun m!1114299 () Bool)

(assert (=> b!1208465 m!1114299))

(declare-fun m!1114301 () Bool)

(assert (=> b!1208471 m!1114301))

(assert (=> b!1208292 d!133231))

(declare-fun d!133233 () Bool)

(assert (=> d!133233 (contains!6941 (+!4000 lt!548342 (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!548442 () Unit!40054)

(assert (=> d!133233 (= lt!548442 (choose!1807 lt!548342 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133233 (contains!6941 lt!548342 k0!934)))

(assert (=> d!133233 (= (addStillContains!1029 lt!548342 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!548442)))

(declare-fun bs!34159 () Bool)

(assert (= bs!34159 d!133233))

(declare-fun m!1114303 () Bool)

(assert (=> bs!34159 m!1114303))

(assert (=> bs!34159 m!1114303))

(declare-fun m!1114305 () Bool)

(assert (=> bs!34159 m!1114305))

(declare-fun m!1114307 () Bool)

(assert (=> bs!34159 m!1114307))

(assert (=> bs!34159 m!1114071))

(assert (=> b!1208315 d!133233))

(declare-fun d!133235 () Bool)

(declare-fun e!686319 () Bool)

(assert (=> d!133235 e!686319))

(declare-fun res!803290 () Bool)

(assert (=> d!133235 (=> res!803290 e!686319)))

(declare-fun lt!548451 () Bool)

(assert (=> d!133235 (= res!803290 (not lt!548451))))

(declare-fun lt!548454 () Bool)

(assert (=> d!133235 (= lt!548451 lt!548454)))

(declare-fun lt!548452 () Unit!40054)

(declare-fun e!686320 () Unit!40054)

(assert (=> d!133235 (= lt!548452 e!686320)))

(declare-fun c!118895 () Bool)

(assert (=> d!133235 (= c!118895 lt!548454)))

(declare-fun containsKey!593 (List!26563 (_ BitVec 64)) Bool)

(assert (=> d!133235 (= lt!548454 (containsKey!593 (toList!8881 (+!4000 lt!548348 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!133235 (= (contains!6941 (+!4000 lt!548348 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!548451)))

(declare-fun b!1208481 () Bool)

(declare-fun lt!548453 () Unit!40054)

(assert (=> b!1208481 (= e!686320 lt!548453)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!423 (List!26563 (_ BitVec 64)) Unit!40054)

(assert (=> b!1208481 (= lt!548453 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8881 (+!4000 lt!548348 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-datatypes ((Option!688 0))(
  ( (Some!687 (v!18047 V!46035)) (None!686) )
))
(declare-fun isDefined!462 (Option!688) Bool)

(declare-fun getValueByKey!637 (List!26563 (_ BitVec 64)) Option!688)

(assert (=> b!1208481 (isDefined!462 (getValueByKey!637 (toList!8881 (+!4000 lt!548348 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1208482 () Bool)

(declare-fun Unit!40060 () Unit!40054)

(assert (=> b!1208482 (= e!686320 Unit!40060)))

(declare-fun b!1208483 () Bool)

(assert (=> b!1208483 (= e!686319 (isDefined!462 (getValueByKey!637 (toList!8881 (+!4000 lt!548348 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!133235 c!118895) b!1208481))

(assert (= (and d!133235 (not c!118895)) b!1208482))

(assert (= (and d!133235 (not res!803290)) b!1208483))

(declare-fun m!1114309 () Bool)

(assert (=> d!133235 m!1114309))

(declare-fun m!1114311 () Bool)

(assert (=> b!1208481 m!1114311))

(declare-fun m!1114313 () Bool)

(assert (=> b!1208481 m!1114313))

(assert (=> b!1208481 m!1114313))

(declare-fun m!1114315 () Bool)

(assert (=> b!1208481 m!1114315))

(assert (=> b!1208483 m!1114313))

(assert (=> b!1208483 m!1114313))

(assert (=> b!1208483 m!1114315))

(assert (=> b!1208315 d!133235))

(declare-fun d!133237 () Bool)

(declare-fun e!686323 () Bool)

(assert (=> d!133237 e!686323))

(declare-fun res!803296 () Bool)

(assert (=> d!133237 (=> (not res!803296) (not e!686323))))

(declare-fun lt!548463 () ListLongMap!17731)

(assert (=> d!133237 (= res!803296 (contains!6941 lt!548463 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!548464 () List!26563)

(assert (=> d!133237 (= lt!548463 (ListLongMap!17732 lt!548464))))

(declare-fun lt!548465 () Unit!40054)

(declare-fun lt!548466 () Unit!40054)

(assert (=> d!133237 (= lt!548465 lt!548466)))

(assert (=> d!133237 (= (getValueByKey!637 lt!548464 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!687 (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!314 (List!26563 (_ BitVec 64) V!46035) Unit!40054)

(assert (=> d!133237 (= lt!548466 (lemmaContainsTupThenGetReturnValue!314 lt!548464 (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun insertStrictlySorted!407 (List!26563 (_ BitVec 64) V!46035) List!26563)

(assert (=> d!133237 (= lt!548464 (insertStrictlySorted!407 (toList!8881 lt!548348) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!133237 (= (+!4000 lt!548348 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!548463)))

(declare-fun b!1208488 () Bool)

(declare-fun res!803295 () Bool)

(assert (=> b!1208488 (=> (not res!803295) (not e!686323))))

(assert (=> b!1208488 (= res!803295 (= (getValueByKey!637 (toList!8881 lt!548463) (_1!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!687 (_2!9892 (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208489 () Bool)

(declare-fun contains!6943 (List!26563 tuple2!19762) Bool)

(assert (=> b!1208489 (= e!686323 (contains!6943 (toList!8881 lt!548463) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!133237 res!803296) b!1208488))

(assert (= (and b!1208488 res!803295) b!1208489))

(declare-fun m!1114317 () Bool)

(assert (=> d!133237 m!1114317))

(declare-fun m!1114319 () Bool)

(assert (=> d!133237 m!1114319))

(declare-fun m!1114321 () Bool)

(assert (=> d!133237 m!1114321))

(declare-fun m!1114323 () Bool)

(assert (=> d!133237 m!1114323))

(declare-fun m!1114325 () Bool)

(assert (=> b!1208488 m!1114325))

(declare-fun m!1114327 () Bool)

(assert (=> b!1208489 m!1114327))

(assert (=> b!1208315 d!133237))

(declare-fun d!133239 () Bool)

(declare-fun lt!548469 () ListLongMap!17731)

(assert (=> d!133239 (not (contains!6941 lt!548469 k0!934))))

(declare-fun removeStrictlySorted!99 (List!26563 (_ BitVec 64)) List!26563)

(assert (=> d!133239 (= lt!548469 (ListLongMap!17732 (removeStrictlySorted!99 (toList!8881 call!59128) k0!934)))))

(assert (=> d!133239 (= (-!1835 call!59128 k0!934) lt!548469)))

(declare-fun bs!34160 () Bool)

(assert (= bs!34160 d!133239))

(declare-fun m!1114329 () Bool)

(assert (=> bs!34160 m!1114329))

(declare-fun m!1114331 () Bool)

(assert (=> bs!34160 m!1114331))

(assert (=> b!1208301 d!133239))

(declare-fun b!1208500 () Bool)

(declare-fun e!686334 () Bool)

(declare-fun e!686335 () Bool)

(assert (=> b!1208500 (= e!686334 e!686335)))

(declare-fun c!118898 () Bool)

(assert (=> b!1208500 (= c!118898 (validKeyInArray!0 (select (arr!37710 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208501 () Bool)

(declare-fun call!59161 () Bool)

(assert (=> b!1208501 (= e!686335 call!59161)))

(declare-fun d!133241 () Bool)

(declare-fun res!803304 () Bool)

(declare-fun e!686332 () Bool)

(assert (=> d!133241 (=> res!803304 e!686332)))

(assert (=> d!133241 (= res!803304 (bvsge #b00000000000000000000000000000000 (size!38246 _keys!1208)))))

(assert (=> d!133241 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26561) e!686332)))

(declare-fun b!1208502 () Bool)

(declare-fun e!686333 () Bool)

(declare-fun contains!6944 (List!26564 (_ BitVec 64)) Bool)

(assert (=> b!1208502 (= e!686333 (contains!6944 Nil!26561 (select (arr!37710 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!59158 () Bool)

(assert (=> bm!59158 (= call!59161 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118898 (Cons!26560 (select (arr!37710 _keys!1208) #b00000000000000000000000000000000) Nil!26561) Nil!26561)))))

(declare-fun b!1208503 () Bool)

(assert (=> b!1208503 (= e!686335 call!59161)))

(declare-fun b!1208504 () Bool)

(assert (=> b!1208504 (= e!686332 e!686334)))

(declare-fun res!803305 () Bool)

(assert (=> b!1208504 (=> (not res!803305) (not e!686334))))

(assert (=> b!1208504 (= res!803305 (not e!686333))))

(declare-fun res!803303 () Bool)

(assert (=> b!1208504 (=> (not res!803303) (not e!686333))))

(assert (=> b!1208504 (= res!803303 (validKeyInArray!0 (select (arr!37710 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!133241 (not res!803304)) b!1208504))

(assert (= (and b!1208504 res!803303) b!1208502))

(assert (= (and b!1208504 res!803305) b!1208500))

(assert (= (and b!1208500 c!118898) b!1208501))

(assert (= (and b!1208500 (not c!118898)) b!1208503))

(assert (= (or b!1208501 b!1208503) bm!59158))

(declare-fun m!1114333 () Bool)

(assert (=> b!1208500 m!1114333))

(assert (=> b!1208500 m!1114333))

(declare-fun m!1114335 () Bool)

(assert (=> b!1208500 m!1114335))

(assert (=> b!1208502 m!1114333))

(assert (=> b!1208502 m!1114333))

(declare-fun m!1114337 () Bool)

(assert (=> b!1208502 m!1114337))

(assert (=> bm!59158 m!1114333))

(declare-fun m!1114339 () Bool)

(assert (=> bm!59158 m!1114339))

(assert (=> b!1208504 m!1114333))

(assert (=> b!1208504 m!1114333))

(assert (=> b!1208504 m!1114335))

(assert (=> b!1208300 d!133241))

(declare-fun d!133243 () Bool)

(declare-fun e!686336 () Bool)

(assert (=> d!133243 e!686336))

(declare-fun res!803306 () Bool)

(assert (=> d!133243 (=> res!803306 e!686336)))

(declare-fun lt!548470 () Bool)

(assert (=> d!133243 (= res!803306 (not lt!548470))))

(declare-fun lt!548473 () Bool)

(assert (=> d!133243 (= lt!548470 lt!548473)))

(declare-fun lt!548471 () Unit!40054)

(declare-fun e!686337 () Unit!40054)

(assert (=> d!133243 (= lt!548471 e!686337)))

(declare-fun c!118899 () Bool)

(assert (=> d!133243 (= c!118899 lt!548473)))

(assert (=> d!133243 (= lt!548473 (containsKey!593 (toList!8881 lt!548342) k0!934))))

(assert (=> d!133243 (= (contains!6941 lt!548342 k0!934) lt!548470)))

(declare-fun b!1208505 () Bool)

(declare-fun lt!548472 () Unit!40054)

(assert (=> b!1208505 (= e!686337 lt!548472)))

(assert (=> b!1208505 (= lt!548472 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8881 lt!548342) k0!934))))

(assert (=> b!1208505 (isDefined!462 (getValueByKey!637 (toList!8881 lt!548342) k0!934))))

(declare-fun b!1208506 () Bool)

(declare-fun Unit!40061 () Unit!40054)

(assert (=> b!1208506 (= e!686337 Unit!40061)))

(declare-fun b!1208507 () Bool)

(assert (=> b!1208507 (= e!686336 (isDefined!462 (getValueByKey!637 (toList!8881 lt!548342) k0!934)))))

(assert (= (and d!133243 c!118899) b!1208505))

(assert (= (and d!133243 (not c!118899)) b!1208506))

(assert (= (and d!133243 (not res!803306)) b!1208507))

(declare-fun m!1114341 () Bool)

(assert (=> d!133243 m!1114341))

(declare-fun m!1114343 () Bool)

(assert (=> b!1208505 m!1114343))

(declare-fun m!1114345 () Bool)

(assert (=> b!1208505 m!1114345))

(assert (=> b!1208505 m!1114345))

(declare-fun m!1114347 () Bool)

(assert (=> b!1208505 m!1114347))

(assert (=> b!1208507 m!1114345))

(assert (=> b!1208507 m!1114345))

(assert (=> b!1208507 m!1114347))

(assert (=> b!1208309 d!133243))

(declare-fun b!1208508 () Bool)

(declare-fun e!686342 () ListLongMap!17731)

(declare-fun call!59162 () ListLongMap!17731)

(assert (=> b!1208508 (= e!686342 call!59162)))

(declare-fun b!1208509 () Bool)

(declare-fun e!686343 () ListLongMap!17731)

(assert (=> b!1208509 (= e!686343 (ListLongMap!17732 Nil!26560))))

(declare-fun b!1208510 () Bool)

(assert (=> b!1208510 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _keys!1208)))))

(assert (=> b!1208510 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38247 _values!996)))))

(declare-fun e!686344 () Bool)

(declare-fun lt!548475 () ListLongMap!17731)

(assert (=> b!1208510 (= e!686344 (= (apply!966 lt!548475 (select (arr!37710 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19218 (select (arr!37711 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!59159 () Bool)

(assert (=> bm!59159 (= call!59162 (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208511 () Bool)

(declare-fun e!686339 () Bool)

(assert (=> b!1208511 (= e!686339 (isEmpty!990 lt!548475))))

(declare-fun b!1208512 () Bool)

(declare-fun e!686341 () Bool)

(assert (=> b!1208512 (= e!686341 (validKeyInArray!0 (select (arr!37710 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208512 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208513 () Bool)

(assert (=> b!1208513 (= e!686339 (= lt!548475 (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208514 () Bool)

(assert (=> b!1208514 (= e!686343 e!686342)))

(declare-fun c!118901 () Bool)

(assert (=> b!1208514 (= c!118901 (validKeyInArray!0 (select (arr!37710 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133245 () Bool)

(declare-fun e!686338 () Bool)

(assert (=> d!133245 e!686338))

(declare-fun res!803309 () Bool)

(assert (=> d!133245 (=> (not res!803309) (not e!686338))))

(assert (=> d!133245 (= res!803309 (not (contains!6941 lt!548475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133245 (= lt!548475 e!686343)))

(declare-fun c!118900 () Bool)

(assert (=> d!133245 (= c!118900 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _keys!1208)))))

(assert (=> d!133245 (validMask!0 mask!1564)))

(assert (=> d!133245 (= (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548475)))

(declare-fun b!1208515 () Bool)

(declare-fun e!686340 () Bool)

(assert (=> b!1208515 (= e!686340 e!686339)))

(declare-fun c!118903 () Bool)

(assert (=> b!1208515 (= c!118903 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _keys!1208)))))

(declare-fun b!1208516 () Bool)

(declare-fun res!803310 () Bool)

(assert (=> b!1208516 (=> (not res!803310) (not e!686338))))

(assert (=> b!1208516 (= res!803310 (not (contains!6941 lt!548475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208517 () Bool)

(assert (=> b!1208517 (= e!686338 e!686340)))

(declare-fun c!118902 () Bool)

(assert (=> b!1208517 (= c!118902 e!686341)))

(declare-fun res!803308 () Bool)

(assert (=> b!1208517 (=> (not res!803308) (not e!686341))))

(assert (=> b!1208517 (= res!803308 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _keys!1208)))))

(declare-fun b!1208518 () Bool)

(assert (=> b!1208518 (= e!686340 e!686344)))

(assert (=> b!1208518 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _keys!1208)))))

(declare-fun res!803307 () Bool)

(assert (=> b!1208518 (= res!803307 (contains!6941 lt!548475 (select (arr!37710 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208518 (=> (not res!803307) (not e!686344))))

(declare-fun b!1208519 () Bool)

(declare-fun lt!548478 () Unit!40054)

(declare-fun lt!548476 () Unit!40054)

(assert (=> b!1208519 (= lt!548478 lt!548476)))

(declare-fun lt!548480 () (_ BitVec 64))

(declare-fun lt!548477 () V!46035)

(declare-fun lt!548474 () (_ BitVec 64))

(declare-fun lt!548479 () ListLongMap!17731)

(assert (=> b!1208519 (not (contains!6941 (+!4000 lt!548479 (tuple2!19763 lt!548474 lt!548477)) lt!548480))))

(assert (=> b!1208519 (= lt!548476 (addStillNotContains!294 lt!548479 lt!548474 lt!548477 lt!548480))))

(assert (=> b!1208519 (= lt!548480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208519 (= lt!548477 (get!19218 (select (arr!37711 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208519 (= lt!548474 (select (arr!37710 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208519 (= lt!548479 call!59162)))

(assert (=> b!1208519 (= e!686342 (+!4000 call!59162 (tuple2!19763 (select (arr!37710 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19218 (select (arr!37711 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133245 c!118900) b!1208509))

(assert (= (and d!133245 (not c!118900)) b!1208514))

(assert (= (and b!1208514 c!118901) b!1208519))

(assert (= (and b!1208514 (not c!118901)) b!1208508))

(assert (= (or b!1208519 b!1208508) bm!59159))

(assert (= (and d!133245 res!803309) b!1208516))

(assert (= (and b!1208516 res!803310) b!1208517))

(assert (= (and b!1208517 res!803308) b!1208512))

(assert (= (and b!1208517 c!118902) b!1208518))

(assert (= (and b!1208517 (not c!118902)) b!1208515))

(assert (= (and b!1208518 res!803307) b!1208510))

(assert (= (and b!1208515 c!118903) b!1208513))

(assert (= (and b!1208515 (not c!118903)) b!1208511))

(declare-fun b_lambda!21511 () Bool)

(assert (=> (not b_lambda!21511) (not b!1208510)))

(assert (=> b!1208510 t!39519))

(declare-fun b_and!43015 () Bool)

(assert (= b_and!43013 (and (=> t!39519 result!22143) b_and!43015)))

(declare-fun b_lambda!21513 () Bool)

(assert (=> (not b_lambda!21513) (not b!1208519)))

(assert (=> b!1208519 t!39519))

(declare-fun b_and!43017 () Bool)

(assert (= b_and!43015 (and (=> t!39519 result!22143) b_and!43017)))

(declare-fun m!1114349 () Bool)

(assert (=> d!133245 m!1114349))

(assert (=> d!133245 m!1114127))

(declare-fun m!1114351 () Bool)

(assert (=> b!1208513 m!1114351))

(declare-fun m!1114353 () Bool)

(assert (=> b!1208519 m!1114353))

(declare-fun m!1114355 () Bool)

(assert (=> b!1208519 m!1114355))

(assert (=> b!1208519 m!1114119))

(declare-fun m!1114357 () Bool)

(assert (=> b!1208519 m!1114357))

(declare-fun m!1114359 () Bool)

(assert (=> b!1208519 m!1114359))

(declare-fun m!1114361 () Bool)

(assert (=> b!1208519 m!1114361))

(assert (=> b!1208519 m!1114355))

(assert (=> b!1208519 m!1114245))

(declare-fun m!1114363 () Bool)

(assert (=> b!1208519 m!1114363))

(assert (=> b!1208519 m!1114359))

(assert (=> b!1208519 m!1114119))

(assert (=> bm!59159 m!1114351))

(assert (=> b!1208518 m!1114245))

(assert (=> b!1208518 m!1114245))

(declare-fun m!1114365 () Bool)

(assert (=> b!1208518 m!1114365))

(declare-fun m!1114367 () Bool)

(assert (=> b!1208511 m!1114367))

(assert (=> b!1208512 m!1114245))

(assert (=> b!1208512 m!1114245))

(declare-fun m!1114369 () Bool)

(assert (=> b!1208512 m!1114369))

(assert (=> b!1208514 m!1114245))

(assert (=> b!1208514 m!1114245))

(assert (=> b!1208514 m!1114369))

(assert (=> b!1208510 m!1114355))

(assert (=> b!1208510 m!1114119))

(assert (=> b!1208510 m!1114357))

(assert (=> b!1208510 m!1114355))

(assert (=> b!1208510 m!1114119))

(assert (=> b!1208510 m!1114245))

(assert (=> b!1208510 m!1114245))

(declare-fun m!1114371 () Bool)

(assert (=> b!1208510 m!1114371))

(declare-fun m!1114373 () Bool)

(assert (=> b!1208516 m!1114373))

(assert (=> b!1208309 d!133245))

(declare-fun d!133247 () Bool)

(assert (=> d!133247 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1208290 d!133247))

(assert (=> b!1208313 d!133227))

(declare-fun d!133249 () Bool)

(assert (=> d!133249 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208298 d!133249))

(declare-fun b!1208528 () Bool)

(declare-fun e!686352 () Bool)

(declare-fun e!686353 () Bool)

(assert (=> b!1208528 (= e!686352 e!686353)))

(declare-fun lt!548489 () (_ BitVec 64))

(assert (=> b!1208528 (= lt!548489 (select (arr!37710 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!548487 () Unit!40054)

(assert (=> b!1208528 (= lt!548487 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548489 #b00000000000000000000000000000000))))

(assert (=> b!1208528 (arrayContainsKey!0 _keys!1208 lt!548489 #b00000000000000000000000000000000)))

(declare-fun lt!548488 () Unit!40054)

(assert (=> b!1208528 (= lt!548488 lt!548487)))

(declare-fun res!803315 () Bool)

(declare-datatypes ((SeekEntryResult!9939 0))(
  ( (MissingZero!9939 (index!42127 (_ BitVec 32))) (Found!9939 (index!42128 (_ BitVec 32))) (Intermediate!9939 (undefined!10751 Bool) (index!42129 (_ BitVec 32)) (x!106624 (_ BitVec 32))) (Undefined!9939) (MissingVacant!9939 (index!42130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78143 (_ BitVec 32)) SeekEntryResult!9939)

(assert (=> b!1208528 (= res!803315 (= (seekEntryOrOpen!0 (select (arr!37710 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9939 #b00000000000000000000000000000000)))))

(assert (=> b!1208528 (=> (not res!803315) (not e!686353))))

(declare-fun b!1208529 () Bool)

(declare-fun call!59165 () Bool)

(assert (=> b!1208529 (= e!686353 call!59165)))

(declare-fun bm!59162 () Bool)

(assert (=> bm!59162 (= call!59165 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun d!133251 () Bool)

(declare-fun res!803316 () Bool)

(declare-fun e!686351 () Bool)

(assert (=> d!133251 (=> res!803316 e!686351)))

(assert (=> d!133251 (= res!803316 (bvsge #b00000000000000000000000000000000 (size!38246 _keys!1208)))))

(assert (=> d!133251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!686351)))

(declare-fun b!1208530 () Bool)

(assert (=> b!1208530 (= e!686351 e!686352)))

(declare-fun c!118906 () Bool)

(assert (=> b!1208530 (= c!118906 (validKeyInArray!0 (select (arr!37710 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208531 () Bool)

(assert (=> b!1208531 (= e!686352 call!59165)))

(assert (= (and d!133251 (not res!803316)) b!1208530))

(assert (= (and b!1208530 c!118906) b!1208528))

(assert (= (and b!1208530 (not c!118906)) b!1208531))

(assert (= (and b!1208528 res!803315) b!1208529))

(assert (= (or b!1208529 b!1208531) bm!59162))

(assert (=> b!1208528 m!1114333))

(declare-fun m!1114375 () Bool)

(assert (=> b!1208528 m!1114375))

(declare-fun m!1114377 () Bool)

(assert (=> b!1208528 m!1114377))

(assert (=> b!1208528 m!1114333))

(declare-fun m!1114379 () Bool)

(assert (=> b!1208528 m!1114379))

(declare-fun m!1114381 () Bool)

(assert (=> bm!59162 m!1114381))

(assert (=> b!1208530 m!1114333))

(assert (=> b!1208530 m!1114333))

(assert (=> b!1208530 m!1114335))

(assert (=> b!1208297 d!133251))

(declare-fun d!133253 () Bool)

(declare-fun res!803321 () Bool)

(declare-fun e!686358 () Bool)

(assert (=> d!133253 (=> res!803321 e!686358)))

(assert (=> d!133253 (= res!803321 ((_ is Nil!26561) Nil!26561))))

(assert (=> d!133253 (= (noDuplicate!1624 Nil!26561) e!686358)))

(declare-fun b!1208536 () Bool)

(declare-fun e!686359 () Bool)

(assert (=> b!1208536 (= e!686358 e!686359)))

(declare-fun res!803322 () Bool)

(assert (=> b!1208536 (=> (not res!803322) (not e!686359))))

(assert (=> b!1208536 (= res!803322 (not (contains!6944 (t!39521 Nil!26561) (h!27769 Nil!26561))))))

(declare-fun b!1208537 () Bool)

(assert (=> b!1208537 (= e!686359 (noDuplicate!1624 (t!39521 Nil!26561)))))

(assert (= (and d!133253 (not res!803321)) b!1208536))

(assert (= (and b!1208536 res!803322) b!1208537))

(declare-fun m!1114383 () Bool)

(assert (=> b!1208536 m!1114383))

(declare-fun m!1114385 () Bool)

(assert (=> b!1208537 m!1114385))

(assert (=> b!1208307 d!133253))

(declare-fun b!1208538 () Bool)

(declare-fun e!686362 () Bool)

(declare-fun e!686363 () Bool)

(assert (=> b!1208538 (= e!686362 e!686363)))

(declare-fun c!118907 () Bool)

(assert (=> b!1208538 (= c!118907 (validKeyInArray!0 (select (arr!37710 lt!548344) #b00000000000000000000000000000000)))))

(declare-fun b!1208539 () Bool)

(declare-fun call!59166 () Bool)

(assert (=> b!1208539 (= e!686363 call!59166)))

(declare-fun d!133255 () Bool)

(declare-fun res!803324 () Bool)

(declare-fun e!686360 () Bool)

(assert (=> d!133255 (=> res!803324 e!686360)))

(assert (=> d!133255 (= res!803324 (bvsge #b00000000000000000000000000000000 (size!38246 lt!548344)))))

(assert (=> d!133255 (= (arrayNoDuplicates!0 lt!548344 #b00000000000000000000000000000000 Nil!26561) e!686360)))

(declare-fun b!1208540 () Bool)

(declare-fun e!686361 () Bool)

(assert (=> b!1208540 (= e!686361 (contains!6944 Nil!26561 (select (arr!37710 lt!548344) #b00000000000000000000000000000000)))))

(declare-fun bm!59163 () Bool)

(assert (=> bm!59163 (= call!59166 (arrayNoDuplicates!0 lt!548344 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118907 (Cons!26560 (select (arr!37710 lt!548344) #b00000000000000000000000000000000) Nil!26561) Nil!26561)))))

(declare-fun b!1208541 () Bool)

(assert (=> b!1208541 (= e!686363 call!59166)))

(declare-fun b!1208542 () Bool)

(assert (=> b!1208542 (= e!686360 e!686362)))

(declare-fun res!803325 () Bool)

(assert (=> b!1208542 (=> (not res!803325) (not e!686362))))

(assert (=> b!1208542 (= res!803325 (not e!686361))))

(declare-fun res!803323 () Bool)

(assert (=> b!1208542 (=> (not res!803323) (not e!686361))))

(assert (=> b!1208542 (= res!803323 (validKeyInArray!0 (select (arr!37710 lt!548344) #b00000000000000000000000000000000)))))

(assert (= (and d!133255 (not res!803324)) b!1208542))

(assert (= (and b!1208542 res!803323) b!1208540))

(assert (= (and b!1208542 res!803325) b!1208538))

(assert (= (and b!1208538 c!118907) b!1208539))

(assert (= (and b!1208538 (not c!118907)) b!1208541))

(assert (= (or b!1208539 b!1208541) bm!59163))

(declare-fun m!1114387 () Bool)

(assert (=> b!1208538 m!1114387))

(assert (=> b!1208538 m!1114387))

(declare-fun m!1114389 () Bool)

(assert (=> b!1208538 m!1114389))

(assert (=> b!1208540 m!1114387))

(assert (=> b!1208540 m!1114387))

(declare-fun m!1114391 () Bool)

(assert (=> b!1208540 m!1114391))

(assert (=> bm!59163 m!1114387))

(declare-fun m!1114393 () Bool)

(assert (=> bm!59163 m!1114393))

(assert (=> b!1208542 m!1114387))

(assert (=> b!1208542 m!1114387))

(assert (=> b!1208542 m!1114389))

(assert (=> b!1208306 d!133255))

(declare-fun d!133257 () Bool)

(declare-fun res!803326 () Bool)

(declare-fun e!686364 () Bool)

(assert (=> d!133257 (=> res!803326 e!686364)))

(assert (=> d!133257 (= res!803326 (= (select (arr!37710 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133257 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!686364)))

(declare-fun b!1208543 () Bool)

(declare-fun e!686365 () Bool)

(assert (=> b!1208543 (= e!686364 e!686365)))

(declare-fun res!803327 () Bool)

(assert (=> b!1208543 (=> (not res!803327) (not e!686365))))

(assert (=> b!1208543 (= res!803327 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38246 _keys!1208)))))

(declare-fun b!1208544 () Bool)

(assert (=> b!1208544 (= e!686365 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133257 (not res!803326)) b!1208543))

(assert (= (and b!1208543 res!803327) b!1208544))

(assert (=> d!133257 m!1114333))

(declare-fun m!1114395 () Bool)

(assert (=> b!1208544 m!1114395))

(assert (=> b!1208291 d!133257))

(declare-fun d!133259 () Bool)

(assert (=> d!133259 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548492 () Unit!40054)

(declare-fun choose!13 (array!78143 (_ BitVec 64) (_ BitVec 32)) Unit!40054)

(assert (=> d!133259 (= lt!548492 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133259 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133259 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!548492)))

(declare-fun bs!34161 () Bool)

(assert (= bs!34161 d!133259))

(assert (=> bs!34161 m!1114077))

(declare-fun m!1114397 () Bool)

(assert (=> bs!34161 m!1114397))

(assert (=> b!1208291 d!133259))

(declare-fun b!1208545 () Bool)

(declare-fun e!686367 () Bool)

(declare-fun e!686368 () Bool)

(assert (=> b!1208545 (= e!686367 e!686368)))

(declare-fun lt!548495 () (_ BitVec 64))

(assert (=> b!1208545 (= lt!548495 (select (arr!37710 lt!548344) #b00000000000000000000000000000000))))

(declare-fun lt!548493 () Unit!40054)

(assert (=> b!1208545 (= lt!548493 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548344 lt!548495 #b00000000000000000000000000000000))))

(assert (=> b!1208545 (arrayContainsKey!0 lt!548344 lt!548495 #b00000000000000000000000000000000)))

(declare-fun lt!548494 () Unit!40054)

(assert (=> b!1208545 (= lt!548494 lt!548493)))

(declare-fun res!803328 () Bool)

(assert (=> b!1208545 (= res!803328 (= (seekEntryOrOpen!0 (select (arr!37710 lt!548344) #b00000000000000000000000000000000) lt!548344 mask!1564) (Found!9939 #b00000000000000000000000000000000)))))

(assert (=> b!1208545 (=> (not res!803328) (not e!686368))))

(declare-fun b!1208546 () Bool)

(declare-fun call!59167 () Bool)

(assert (=> b!1208546 (= e!686368 call!59167)))

(declare-fun bm!59164 () Bool)

(assert (=> bm!59164 (= call!59167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!548344 mask!1564))))

(declare-fun d!133261 () Bool)

(declare-fun res!803329 () Bool)

(declare-fun e!686366 () Bool)

(assert (=> d!133261 (=> res!803329 e!686366)))

(assert (=> d!133261 (= res!803329 (bvsge #b00000000000000000000000000000000 (size!38246 lt!548344)))))

(assert (=> d!133261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548344 mask!1564) e!686366)))

(declare-fun b!1208547 () Bool)

(assert (=> b!1208547 (= e!686366 e!686367)))

(declare-fun c!118908 () Bool)

(assert (=> b!1208547 (= c!118908 (validKeyInArray!0 (select (arr!37710 lt!548344) #b00000000000000000000000000000000)))))

(declare-fun b!1208548 () Bool)

(assert (=> b!1208548 (= e!686367 call!59167)))

(assert (= (and d!133261 (not res!803329)) b!1208547))

(assert (= (and b!1208547 c!118908) b!1208545))

(assert (= (and b!1208547 (not c!118908)) b!1208548))

(assert (= (and b!1208545 res!803328) b!1208546))

(assert (= (or b!1208546 b!1208548) bm!59164))

(assert (=> b!1208545 m!1114387))

(declare-fun m!1114399 () Bool)

(assert (=> b!1208545 m!1114399))

(declare-fun m!1114401 () Bool)

(assert (=> b!1208545 m!1114401))

(assert (=> b!1208545 m!1114387))

(declare-fun m!1114403 () Bool)

(assert (=> b!1208545 m!1114403))

(declare-fun m!1114405 () Bool)

(assert (=> bm!59164 m!1114405))

(assert (=> b!1208547 m!1114387))

(assert (=> b!1208547 m!1114387))

(assert (=> b!1208547 m!1114389))

(assert (=> b!1208314 d!133261))

(declare-fun b!1208549 () Bool)

(declare-fun e!686371 () Bool)

(declare-fun e!686372 () Bool)

(assert (=> b!1208549 (= e!686371 e!686372)))

(declare-fun c!118909 () Bool)

(assert (=> b!1208549 (= c!118909 (validKeyInArray!0 (select (arr!37710 _keys!1208) from!1455)))))

(declare-fun b!1208550 () Bool)

(declare-fun call!59168 () Bool)

(assert (=> b!1208550 (= e!686372 call!59168)))

(declare-fun d!133263 () Bool)

(declare-fun res!803331 () Bool)

(declare-fun e!686369 () Bool)

(assert (=> d!133263 (=> res!803331 e!686369)))

(assert (=> d!133263 (= res!803331 (bvsge from!1455 (size!38246 _keys!1208)))))

(assert (=> d!133263 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26561) e!686369)))

(declare-fun b!1208551 () Bool)

(declare-fun e!686370 () Bool)

(assert (=> b!1208551 (= e!686370 (contains!6944 Nil!26561 (select (arr!37710 _keys!1208) from!1455)))))

(declare-fun bm!59165 () Bool)

(assert (=> bm!59165 (= call!59168 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118909 (Cons!26560 (select (arr!37710 _keys!1208) from!1455) Nil!26561) Nil!26561)))))

(declare-fun b!1208552 () Bool)

(assert (=> b!1208552 (= e!686372 call!59168)))

(declare-fun b!1208553 () Bool)

(assert (=> b!1208553 (= e!686369 e!686371)))

(declare-fun res!803332 () Bool)

(assert (=> b!1208553 (=> (not res!803332) (not e!686371))))

(assert (=> b!1208553 (= res!803332 (not e!686370))))

(declare-fun res!803330 () Bool)

(assert (=> b!1208553 (=> (not res!803330) (not e!686370))))

(assert (=> b!1208553 (= res!803330 (validKeyInArray!0 (select (arr!37710 _keys!1208) from!1455)))))

(assert (= (and d!133263 (not res!803331)) b!1208553))

(assert (= (and b!1208553 res!803330) b!1208551))

(assert (= (and b!1208553 res!803332) b!1208549))

(assert (= (and b!1208549 c!118909) b!1208550))

(assert (= (and b!1208549 (not c!118909)) b!1208552))

(assert (= (or b!1208550 b!1208552) bm!59165))

(assert (=> b!1208549 m!1114085))

(assert (=> b!1208549 m!1114085))

(assert (=> b!1208549 m!1114297))

(assert (=> b!1208551 m!1114085))

(assert (=> b!1208551 m!1114085))

(declare-fun m!1114407 () Bool)

(assert (=> b!1208551 m!1114407))

(assert (=> bm!59165 m!1114085))

(declare-fun m!1114409 () Bool)

(assert (=> bm!59165 m!1114409))

(assert (=> b!1208553 m!1114085))

(assert (=> b!1208553 m!1114085))

(assert (=> b!1208553 m!1114297))

(assert (=> b!1208296 d!133263))

(declare-fun d!133265 () Bool)

(assert (=> d!133265 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26561)))

(declare-fun lt!548498 () Unit!40054)

(declare-fun choose!39 (array!78143 (_ BitVec 32) (_ BitVec 32)) Unit!40054)

(assert (=> d!133265 (= lt!548498 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133265 (bvslt (size!38246 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133265 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!548498)))

(declare-fun bs!34162 () Bool)

(assert (= bs!34162 d!133265))

(assert (=> bs!34162 m!1114089))

(declare-fun m!1114411 () Bool)

(assert (=> bs!34162 m!1114411))

(assert (=> b!1208296 d!133265))

(declare-fun d!133267 () Bool)

(declare-fun e!686375 () Bool)

(assert (=> d!133267 e!686375))

(declare-fun c!118912 () Bool)

(assert (=> d!133267 (= c!118912 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548501 () Unit!40054)

(declare-fun choose!1808 (array!78143 array!78145 (_ BitVec 32) (_ BitVec 32) V!46035 V!46035 (_ BitVec 64) (_ BitVec 32) Int) Unit!40054)

(assert (=> d!133267 (= lt!548501 (choose!1808 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133267 (validMask!0 mask!1564)))

(assert (=> d!133267 (= (lemmaListMapContainsThenArrayContainsFrom!583 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548501)))

(declare-fun b!1208558 () Bool)

(assert (=> b!1208558 (= e!686375 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208559 () Bool)

(assert (=> b!1208559 (= e!686375 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133267 c!118912) b!1208558))

(assert (= (and d!133267 (not c!118912)) b!1208559))

(declare-fun m!1114413 () Bool)

(assert (=> d!133267 m!1114413))

(assert (=> d!133267 m!1114127))

(assert (=> b!1208558 m!1114105))

(assert (=> b!1208296 d!133267))

(declare-fun b!1208560 () Bool)

(declare-fun e!686380 () ListLongMap!17731)

(declare-fun call!59169 () ListLongMap!17731)

(assert (=> b!1208560 (= e!686380 call!59169)))

(declare-fun b!1208561 () Bool)

(declare-fun e!686381 () ListLongMap!17731)

(assert (=> b!1208561 (= e!686381 (ListLongMap!17732 Nil!26560))))

(declare-fun b!1208562 () Bool)

(assert (=> b!1208562 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 _keys!1208 lt!548344))))))

(assert (=> b!1208562 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38247 (ite c!118855 _values!996 lt!548352))))))

(declare-fun e!686382 () Bool)

(declare-fun lt!548503 () ListLongMap!17731)

(assert (=> b!1208562 (= e!686382 (= (apply!966 lt!548503 (select (arr!37710 (ite c!118855 _keys!1208 lt!548344)) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19218 (select (arr!37711 (ite c!118855 _values!996 lt!548352)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!59166 () Bool)

(assert (=> bm!59166 (= call!59169 (getCurrentListMapNoExtraKeys!5315 (ite c!118855 _keys!1208 lt!548344) (ite c!118855 _values!996 lt!548352) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208563 () Bool)

(declare-fun e!686377 () Bool)

(assert (=> b!1208563 (= e!686377 (isEmpty!990 lt!548503))))

(declare-fun e!686379 () Bool)

(declare-fun b!1208564 () Bool)

(assert (=> b!1208564 (= e!686379 (validKeyInArray!0 (select (arr!37710 (ite c!118855 _keys!1208 lt!548344)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208564 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208565 () Bool)

(assert (=> b!1208565 (= e!686377 (= lt!548503 (getCurrentListMapNoExtraKeys!5315 (ite c!118855 _keys!1208 lt!548344) (ite c!118855 _values!996 lt!548352) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1208566 () Bool)

(assert (=> b!1208566 (= e!686381 e!686380)))

(declare-fun c!118914 () Bool)

(assert (=> b!1208566 (= c!118914 (validKeyInArray!0 (select (arr!37710 (ite c!118855 _keys!1208 lt!548344)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun d!133269 () Bool)

(declare-fun e!686376 () Bool)

(assert (=> d!133269 e!686376))

(declare-fun res!803335 () Bool)

(assert (=> d!133269 (=> (not res!803335) (not e!686376))))

(assert (=> d!133269 (= res!803335 (not (contains!6941 lt!548503 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133269 (= lt!548503 e!686381)))

(declare-fun c!118913 () Bool)

(assert (=> d!133269 (= c!118913 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 _keys!1208 lt!548344))))))

(assert (=> d!133269 (validMask!0 mask!1564)))

(assert (=> d!133269 (= (getCurrentListMapNoExtraKeys!5315 (ite c!118855 _keys!1208 lt!548344) (ite c!118855 _values!996 lt!548352) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548503)))

(declare-fun b!1208567 () Bool)

(declare-fun e!686378 () Bool)

(assert (=> b!1208567 (= e!686378 e!686377)))

(declare-fun c!118916 () Bool)

(assert (=> b!1208567 (= c!118916 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 _keys!1208 lt!548344))))))

(declare-fun b!1208568 () Bool)

(declare-fun res!803336 () Bool)

(assert (=> b!1208568 (=> (not res!803336) (not e!686376))))

(assert (=> b!1208568 (= res!803336 (not (contains!6941 lt!548503 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208569 () Bool)

(assert (=> b!1208569 (= e!686376 e!686378)))

(declare-fun c!118915 () Bool)

(assert (=> b!1208569 (= c!118915 e!686379)))

(declare-fun res!803334 () Bool)

(assert (=> b!1208569 (=> (not res!803334) (not e!686379))))

(assert (=> b!1208569 (= res!803334 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 _keys!1208 lt!548344))))))

(declare-fun b!1208570 () Bool)

(assert (=> b!1208570 (= e!686378 e!686382)))

(assert (=> b!1208570 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 (ite c!118855 _keys!1208 lt!548344))))))

(declare-fun res!803333 () Bool)

(assert (=> b!1208570 (= res!803333 (contains!6941 lt!548503 (select (arr!37710 (ite c!118855 _keys!1208 lt!548344)) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208570 (=> (not res!803333) (not e!686382))))

(declare-fun b!1208571 () Bool)

(declare-fun lt!548506 () Unit!40054)

(declare-fun lt!548504 () Unit!40054)

(assert (=> b!1208571 (= lt!548506 lt!548504)))

(declare-fun lt!548507 () ListLongMap!17731)

(declare-fun lt!548505 () V!46035)

(declare-fun lt!548502 () (_ BitVec 64))

(declare-fun lt!548508 () (_ BitVec 64))

(assert (=> b!1208571 (not (contains!6941 (+!4000 lt!548507 (tuple2!19763 lt!548502 lt!548505)) lt!548508))))

(assert (=> b!1208571 (= lt!548504 (addStillNotContains!294 lt!548507 lt!548502 lt!548505 lt!548508))))

(assert (=> b!1208571 (= lt!548508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208571 (= lt!548505 (get!19218 (select (arr!37711 (ite c!118855 _values!996 lt!548352)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208571 (= lt!548502 (select (arr!37710 (ite c!118855 _keys!1208 lt!548344)) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208571 (= lt!548507 call!59169)))

(assert (=> b!1208571 (= e!686380 (+!4000 call!59169 (tuple2!19763 (select (arr!37710 (ite c!118855 _keys!1208 lt!548344)) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19218 (select (arr!37711 (ite c!118855 _values!996 lt!548352)) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!133269 c!118913) b!1208561))

(assert (= (and d!133269 (not c!118913)) b!1208566))

(assert (= (and b!1208566 c!118914) b!1208571))

(assert (= (and b!1208566 (not c!118914)) b!1208560))

(assert (= (or b!1208571 b!1208560) bm!59166))

(assert (= (and d!133269 res!803335) b!1208568))

(assert (= (and b!1208568 res!803336) b!1208569))

(assert (= (and b!1208569 res!803334) b!1208564))

(assert (= (and b!1208569 c!118915) b!1208570))

(assert (= (and b!1208569 (not c!118915)) b!1208567))

(assert (= (and b!1208570 res!803333) b!1208562))

(assert (= (and b!1208567 c!118916) b!1208565))

(assert (= (and b!1208567 (not c!118916)) b!1208563))

(declare-fun b_lambda!21515 () Bool)

(assert (=> (not b_lambda!21515) (not b!1208562)))

(assert (=> b!1208562 t!39519))

(declare-fun b_and!43019 () Bool)

(assert (= b_and!43017 (and (=> t!39519 result!22143) b_and!43019)))

(declare-fun b_lambda!21517 () Bool)

(assert (=> (not b_lambda!21517) (not b!1208571)))

(assert (=> b!1208571 t!39519))

(declare-fun b_and!43021 () Bool)

(assert (= b_and!43019 (and (=> t!39519 result!22143) b_and!43021)))

(declare-fun m!1114415 () Bool)

(assert (=> d!133269 m!1114415))

(assert (=> d!133269 m!1114127))

(declare-fun m!1114417 () Bool)

(assert (=> b!1208565 m!1114417))

(declare-fun m!1114419 () Bool)

(assert (=> b!1208571 m!1114419))

(declare-fun m!1114421 () Bool)

(assert (=> b!1208571 m!1114421))

(assert (=> b!1208571 m!1114119))

(declare-fun m!1114423 () Bool)

(assert (=> b!1208571 m!1114423))

(declare-fun m!1114425 () Bool)

(assert (=> b!1208571 m!1114425))

(declare-fun m!1114427 () Bool)

(assert (=> b!1208571 m!1114427))

(assert (=> b!1208571 m!1114421))

(declare-fun m!1114429 () Bool)

(assert (=> b!1208571 m!1114429))

(declare-fun m!1114431 () Bool)

(assert (=> b!1208571 m!1114431))

(assert (=> b!1208571 m!1114425))

(assert (=> b!1208571 m!1114119))

(assert (=> bm!59166 m!1114417))

(assert (=> b!1208570 m!1114429))

(assert (=> b!1208570 m!1114429))

(declare-fun m!1114433 () Bool)

(assert (=> b!1208570 m!1114433))

(declare-fun m!1114435 () Bool)

(assert (=> b!1208563 m!1114435))

(assert (=> b!1208564 m!1114429))

(assert (=> b!1208564 m!1114429))

(declare-fun m!1114437 () Bool)

(assert (=> b!1208564 m!1114437))

(assert (=> b!1208566 m!1114429))

(assert (=> b!1208566 m!1114429))

(assert (=> b!1208566 m!1114437))

(assert (=> b!1208562 m!1114421))

(assert (=> b!1208562 m!1114119))

(assert (=> b!1208562 m!1114423))

(assert (=> b!1208562 m!1114421))

(assert (=> b!1208562 m!1114119))

(assert (=> b!1208562 m!1114429))

(assert (=> b!1208562 m!1114429))

(declare-fun m!1114439 () Bool)

(assert (=> b!1208562 m!1114439))

(declare-fun m!1114441 () Bool)

(assert (=> b!1208568 m!1114441))

(assert (=> bm!59119 d!133269))

(declare-fun d!133271 () Bool)

(declare-fun e!686383 () Bool)

(assert (=> d!133271 e!686383))

(declare-fun res!803338 () Bool)

(assert (=> d!133271 (=> (not res!803338) (not e!686383))))

(declare-fun lt!548509 () ListLongMap!17731)

(assert (=> d!133271 (= res!803338 (contains!6941 lt!548509 (_1!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!548510 () List!26563)

(assert (=> d!133271 (= lt!548509 (ListLongMap!17732 lt!548510))))

(declare-fun lt!548511 () Unit!40054)

(declare-fun lt!548512 () Unit!40054)

(assert (=> d!133271 (= lt!548511 lt!548512)))

(assert (=> d!133271 (= (getValueByKey!637 lt!548510 (_1!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!687 (_2!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133271 (= lt!548512 (lemmaContainsTupThenGetReturnValue!314 lt!548510 (_1!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133271 (= lt!548510 (insertStrictlySorted!407 (toList!8881 lt!548342) (_1!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!133271 (= (+!4000 lt!548342 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!548509)))

(declare-fun b!1208572 () Bool)

(declare-fun res!803337 () Bool)

(assert (=> b!1208572 (=> (not res!803337) (not e!686383))))

(assert (=> b!1208572 (= res!803337 (= (getValueByKey!637 (toList!8881 lt!548509) (_1!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!687 (_2!9892 (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1208573 () Bool)

(assert (=> b!1208573 (= e!686383 (contains!6943 (toList!8881 lt!548509) (ite (or c!118853 c!118854) (tuple2!19763 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19763 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!133271 res!803338) b!1208572))

(assert (= (and b!1208572 res!803337) b!1208573))

(declare-fun m!1114443 () Bool)

(assert (=> d!133271 m!1114443))

(declare-fun m!1114445 () Bool)

(assert (=> d!133271 m!1114445))

(declare-fun m!1114447 () Bool)

(assert (=> d!133271 m!1114447))

(declare-fun m!1114449 () Bool)

(assert (=> d!133271 m!1114449))

(declare-fun m!1114451 () Bool)

(assert (=> b!1208572 m!1114451))

(declare-fun m!1114453 () Bool)

(assert (=> b!1208573 m!1114453))

(assert (=> bm!59126 d!133271))

(declare-fun b!1208580 () Bool)

(declare-fun call!59175 () ListLongMap!17731)

(declare-fun call!59174 () ListLongMap!17731)

(declare-fun e!686388 () Bool)

(assert (=> b!1208580 (= e!686388 (= call!59175 (-!1835 call!59174 k0!934)))))

(assert (=> b!1208580 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38247 _values!996)))))

(declare-fun b!1208581 () Bool)

(declare-fun e!686389 () Bool)

(assert (=> b!1208581 (= e!686389 e!686388)))

(declare-fun c!118919 () Bool)

(assert (=> b!1208581 (= c!118919 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!59171 () Bool)

(assert (=> bm!59171 (= call!59175 (getCurrentListMapNoExtraKeys!5315 (array!78144 (store (arr!37710 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38246 _keys!1208)) (array!78146 (store (arr!37711 _values!996) i!673 (ValueCellFull!14631 (dynLambda!3216 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38247 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208582 () Bool)

(assert (=> b!1208582 (= e!686388 (= call!59175 call!59174))))

(assert (=> b!1208582 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38247 _values!996)))))

(declare-fun bm!59172 () Bool)

(assert (=> bm!59172 (= call!59174 (getCurrentListMapNoExtraKeys!5315 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133273 () Bool)

(assert (=> d!133273 e!686389))

(declare-fun res!803341 () Bool)

(assert (=> d!133273 (=> (not res!803341) (not e!686389))))

(assert (=> d!133273 (= res!803341 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38246 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38246 _keys!1208))))))))

(declare-fun lt!548515 () Unit!40054)

(declare-fun choose!1809 (array!78143 array!78145 (_ BitVec 32) (_ BitVec 32) V!46035 V!46035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40054)

(assert (=> d!133273 (= lt!548515 (choose!1809 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133273 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38246 _keys!1208)))))

(assert (=> d!133273 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548515)))

(assert (= (and d!133273 res!803341) b!1208581))

(assert (= (and b!1208581 c!118919) b!1208580))

(assert (= (and b!1208581 (not c!118919)) b!1208582))

(assert (= (or b!1208580 b!1208582) bm!59172))

(assert (= (or b!1208580 b!1208582) bm!59171))

(declare-fun b_lambda!21519 () Bool)

(assert (=> (not b_lambda!21519) (not bm!59171)))

(assert (=> bm!59171 t!39519))

(declare-fun b_and!43023 () Bool)

(assert (= b_and!43021 (and (=> t!39519 result!22143) b_and!43023)))

(declare-fun m!1114455 () Bool)

(assert (=> b!1208580 m!1114455))

(assert (=> bm!59171 m!1114137))

(assert (=> bm!59171 m!1114119))

(assert (=> bm!59171 m!1114121))

(declare-fun m!1114457 () Bool)

(assert (=> bm!59171 m!1114457))

(assert (=> bm!59172 m!1114073))

(declare-fun m!1114459 () Bool)

(assert (=> d!133273 m!1114459))

(assert (=> b!1208288 d!133273))

(declare-fun d!133275 () Bool)

(declare-fun e!686390 () Bool)

(assert (=> d!133275 e!686390))

(declare-fun res!803342 () Bool)

(assert (=> d!133275 (=> res!803342 e!686390)))

(declare-fun lt!548516 () Bool)

(assert (=> d!133275 (= res!803342 (not lt!548516))))

(declare-fun lt!548519 () Bool)

(assert (=> d!133275 (= lt!548516 lt!548519)))

(declare-fun lt!548517 () Unit!40054)

(declare-fun e!686391 () Unit!40054)

(assert (=> d!133275 (= lt!548517 e!686391)))

(declare-fun c!118920 () Bool)

(assert (=> d!133275 (= c!118920 lt!548519)))

(assert (=> d!133275 (= lt!548519 (containsKey!593 (toList!8881 (ite c!118853 lt!548348 call!59123)) k0!934))))

(assert (=> d!133275 (= (contains!6941 (ite c!118853 lt!548348 call!59123) k0!934) lt!548516)))

(declare-fun b!1208583 () Bool)

(declare-fun lt!548518 () Unit!40054)

(assert (=> b!1208583 (= e!686391 lt!548518)))

(assert (=> b!1208583 (= lt!548518 (lemmaContainsKeyImpliesGetValueByKeyDefined!423 (toList!8881 (ite c!118853 lt!548348 call!59123)) k0!934))))

(assert (=> b!1208583 (isDefined!462 (getValueByKey!637 (toList!8881 (ite c!118853 lt!548348 call!59123)) k0!934))))

(declare-fun b!1208584 () Bool)

(declare-fun Unit!40062 () Unit!40054)

(assert (=> b!1208584 (= e!686391 Unit!40062)))

(declare-fun b!1208585 () Bool)

(assert (=> b!1208585 (= e!686390 (isDefined!462 (getValueByKey!637 (toList!8881 (ite c!118853 lt!548348 call!59123)) k0!934)))))

(assert (= (and d!133275 c!118920) b!1208583))

(assert (= (and d!133275 (not c!118920)) b!1208584))

(assert (= (and d!133275 (not res!803342)) b!1208585))

(declare-fun m!1114461 () Bool)

(assert (=> d!133275 m!1114461))

(declare-fun m!1114463 () Bool)

(assert (=> b!1208583 m!1114463))

(declare-fun m!1114465 () Bool)

(assert (=> b!1208583 m!1114465))

(assert (=> b!1208583 m!1114465))

(declare-fun m!1114467 () Bool)

(assert (=> b!1208583 m!1114467))

(assert (=> b!1208585 m!1114465))

(assert (=> b!1208585 m!1114465))

(assert (=> b!1208585 m!1114467))

(assert (=> bm!59122 d!133275))

(declare-fun b!1208593 () Bool)

(declare-fun e!686397 () Bool)

(assert (=> b!1208593 (= e!686397 tp_is_empty!30681)))

(declare-fun b!1208592 () Bool)

(declare-fun e!686396 () Bool)

(assert (=> b!1208592 (= e!686396 tp_is_empty!30681)))

(declare-fun condMapEmpty!47890 () Bool)

(declare-fun mapDefault!47890 () ValueCell!14631)

(assert (=> mapNonEmpty!47884 (= condMapEmpty!47890 (= mapRest!47884 ((as const (Array (_ BitVec 32) ValueCell!14631)) mapDefault!47890)))))

(declare-fun mapRes!47890 () Bool)

(assert (=> mapNonEmpty!47884 (= tp!90940 (and e!686397 mapRes!47890))))

(declare-fun mapIsEmpty!47890 () Bool)

(assert (=> mapIsEmpty!47890 mapRes!47890))

(declare-fun mapNonEmpty!47890 () Bool)

(declare-fun tp!90950 () Bool)

(assert (=> mapNonEmpty!47890 (= mapRes!47890 (and tp!90950 e!686396))))

(declare-fun mapKey!47890 () (_ BitVec 32))

(declare-fun mapValue!47890 () ValueCell!14631)

(declare-fun mapRest!47890 () (Array (_ BitVec 32) ValueCell!14631))

(assert (=> mapNonEmpty!47890 (= mapRest!47884 (store mapRest!47890 mapKey!47890 mapValue!47890))))

(assert (= (and mapNonEmpty!47884 condMapEmpty!47890) mapIsEmpty!47890))

(assert (= (and mapNonEmpty!47884 (not condMapEmpty!47890)) mapNonEmpty!47890))

(assert (= (and mapNonEmpty!47890 ((_ is ValueCellFull!14631) mapValue!47890)) b!1208592))

(assert (= (and mapNonEmpty!47884 ((_ is ValueCellFull!14631) mapDefault!47890)) b!1208593))

(declare-fun m!1114469 () Bool)

(assert (=> mapNonEmpty!47890 m!1114469))

(declare-fun b_lambda!21521 () Bool)

(assert (= b_lambda!21505 (or (and start!100908 b_free!25977) b_lambda!21521)))

(declare-fun b_lambda!21523 () Bool)

(assert (= b_lambda!21515 (or (and start!100908 b_free!25977) b_lambda!21523)))

(declare-fun b_lambda!21525 () Bool)

(assert (= b_lambda!21513 (or (and start!100908 b_free!25977) b_lambda!21525)))

(declare-fun b_lambda!21527 () Bool)

(assert (= b_lambda!21511 (or (and start!100908 b_free!25977) b_lambda!21527)))

(declare-fun b_lambda!21529 () Bool)

(assert (= b_lambda!21509 (or (and start!100908 b_free!25977) b_lambda!21529)))

(declare-fun b_lambda!21531 () Bool)

(assert (= b_lambda!21519 (or (and start!100908 b_free!25977) b_lambda!21531)))

(declare-fun b_lambda!21533 () Bool)

(assert (= b_lambda!21503 (or (and start!100908 b_free!25977) b_lambda!21533)))

(declare-fun b_lambda!21535 () Bool)

(assert (= b_lambda!21507 (or (and start!100908 b_free!25977) b_lambda!21535)))

(declare-fun b_lambda!21537 () Bool)

(assert (= b_lambda!21501 (or (and start!100908 b_free!25977) b_lambda!21537)))

(declare-fun b_lambda!21539 () Bool)

(assert (= b_lambda!21517 (or (and start!100908 b_free!25977) b_lambda!21539)))

(declare-fun b_lambda!21541 () Bool)

(assert (= b_lambda!21499 (or (and start!100908 b_free!25977) b_lambda!21541)))

(check-sat (not b!1208530) (not b!1208573) (not b!1208512) (not b!1208468) (not b_lambda!21541) (not b!1208455) (not bm!59172) (not d!133225) (not b!1208467) (not b_lambda!21537) (not b!1208442) (not b!1208566) b_and!43023 (not b!1208553) (not b!1208511) (not b!1208547) (not bm!59159) (not b!1208583) (not b!1208544) (not d!133245) (not d!133259) (not b_lambda!21529) (not d!133231) (not b!1208454) (not b!1208514) (not b!1208528) (not bm!59164) (not b!1208456) (not b!1208474) (not b!1208473) (not b_lambda!21525) (not b!1208568) (not b!1208518) (not b!1208580) (not b!1208570) (not b_lambda!21533) (not d!133233) (not b!1208462) (not b!1208585) (not b!1208457) (not d!133265) (not b_lambda!21523) (not b!1208469) (not b!1208537) (not d!133235) (not b!1208549) (not bm!59165) (not b!1208542) (not b!1208538) (not d!133273) (not b!1208516) (not b!1208562) (not bm!59162) (not d!133239) (not b!1208488) (not b!1208563) (not b!1208505) (not b!1208536) (not b!1208437) (not b!1208572) (not b!1208519) (not bm!59166) (not b!1208471) (not b!1208545) (not bm!59155) (not b!1208565) (not bm!59171) (not b!1208551) (not d!133275) (not b!1208507) (not d!133267) (not b!1208504) (not b!1208453) (not d!133269) (not d!133271) (not b!1208513) (not b_lambda!21527) (not b!1208502) tp_is_empty!30681 (not bm!59158) (not b_lambda!21535) (not b!1208481) (not d!133237) (not b!1208450) (not b!1208438) (not b!1208558) (not b_lambda!21521) (not b_lambda!21531) (not b_lambda!21539) (not bm!59163) (not b!1208459) (not b!1208483) (not b!1208434) (not d!133229) (not mapNonEmpty!47890) (not b!1208571) (not bm!59154) (not b!1208436) (not b!1208564) (not b!1208500) (not b!1208435) (not b_next!25977) (not b!1208440) (not b!1208461) (not b!1208465) (not d!133243) (not b_lambda!21497) (not b!1208510) (not b!1208443) (not b!1208466) (not b!1208489) (not d!133223) (not bm!59153) (not b!1208540))
(check-sat b_and!43023 (not b_next!25977))
