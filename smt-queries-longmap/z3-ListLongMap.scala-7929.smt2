; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98416 () Bool)

(assert start!98416)

(declare-fun b_free!24021 () Bool)

(declare-fun b_next!24021 () Bool)

(assert (=> start!98416 (= b_free!24021 (not b_next!24021))))

(declare-fun tp!84773 () Bool)

(declare-fun b_and!38891 () Bool)

(assert (=> start!98416 (= tp!84773 b_and!38891)))

(declare-fun b!1136217 () Bool)

(declare-fun call!49801 () Bool)

(assert (=> b!1136217 call!49801))

(declare-datatypes ((Unit!37211 0))(
  ( (Unit!37212) )
))
(declare-fun lt!505180 () Unit!37211)

(declare-fun call!49799 () Unit!37211)

(assert (=> b!1136217 (= lt!505180 call!49799)))

(declare-fun e!646576 () Unit!37211)

(assert (=> b!1136217 (= e!646576 lt!505180)))

(declare-datatypes ((V!43195 0))(
  ( (V!43196 (val!14332 Int)) )
))
(declare-fun zeroValue!944 () V!43195)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!49791 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43195)

(declare-datatypes ((tuple2!18092 0))(
  ( (tuple2!18093 (_1!9057 (_ BitVec 64)) (_2!9057 V!43195)) )
))
(declare-datatypes ((List!24851 0))(
  ( (Nil!24848) (Cons!24847 (h!26056 tuple2!18092) (t!35864 List!24851)) )
))
(declare-datatypes ((ListLongMap!16061 0))(
  ( (ListLongMap!16062 (toList!8046 List!24851)) )
))
(declare-fun call!49796 () ListLongMap!16061)

(declare-datatypes ((ValueCell!13566 0))(
  ( (ValueCellFull!13566 (v!16969 V!43195)) (EmptyCell!13566) )
))
(declare-datatypes ((array!73963 0))(
  ( (array!73964 (arr!35632 (Array (_ BitVec 32) ValueCell!13566)) (size!36168 (_ BitVec 32))) )
))
(declare-fun lt!505172 () array!73963)

(declare-datatypes ((array!73965 0))(
  ( (array!73966 (arr!35633 (Array (_ BitVec 32) (_ BitVec 64))) (size!36169 (_ BitVec 32))) )
))
(declare-fun lt!505174 () array!73965)

(declare-fun getCurrentListMapNoExtraKeys!4530 (array!73965 array!73963 (_ BitVec 32) (_ BitVec 32) V!43195 V!43195 (_ BitVec 32) Int) ListLongMap!16061)

(assert (=> bm!49791 (= call!49796 (getCurrentListMapNoExtraKeys!4530 lt!505174 lt!505172 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136218 () Bool)

(declare-fun res!758368 () Bool)

(declare-fun e!646575 () Bool)

(assert (=> b!1136218 (=> (not res!758368) (not e!646575))))

(declare-fun _keys!1208 () array!73965)

(declare-fun _values!996 () array!73963)

(assert (=> b!1136218 (= res!758368 (and (= (size!36168 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36169 _keys!1208) (size!36168 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1136219 () Bool)

(declare-fun e!646573 () Bool)

(declare-fun tp_is_empty!28551 () Bool)

(assert (=> b!1136219 (= e!646573 tp_is_empty!28551)))

(declare-fun b!1136220 () Bool)

(declare-fun res!758358 () Bool)

(assert (=> b!1136220 (=> (not res!758358) (not e!646575))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1136220 (= res!758358 (= (select (arr!35633 _keys!1208) i!673) k0!934))))

(declare-fun b!1136221 () Bool)

(declare-fun e!646577 () Unit!37211)

(declare-fun lt!505170 () Unit!37211)

(assert (=> b!1136221 (= e!646577 lt!505170)))

(assert (=> b!1136221 (= lt!505170 call!49799)))

(assert (=> b!1136221 call!49801))

(declare-fun e!646579 () Bool)

(declare-fun b!1136223 () Bool)

(declare-fun arrayContainsKey!0 (array!73965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136223 (= e!646579 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136224 () Bool)

(declare-fun e!646584 () Bool)

(declare-fun e!646587 () Bool)

(assert (=> b!1136224 (= e!646584 (not e!646587))))

(declare-fun res!758352 () Bool)

(assert (=> b!1136224 (=> res!758352 e!646587)))

(assert (=> b!1136224 (= res!758352 (bvsgt from!1455 i!673))))

(assert (=> b!1136224 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505168 () Unit!37211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73965 (_ BitVec 64) (_ BitVec 32)) Unit!37211)

(assert (=> b!1136224 (= lt!505168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1136225 () Bool)

(declare-fun e!646583 () Bool)

(declare-fun mapRes!44651 () Bool)

(assert (=> b!1136225 (= e!646583 (and e!646573 mapRes!44651))))

(declare-fun condMapEmpty!44651 () Bool)

(declare-fun mapDefault!44651 () ValueCell!13566)

(assert (=> b!1136225 (= condMapEmpty!44651 (= (arr!35632 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13566)) mapDefault!44651)))))

(declare-fun b!1136226 () Bool)

(declare-fun res!758364 () Bool)

(assert (=> b!1136226 (=> (not res!758364) (not e!646575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136226 (= res!758364 (validKeyInArray!0 k0!934))))

(declare-fun e!646586 () Bool)

(declare-fun b!1136227 () Bool)

(declare-fun lt!505178 () Bool)

(assert (=> b!1136227 (= e!646586 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505178) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136228 () Bool)

(declare-fun res!758359 () Bool)

(declare-fun e!646571 () Bool)

(assert (=> b!1136228 (=> res!758359 e!646571)))

(declare-datatypes ((List!24852 0))(
  ( (Nil!24849) (Cons!24848 (h!26057 (_ BitVec 64)) (t!35865 List!24852)) )
))
(declare-fun noDuplicate!1602 (List!24852) Bool)

(assert (=> b!1136228 (= res!758359 (not (noDuplicate!1602 Nil!24849)))))

(declare-fun b!1136229 () Bool)

(declare-fun res!758360 () Bool)

(assert (=> b!1136229 (=> (not res!758360) (not e!646575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136229 (= res!758360 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44651 () Bool)

(declare-fun tp!84774 () Bool)

(declare-fun e!646574 () Bool)

(assert (=> mapNonEmpty!44651 (= mapRes!44651 (and tp!84774 e!646574))))

(declare-fun mapValue!44651 () ValueCell!13566)

(declare-fun mapKey!44651 () (_ BitVec 32))

(declare-fun mapRest!44651 () (Array (_ BitVec 32) ValueCell!13566))

(assert (=> mapNonEmpty!44651 (= (arr!35632 _values!996) (store mapRest!44651 mapKey!44651 mapValue!44651))))

(declare-fun b!1136230 () Bool)

(declare-fun e!646581 () Bool)

(declare-fun e!646572 () Bool)

(assert (=> b!1136230 (= e!646581 e!646572)))

(declare-fun res!758366 () Bool)

(assert (=> b!1136230 (=> res!758366 e!646572)))

(assert (=> b!1136230 (= res!758366 (not (= (select (arr!35633 _keys!1208) from!1455) k0!934)))))

(declare-fun e!646580 () Bool)

(assert (=> b!1136230 e!646580))

(declare-fun c!111063 () Bool)

(assert (=> b!1136230 (= c!111063 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505181 () Unit!37211)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!456 (array!73965 array!73963 (_ BitVec 32) (_ BitVec 32) V!43195 V!43195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37211)

(assert (=> b!1136230 (= lt!505181 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136231 () Bool)

(assert (=> b!1136231 (= e!646587 e!646581)))

(declare-fun res!758365 () Bool)

(assert (=> b!1136231 (=> res!758365 e!646581)))

(assert (=> b!1136231 (= res!758365 (not (= from!1455 i!673)))))

(declare-fun lt!505173 () ListLongMap!16061)

(assert (=> b!1136231 (= lt!505173 (getCurrentListMapNoExtraKeys!4530 lt!505174 lt!505172 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2589 (Int (_ BitVec 64)) V!43195)

(assert (=> b!1136231 (= lt!505172 (array!73964 (store (arr!35632 _values!996) i!673 (ValueCellFull!13566 (dynLambda!2589 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36168 _values!996)))))

(declare-fun lt!505166 () ListLongMap!16061)

(assert (=> b!1136231 (= lt!505166 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!505182 () ListLongMap!16061)

(declare-fun c!111062 () Bool)

(declare-fun bm!49792 () Bool)

(declare-fun c!111060 () Bool)

(declare-fun call!49794 () Unit!37211)

(declare-fun addStillContains!743 (ListLongMap!16061 (_ BitVec 64) V!43195 (_ BitVec 64)) Unit!37211)

(assert (=> bm!49792 (= call!49794 (addStillContains!743 lt!505182 (ite (or c!111060 c!111062) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111060 c!111062) zeroValue!944 minValue!944) k0!934))))

(declare-fun call!49798 () ListLongMap!16061)

(declare-fun bm!49793 () Bool)

(declare-fun call!49795 () Bool)

(declare-fun lt!505171 () ListLongMap!16061)

(declare-fun contains!6581 (ListLongMap!16061 (_ BitVec 64)) Bool)

(assert (=> bm!49793 (= call!49795 (contains!6581 (ite c!111060 lt!505171 call!49798) k0!934))))

(declare-fun b!1136232 () Bool)

(declare-fun res!758354 () Bool)

(assert (=> b!1136232 (=> (not res!758354) (not e!646575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73965 (_ BitVec 32)) Bool)

(assert (=> b!1136232 (= res!758354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136233 () Bool)

(declare-fun call!49800 () ListLongMap!16061)

(assert (=> b!1136233 (= e!646580 (= call!49796 call!49800))))

(declare-fun b!1136234 () Bool)

(assert (=> b!1136234 (= e!646575 e!646584)))

(declare-fun res!758361 () Bool)

(assert (=> b!1136234 (=> (not res!758361) (not e!646584))))

(assert (=> b!1136234 (= res!758361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505174 mask!1564))))

(assert (=> b!1136234 (= lt!505174 (array!73966 (store (arr!35633 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36169 _keys!1208)))))

(declare-fun b!1136235 () Bool)

(declare-fun e!646582 () Bool)

(assert (=> b!1136235 (= e!646582 e!646571)))

(declare-fun res!758353 () Bool)

(assert (=> b!1136235 (=> res!758353 e!646571)))

(assert (=> b!1136235 (= res!758353 (or (bvsge (size!36169 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36169 _keys!1208)) (bvsge from!1455 (size!36169 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!73965 (_ BitVec 32) List!24852) Bool)

(assert (=> b!1136235 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24849)))

(declare-fun lt!505177 () Unit!37211)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73965 (_ BitVec 32) (_ BitVec 32)) Unit!37211)

(assert (=> b!1136235 (= lt!505177 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1136235 e!646579))

(declare-fun res!758357 () Bool)

(assert (=> b!1136235 (=> (not res!758357) (not e!646579))))

(assert (=> b!1136235 (= res!758357 e!646586)))

(declare-fun c!111061 () Bool)

(assert (=> b!1136235 (= c!111061 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505169 () Unit!37211)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!348 (array!73965 array!73963 (_ BitVec 32) (_ BitVec 32) V!43195 V!43195 (_ BitVec 64) (_ BitVec 32) Int) Unit!37211)

(assert (=> b!1136235 (= lt!505169 (lemmaListMapContainsThenArrayContainsFrom!348 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505179 () Unit!37211)

(declare-fun e!646585 () Unit!37211)

(assert (=> b!1136235 (= lt!505179 e!646585)))

(assert (=> b!1136235 (= c!111060 (and (not lt!505178) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136235 (= lt!505178 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1136236 () Bool)

(declare-fun res!758369 () Bool)

(assert (=> b!1136236 (=> (not res!758369) (not e!646584))))

(assert (=> b!1136236 (= res!758369 (arrayNoDuplicates!0 lt!505174 #b00000000000000000000000000000000 Nil!24849))))

(declare-fun b!1136237 () Bool)

(assert (=> b!1136237 (= e!646572 e!646582)))

(declare-fun res!758356 () Bool)

(assert (=> b!1136237 (=> res!758356 e!646582)))

(assert (=> b!1136237 (= res!758356 (not (contains!6581 lt!505182 k0!934)))))

(assert (=> b!1136237 (= lt!505182 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49794 () Bool)

(assert (=> bm!49794 (= call!49801 call!49795)))

(declare-fun bm!49795 () Bool)

(assert (=> bm!49795 (= call!49800 (getCurrentListMapNoExtraKeys!4530 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136238 () Bool)

(declare-fun res!758355 () Bool)

(assert (=> b!1136238 (=> (not res!758355) (not e!646575))))

(assert (=> b!1136238 (= res!758355 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24849))))

(declare-fun mapIsEmpty!44651 () Bool)

(assert (=> mapIsEmpty!44651 mapRes!44651))

(declare-fun res!758363 () Bool)

(assert (=> start!98416 (=> (not res!758363) (not e!646575))))

(assert (=> start!98416 (= res!758363 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36169 _keys!1208))))))

(assert (=> start!98416 e!646575))

(assert (=> start!98416 tp_is_empty!28551))

(declare-fun array_inv!27322 (array!73965) Bool)

(assert (=> start!98416 (array_inv!27322 _keys!1208)))

(assert (=> start!98416 true))

(assert (=> start!98416 tp!84773))

(declare-fun array_inv!27323 (array!73963) Bool)

(assert (=> start!98416 (and (array_inv!27323 _values!996) e!646583)))

(declare-fun b!1136222 () Bool)

(assert (=> b!1136222 (= e!646574 tp_is_empty!28551)))

(declare-fun b!1136239 () Bool)

(assert (=> b!1136239 (= e!646571 true)))

(declare-fun lt!505176 () Bool)

(declare-fun contains!6582 (List!24852 (_ BitVec 64)) Bool)

(assert (=> b!1136239 (= lt!505176 (contains!6582 Nil!24849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49796 () Bool)

(declare-fun call!49797 () ListLongMap!16061)

(declare-fun +!3482 (ListLongMap!16061 tuple2!18092) ListLongMap!16061)

(assert (=> bm!49796 (= call!49797 (+!3482 (ite c!111060 lt!505171 lt!505182) (ite c!111060 (tuple2!18093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111062 (tuple2!18093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1136240 () Bool)

(declare-fun lt!505167 () Unit!37211)

(assert (=> b!1136240 (= e!646585 lt!505167)))

(declare-fun lt!505175 () Unit!37211)

(assert (=> b!1136240 (= lt!505175 call!49794)))

(assert (=> b!1136240 (= lt!505171 (+!3482 lt!505182 (tuple2!18093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1136240 call!49795))

(assert (=> b!1136240 (= lt!505167 (addStillContains!743 lt!505171 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1136240 (contains!6581 call!49797 k0!934)))

(declare-fun b!1136241 () Bool)

(declare-fun Unit!37213 () Unit!37211)

(assert (=> b!1136241 (= e!646577 Unit!37213)))

(declare-fun b!1136242 () Bool)

(declare-fun res!758362 () Bool)

(assert (=> b!1136242 (=> res!758362 e!646571)))

(assert (=> b!1136242 (= res!758362 (contains!6582 Nil!24849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49797 () Bool)

(assert (=> bm!49797 (= call!49798 call!49797)))

(declare-fun b!1136243 () Bool)

(declare-fun c!111064 () Bool)

(assert (=> b!1136243 (= c!111064 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505178))))

(assert (=> b!1136243 (= e!646576 e!646577)))

(declare-fun b!1136244 () Bool)

(assert (=> b!1136244 (= e!646585 e!646576)))

(assert (=> b!1136244 (= c!111062 (and (not lt!505178) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1136245 () Bool)

(assert (=> b!1136245 (= e!646586 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49798 () Bool)

(assert (=> bm!49798 (= call!49799 call!49794)))

(declare-fun b!1136246 () Bool)

(declare-fun -!1207 (ListLongMap!16061 (_ BitVec 64)) ListLongMap!16061)

(assert (=> b!1136246 (= e!646580 (= call!49796 (-!1207 call!49800 k0!934)))))

(declare-fun b!1136247 () Bool)

(declare-fun res!758367 () Bool)

(assert (=> b!1136247 (=> (not res!758367) (not e!646575))))

(assert (=> b!1136247 (= res!758367 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36169 _keys!1208))))))

(assert (= (and start!98416 res!758363) b!1136229))

(assert (= (and b!1136229 res!758360) b!1136218))

(assert (= (and b!1136218 res!758368) b!1136232))

(assert (= (and b!1136232 res!758354) b!1136238))

(assert (= (and b!1136238 res!758355) b!1136247))

(assert (= (and b!1136247 res!758367) b!1136226))

(assert (= (and b!1136226 res!758364) b!1136220))

(assert (= (and b!1136220 res!758358) b!1136234))

(assert (= (and b!1136234 res!758361) b!1136236))

(assert (= (and b!1136236 res!758369) b!1136224))

(assert (= (and b!1136224 (not res!758352)) b!1136231))

(assert (= (and b!1136231 (not res!758365)) b!1136230))

(assert (= (and b!1136230 c!111063) b!1136246))

(assert (= (and b!1136230 (not c!111063)) b!1136233))

(assert (= (or b!1136246 b!1136233) bm!49791))

(assert (= (or b!1136246 b!1136233) bm!49795))

(assert (= (and b!1136230 (not res!758366)) b!1136237))

(assert (= (and b!1136237 (not res!758356)) b!1136235))

(assert (= (and b!1136235 c!111060) b!1136240))

(assert (= (and b!1136235 (not c!111060)) b!1136244))

(assert (= (and b!1136244 c!111062) b!1136217))

(assert (= (and b!1136244 (not c!111062)) b!1136243))

(assert (= (and b!1136243 c!111064) b!1136221))

(assert (= (and b!1136243 (not c!111064)) b!1136241))

(assert (= (or b!1136217 b!1136221) bm!49798))

(assert (= (or b!1136217 b!1136221) bm!49797))

(assert (= (or b!1136217 b!1136221) bm!49794))

(assert (= (or b!1136240 bm!49794) bm!49793))

(assert (= (or b!1136240 bm!49798) bm!49792))

(assert (= (or b!1136240 bm!49797) bm!49796))

(assert (= (and b!1136235 c!111061) b!1136245))

(assert (= (and b!1136235 (not c!111061)) b!1136227))

(assert (= (and b!1136235 res!758357) b!1136223))

(assert (= (and b!1136235 (not res!758353)) b!1136228))

(assert (= (and b!1136228 (not res!758359)) b!1136242))

(assert (= (and b!1136242 (not res!758362)) b!1136239))

(assert (= (and b!1136225 condMapEmpty!44651) mapIsEmpty!44651))

(assert (= (and b!1136225 (not condMapEmpty!44651)) mapNonEmpty!44651))

(get-info :version)

(assert (= (and mapNonEmpty!44651 ((_ is ValueCellFull!13566) mapValue!44651)) b!1136222))

(assert (= (and b!1136225 ((_ is ValueCellFull!13566) mapDefault!44651)) b!1136219))

(assert (= start!98416 b!1136225))

(declare-fun b_lambda!19127 () Bool)

(assert (=> (not b_lambda!19127) (not b!1136231)))

(declare-fun t!35863 () Bool)

(declare-fun tb!8833 () Bool)

(assert (=> (and start!98416 (= defaultEntry!1004 defaultEntry!1004) t!35863) tb!8833))

(declare-fun result!18231 () Bool)

(assert (=> tb!8833 (= result!18231 tp_is_empty!28551)))

(assert (=> b!1136231 t!35863))

(declare-fun b_and!38893 () Bool)

(assert (= b_and!38891 (and (=> t!35863 result!18231) b_and!38893)))

(declare-fun m!1048593 () Bool)

(assert (=> bm!49791 m!1048593))

(declare-fun m!1048595 () Bool)

(assert (=> b!1136246 m!1048595))

(declare-fun m!1048597 () Bool)

(assert (=> b!1136220 m!1048597))

(declare-fun m!1048599 () Bool)

(assert (=> b!1136229 m!1048599))

(declare-fun m!1048601 () Bool)

(assert (=> bm!49796 m!1048601))

(declare-fun m!1048603 () Bool)

(assert (=> start!98416 m!1048603))

(declare-fun m!1048605 () Bool)

(assert (=> start!98416 m!1048605))

(declare-fun m!1048607 () Bool)

(assert (=> b!1136226 m!1048607))

(declare-fun m!1048609 () Bool)

(assert (=> b!1136242 m!1048609))

(declare-fun m!1048611 () Bool)

(assert (=> b!1136238 m!1048611))

(declare-fun m!1048613 () Bool)

(assert (=> bm!49792 m!1048613))

(declare-fun m!1048615 () Bool)

(assert (=> bm!49795 m!1048615))

(declare-fun m!1048617 () Bool)

(assert (=> b!1136223 m!1048617))

(declare-fun m!1048619 () Bool)

(assert (=> b!1136224 m!1048619))

(declare-fun m!1048621 () Bool)

(assert (=> b!1136224 m!1048621))

(declare-fun m!1048623 () Bool)

(assert (=> mapNonEmpty!44651 m!1048623))

(declare-fun m!1048625 () Bool)

(assert (=> b!1136228 m!1048625))

(declare-fun m!1048627 () Bool)

(assert (=> b!1136232 m!1048627))

(declare-fun m!1048629 () Bool)

(assert (=> b!1136236 m!1048629))

(declare-fun m!1048631 () Bool)

(assert (=> b!1136239 m!1048631))

(declare-fun m!1048633 () Bool)

(assert (=> b!1136230 m!1048633))

(declare-fun m!1048635 () Bool)

(assert (=> b!1136230 m!1048635))

(declare-fun m!1048637 () Bool)

(assert (=> b!1136235 m!1048637))

(declare-fun m!1048639 () Bool)

(assert (=> b!1136235 m!1048639))

(declare-fun m!1048641 () Bool)

(assert (=> b!1136235 m!1048641))

(assert (=> b!1136245 m!1048617))

(declare-fun m!1048643 () Bool)

(assert (=> b!1136231 m!1048643))

(declare-fun m!1048645 () Bool)

(assert (=> b!1136231 m!1048645))

(declare-fun m!1048647 () Bool)

(assert (=> b!1136231 m!1048647))

(declare-fun m!1048649 () Bool)

(assert (=> b!1136231 m!1048649))

(declare-fun m!1048651 () Bool)

(assert (=> b!1136237 m!1048651))

(assert (=> b!1136237 m!1048615))

(declare-fun m!1048653 () Bool)

(assert (=> b!1136240 m!1048653))

(declare-fun m!1048655 () Bool)

(assert (=> b!1136240 m!1048655))

(declare-fun m!1048657 () Bool)

(assert (=> b!1136240 m!1048657))

(declare-fun m!1048659 () Bool)

(assert (=> bm!49793 m!1048659))

(declare-fun m!1048661 () Bool)

(assert (=> b!1136234 m!1048661))

(declare-fun m!1048663 () Bool)

(assert (=> b!1136234 m!1048663))

(check-sat (not b!1136239) (not b!1136246) (not b!1136228) (not bm!49796) (not b!1136232) (not b!1136226) (not b_lambda!19127) (not bm!49793) (not b!1136234) (not b!1136224) (not b_next!24021) (not b!1136229) (not b!1136223) (not b!1136236) (not b!1136237) (not start!98416) (not b!1136240) (not b!1136245) b_and!38893 (not b!1136238) (not mapNonEmpty!44651) (not bm!49795) (not bm!49792) (not b!1136231) (not b!1136230) (not b!1136235) (not b!1136242) (not bm!49791) tp_is_empty!28551)
(check-sat b_and!38893 (not b_next!24021))
