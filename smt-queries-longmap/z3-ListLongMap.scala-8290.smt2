; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101014 () Bool)

(assert start!101014)

(declare-fun b_free!26013 () Bool)

(declare-fun b_next!26013 () Bool)

(assert (=> start!101014 (= b_free!26013 (not b_next!26013))))

(declare-fun tp!91054 () Bool)

(declare-fun b_and!43107 () Bool)

(assert (=> start!101014 (= tp!91054 b_and!43107)))

(declare-fun b!1210303 () Bool)

(declare-datatypes ((Unit!40119 0))(
  ( (Unit!40120) )
))
(declare-fun e!687370 () Unit!40119)

(declare-fun e!687369 () Unit!40119)

(assert (=> b!1210303 (= e!687370 e!687369)))

(declare-fun c!119231 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!549495 () Bool)

(assert (=> b!1210303 (= c!119231 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549495))))

(declare-fun b!1210304 () Bool)

(declare-fun e!687363 () Unit!40119)

(declare-fun Unit!40121 () Unit!40119)

(assert (=> b!1210304 (= e!687363 Unit!40121)))

(declare-fun bm!59594 () Bool)

(declare-datatypes ((V!46083 0))(
  ( (V!46084 (val!15415 Int)) )
))
(declare-datatypes ((tuple2!19796 0))(
  ( (tuple2!19797 (_1!9909 (_ BitVec 64)) (_2!9909 V!46083)) )
))
(declare-datatypes ((List!26597 0))(
  ( (Nil!26594) (Cons!26593 (h!27802 tuple2!19796) (t!39590 List!26597)) )
))
(declare-datatypes ((ListLongMap!17765 0))(
  ( (ListLongMap!17766 (toList!8898 List!26597)) )
))
(declare-fun call!59604 () ListLongMap!17765)

(declare-fun call!59599 () ListLongMap!17765)

(assert (=> bm!59594 (= call!59604 call!59599)))

(declare-fun call!59597 () ListLongMap!17765)

(declare-fun e!687362 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1210305 () Bool)

(declare-fun call!59603 () ListLongMap!17765)

(declare-fun -!1848 (ListLongMap!17765 (_ BitVec 64)) ListLongMap!17765)

(assert (=> b!1210305 (= e!687362 (= call!59597 (-!1848 call!59603 k0!934)))))

(declare-fun bm!59595 () Bool)

(declare-fun call!59601 () Bool)

(declare-fun call!59598 () Bool)

(assert (=> bm!59595 (= call!59601 call!59598)))

(declare-fun e!687360 () Bool)

(declare-fun b!1210306 () Bool)

(assert (=> b!1210306 (= e!687360 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549495) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210307 () Bool)

(declare-fun res!804256 () Bool)

(declare-fun e!687361 () Bool)

(assert (=> b!1210307 (=> (not res!804256) (not e!687361))))

(declare-datatypes ((array!78219 0))(
  ( (array!78220 (arr!37746 (Array (_ BitVec 32) (_ BitVec 64))) (size!38282 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78219)

(declare-datatypes ((List!26598 0))(
  ( (Nil!26595) (Cons!26594 (h!27803 (_ BitVec 64)) (t!39591 List!26598)) )
))
(declare-fun arrayNoDuplicates!0 (array!78219 (_ BitVec 32) List!26598) Bool)

(assert (=> b!1210307 (= res!804256 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26595))))

(declare-fun b!1210308 () Bool)

(declare-fun e!687367 () Bool)

(declare-fun tp_is_empty!30717 () Bool)

(assert (=> b!1210308 (= e!687367 tp_is_empty!30717)))

(declare-fun b!1210309 () Bool)

(assert (=> b!1210309 (= e!687362 (= call!59597 call!59603))))

(declare-fun zeroValue!944 () V!46083)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59596 () Bool)

(declare-fun lt!549503 () array!78219)

(declare-fun minValue!944 () V!46083)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14649 0))(
  ( (ValueCellFull!14649 (v!18066 V!46083)) (EmptyCell!14649) )
))
(declare-datatypes ((array!78221 0))(
  ( (array!78222 (arr!37747 (Array (_ BitVec 32) ValueCell!14649)) (size!38283 (_ BitVec 32))) )
))
(declare-fun lt!549500 () array!78221)

(declare-fun getCurrentListMapNoExtraKeys!5331 (array!78219 array!78221 (_ BitVec 32) (_ BitVec 32) V!46083 V!46083 (_ BitVec 32) Int) ListLongMap!17765)

(assert (=> bm!59596 (= call!59597 (getCurrentListMapNoExtraKeys!5331 lt!549503 lt!549500 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210310 () Bool)

(declare-fun Unit!40122 () Unit!40119)

(assert (=> b!1210310 (= e!687369 Unit!40122)))

(declare-fun b!1210311 () Bool)

(assert (=> b!1210311 call!59601))

(declare-fun lt!549504 () Unit!40119)

(declare-fun call!59602 () Unit!40119)

(assert (=> b!1210311 (= lt!549504 call!59602)))

(assert (=> b!1210311 (= e!687369 lt!549504)))

(declare-fun bm!59597 () Bool)

(declare-fun lt!549496 () ListLongMap!17765)

(declare-fun c!119230 () Bool)

(declare-fun contains!6969 (ListLongMap!17765 (_ BitVec 64)) Bool)

(assert (=> bm!59597 (= call!59598 (contains!6969 (ite c!119230 lt!549496 call!59604) k0!934))))

(declare-fun b!1210312 () Bool)

(declare-fun e!687359 () Bool)

(declare-fun arrayContainsKey!0 (array!78219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210312 (= e!687359 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59598 () Bool)

(declare-fun call!59600 () Unit!40119)

(assert (=> bm!59598 (= call!59602 call!59600)))

(declare-fun b!1210313 () Bool)

(declare-fun res!804245 () Bool)

(assert (=> b!1210313 (=> (not res!804245) (not e!687361))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210313 (= res!804245 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38282 _keys!1208))))))

(declare-fun b!1210314 () Bool)

(declare-fun e!687365 () Bool)

(declare-fun e!687372 () Bool)

(assert (=> b!1210314 (= e!687365 e!687372)))

(declare-fun res!804249 () Bool)

(assert (=> b!1210314 (=> res!804249 e!687372)))

(assert (=> b!1210314 (= res!804249 (not (= from!1455 i!673)))))

(declare-fun lt!549488 () ListLongMap!17765)

(assert (=> b!1210314 (= lt!549488 (getCurrentListMapNoExtraKeys!5331 lt!549503 lt!549500 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78221)

(declare-fun dynLambda!3229 (Int (_ BitVec 64)) V!46083)

(assert (=> b!1210314 (= lt!549500 (array!78222 (store (arr!37747 _values!996) i!673 (ValueCellFull!14649 (dynLambda!3229 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38283 _values!996)))))

(declare-fun lt!549498 () ListLongMap!17765)

(assert (=> b!1210314 (= lt!549498 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47944 () Bool)

(declare-fun mapRes!47944 () Bool)

(assert (=> mapIsEmpty!47944 mapRes!47944))

(declare-fun b!1210315 () Bool)

(declare-fun Unit!40123 () Unit!40119)

(assert (=> b!1210315 (= e!687363 Unit!40123)))

(assert (=> b!1210315 (= lt!549495 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1210315 (= c!119230 (and (not lt!549495) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549502 () Unit!40119)

(declare-fun e!687371 () Unit!40119)

(assert (=> b!1210315 (= lt!549502 e!687371)))

(declare-fun lt!549497 () Unit!40119)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!596 (array!78219 array!78221 (_ BitVec 32) (_ BitVec 32) V!46083 V!46083 (_ BitVec 64) (_ BitVec 32) Int) Unit!40119)

(assert (=> b!1210315 (= lt!549497 (lemmaListMapContainsThenArrayContainsFrom!596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119232 () Bool)

(assert (=> b!1210315 (= c!119232 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804246 () Bool)

(assert (=> b!1210315 (= res!804246 e!687360)))

(assert (=> b!1210315 (=> (not res!804246) (not e!687359))))

(assert (=> b!1210315 e!687359))

(declare-fun lt!549501 () Unit!40119)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78219 (_ BitVec 32) (_ BitVec 32)) Unit!40119)

(assert (=> b!1210315 (= lt!549501 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210315 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26595)))

(declare-fun lt!549493 () Unit!40119)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78219 (_ BitVec 64) (_ BitVec 32) List!26598) Unit!40119)

(assert (=> b!1210315 (= lt!549493 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26595))))

(assert (=> b!1210315 false))

(declare-fun res!804250 () Bool)

(assert (=> start!101014 (=> (not res!804250) (not e!687361))))

(assert (=> start!101014 (= res!804250 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38282 _keys!1208))))))

(assert (=> start!101014 e!687361))

(assert (=> start!101014 tp_is_empty!30717))

(declare-fun array_inv!28754 (array!78219) Bool)

(assert (=> start!101014 (array_inv!28754 _keys!1208)))

(assert (=> start!101014 true))

(assert (=> start!101014 tp!91054))

(declare-fun e!687366 () Bool)

(declare-fun array_inv!28755 (array!78221) Bool)

(assert (=> start!101014 (and (array_inv!28755 _values!996) e!687366)))

(declare-fun b!1210316 () Bool)

(declare-fun e!687373 () Bool)

(assert (=> b!1210316 (= e!687361 e!687373)))

(declare-fun res!804247 () Bool)

(assert (=> b!1210316 (=> (not res!804247) (not e!687373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78219 (_ BitVec 32)) Bool)

(assert (=> b!1210316 (= res!804247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549503 mask!1564))))

(assert (=> b!1210316 (= lt!549503 (array!78220 (store (arr!37746 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38282 _keys!1208)))))

(declare-fun b!1210317 () Bool)

(declare-fun res!804257 () Bool)

(assert (=> b!1210317 (=> (not res!804257) (not e!687361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210317 (= res!804257 (validKeyInArray!0 k0!934))))

(declare-fun b!1210318 () Bool)

(declare-fun res!804253 () Bool)

(assert (=> b!1210318 (=> (not res!804253) (not e!687361))))

(assert (=> b!1210318 (= res!804253 (= (select (arr!37746 _keys!1208) i!673) k0!934))))

(declare-fun b!1210319 () Bool)

(declare-fun res!804258 () Bool)

(assert (=> b!1210319 (=> (not res!804258) (not e!687361))))

(assert (=> b!1210319 (= res!804258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210320 () Bool)

(assert (=> b!1210320 (= e!687366 (and e!687367 mapRes!47944))))

(declare-fun condMapEmpty!47944 () Bool)

(declare-fun mapDefault!47944 () ValueCell!14649)

(assert (=> b!1210320 (= condMapEmpty!47944 (= (arr!37747 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14649)) mapDefault!47944)))))

(declare-fun b!1210321 () Bool)

(declare-fun res!804252 () Bool)

(assert (=> b!1210321 (=> (not res!804252) (not e!687361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210321 (= res!804252 (validMask!0 mask!1564))))

(declare-fun b!1210322 () Bool)

(assert (=> b!1210322 (= e!687373 (not e!687365))))

(declare-fun res!804255 () Bool)

(assert (=> b!1210322 (=> res!804255 e!687365)))

(assert (=> b!1210322 (= res!804255 (bvsgt from!1455 i!673))))

(assert (=> b!1210322 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549490 () Unit!40119)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78219 (_ BitVec 64) (_ BitVec 32)) Unit!40119)

(assert (=> b!1210322 (= lt!549490 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1210323 () Bool)

(declare-fun e!687368 () Bool)

(assert (=> b!1210323 (= e!687372 e!687368)))

(declare-fun res!804248 () Bool)

(assert (=> b!1210323 (=> res!804248 e!687368)))

(assert (=> b!1210323 (= res!804248 (not (= (select (arr!37746 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1210323 e!687362))

(declare-fun c!119229 () Bool)

(assert (=> b!1210323 (= c!119229 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549492 () Unit!40119)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1059 (array!78219 array!78221 (_ BitVec 32) (_ BitVec 32) V!46083 V!46083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40119)

(assert (=> b!1210323 (= lt!549492 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1059 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210324 () Bool)

(declare-fun lt!549505 () Unit!40119)

(assert (=> b!1210324 (= e!687370 lt!549505)))

(assert (=> b!1210324 (= lt!549505 call!59602)))

(assert (=> b!1210324 call!59601))

(declare-fun b!1210325 () Bool)

(assert (=> b!1210325 (= e!687360 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210326 () Bool)

(declare-fun res!804251 () Bool)

(assert (=> b!1210326 (=> (not res!804251) (not e!687361))))

(assert (=> b!1210326 (= res!804251 (and (= (size!38283 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38282 _keys!1208) (size!38283 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210327 () Bool)

(declare-fun res!804254 () Bool)

(assert (=> b!1210327 (=> (not res!804254) (not e!687373))))

(assert (=> b!1210327 (= res!804254 (arrayNoDuplicates!0 lt!549503 #b00000000000000000000000000000000 Nil!26595))))

(declare-fun b!1210328 () Bool)

(declare-fun +!4016 (ListLongMap!17765 tuple2!19796) ListLongMap!17765)

(assert (=> b!1210328 (contains!6969 (+!4016 lt!549496 (tuple2!19797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!549494 () Unit!40119)

(assert (=> b!1210328 (= lt!549494 call!59600)))

(assert (=> b!1210328 call!59598))

(assert (=> b!1210328 (= lt!549496 call!59599)))

(declare-fun lt!549489 () ListLongMap!17765)

(declare-fun lt!549491 () Unit!40119)

(declare-fun addStillContains!1044 (ListLongMap!17765 (_ BitVec 64) V!46083 (_ BitVec 64)) Unit!40119)

(assert (=> b!1210328 (= lt!549491 (addStillContains!1044 lt!549489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1210328 (= e!687371 lt!549494)))

(declare-fun bm!59599 () Bool)

(declare-fun c!119233 () Bool)

(assert (=> bm!59599 (= call!59600 (addStillContains!1044 (ite c!119230 lt!549496 lt!549489) (ite c!119230 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119233 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119230 minValue!944 (ite c!119233 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!59600 () Bool)

(assert (=> bm!59600 (= call!59603 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59601 () Bool)

(assert (=> bm!59601 (= call!59599 (+!4016 lt!549489 (ite (or c!119230 c!119233) (tuple2!19797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1210329 () Bool)

(declare-fun e!687364 () Bool)

(assert (=> b!1210329 (= e!687364 tp_is_empty!30717)))

(declare-fun b!1210330 () Bool)

(assert (=> b!1210330 (= c!119233 (and (not lt!549495) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1210330 (= e!687371 e!687370)))

(declare-fun mapNonEmpty!47944 () Bool)

(declare-fun tp!91055 () Bool)

(assert (=> mapNonEmpty!47944 (= mapRes!47944 (and tp!91055 e!687364))))

(declare-fun mapValue!47944 () ValueCell!14649)

(declare-fun mapKey!47944 () (_ BitVec 32))

(declare-fun mapRest!47944 () (Array (_ BitVec 32) ValueCell!14649))

(assert (=> mapNonEmpty!47944 (= (arr!37747 _values!996) (store mapRest!47944 mapKey!47944 mapValue!47944))))

(declare-fun b!1210331 () Bool)

(assert (=> b!1210331 (= e!687368 (bvslt from!1455 (size!38283 _values!996)))))

(declare-fun lt!549499 () Unit!40119)

(assert (=> b!1210331 (= lt!549499 e!687363)))

(declare-fun c!119234 () Bool)

(assert (=> b!1210331 (= c!119234 (contains!6969 lt!549489 k0!934))))

(assert (=> b!1210331 (= lt!549489 (getCurrentListMapNoExtraKeys!5331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101014 res!804250) b!1210321))

(assert (= (and b!1210321 res!804252) b!1210326))

(assert (= (and b!1210326 res!804251) b!1210319))

(assert (= (and b!1210319 res!804258) b!1210307))

(assert (= (and b!1210307 res!804256) b!1210313))

(assert (= (and b!1210313 res!804245) b!1210317))

(assert (= (and b!1210317 res!804257) b!1210318))

(assert (= (and b!1210318 res!804253) b!1210316))

(assert (= (and b!1210316 res!804247) b!1210327))

(assert (= (and b!1210327 res!804254) b!1210322))

(assert (= (and b!1210322 (not res!804255)) b!1210314))

(assert (= (and b!1210314 (not res!804249)) b!1210323))

(assert (= (and b!1210323 c!119229) b!1210305))

(assert (= (and b!1210323 (not c!119229)) b!1210309))

(assert (= (or b!1210305 b!1210309) bm!59596))

(assert (= (or b!1210305 b!1210309) bm!59600))

(assert (= (and b!1210323 (not res!804248)) b!1210331))

(assert (= (and b!1210331 c!119234) b!1210315))

(assert (= (and b!1210331 (not c!119234)) b!1210304))

(assert (= (and b!1210315 c!119230) b!1210328))

(assert (= (and b!1210315 (not c!119230)) b!1210330))

(assert (= (and b!1210330 c!119233) b!1210324))

(assert (= (and b!1210330 (not c!119233)) b!1210303))

(assert (= (and b!1210303 c!119231) b!1210311))

(assert (= (and b!1210303 (not c!119231)) b!1210310))

(assert (= (or b!1210324 b!1210311) bm!59598))

(assert (= (or b!1210324 b!1210311) bm!59594))

(assert (= (or b!1210324 b!1210311) bm!59595))

(assert (= (or b!1210328 bm!59595) bm!59597))

(assert (= (or b!1210328 bm!59598) bm!59599))

(assert (= (or b!1210328 bm!59594) bm!59601))

(assert (= (and b!1210315 c!119232) b!1210325))

(assert (= (and b!1210315 (not c!119232)) b!1210306))

(assert (= (and b!1210315 res!804246) b!1210312))

(assert (= (and b!1210320 condMapEmpty!47944) mapIsEmpty!47944))

(assert (= (and b!1210320 (not condMapEmpty!47944)) mapNonEmpty!47944))

(get-info :version)

(assert (= (and mapNonEmpty!47944 ((_ is ValueCellFull!14649) mapValue!47944)) b!1210329))

(assert (= (and b!1210320 ((_ is ValueCellFull!14649) mapDefault!47944)) b!1210308))

(assert (= start!101014 b!1210320))

(declare-fun b_lambda!21613 () Bool)

(assert (=> (not b_lambda!21613) (not b!1210314)))

(declare-fun t!39589 () Bool)

(declare-fun tb!10813 () Bool)

(assert (=> (and start!101014 (= defaultEntry!1004 defaultEntry!1004) t!39589) tb!10813))

(declare-fun result!22219 () Bool)

(assert (=> tb!10813 (= result!22219 tp_is_empty!30717)))

(assert (=> b!1210314 t!39589))

(declare-fun b_and!43109 () Bool)

(assert (= b_and!43107 (and (=> t!39589 result!22219) b_and!43109)))

(declare-fun m!1115835 () Bool)

(assert (=> b!1210307 m!1115835))

(declare-fun m!1115837 () Bool)

(assert (=> b!1210318 m!1115837))

(declare-fun m!1115839 () Bool)

(assert (=> start!101014 m!1115839))

(declare-fun m!1115841 () Bool)

(assert (=> start!101014 m!1115841))

(declare-fun m!1115843 () Bool)

(assert (=> b!1210317 m!1115843))

(declare-fun m!1115845 () Bool)

(assert (=> b!1210323 m!1115845))

(declare-fun m!1115847 () Bool)

(assert (=> b!1210323 m!1115847))

(declare-fun m!1115849 () Bool)

(assert (=> b!1210327 m!1115849))

(declare-fun m!1115851 () Bool)

(assert (=> bm!59599 m!1115851))

(declare-fun m!1115853 () Bool)

(assert (=> b!1210305 m!1115853))

(declare-fun m!1115855 () Bool)

(assert (=> b!1210316 m!1115855))

(declare-fun m!1115857 () Bool)

(assert (=> b!1210316 m!1115857))

(declare-fun m!1115859 () Bool)

(assert (=> b!1210314 m!1115859))

(declare-fun m!1115861 () Bool)

(assert (=> b!1210314 m!1115861))

(declare-fun m!1115863 () Bool)

(assert (=> b!1210314 m!1115863))

(declare-fun m!1115865 () Bool)

(assert (=> b!1210314 m!1115865))

(declare-fun m!1115867 () Bool)

(assert (=> bm!59596 m!1115867))

(declare-fun m!1115869 () Bool)

(assert (=> bm!59600 m!1115869))

(declare-fun m!1115871 () Bool)

(assert (=> b!1210328 m!1115871))

(assert (=> b!1210328 m!1115871))

(declare-fun m!1115873 () Bool)

(assert (=> b!1210328 m!1115873))

(declare-fun m!1115875 () Bool)

(assert (=> b!1210328 m!1115875))

(declare-fun m!1115877 () Bool)

(assert (=> mapNonEmpty!47944 m!1115877))

(declare-fun m!1115879 () Bool)

(assert (=> b!1210325 m!1115879))

(declare-fun m!1115881 () Bool)

(assert (=> b!1210319 m!1115881))

(declare-fun m!1115883 () Bool)

(assert (=> bm!59597 m!1115883))

(declare-fun m!1115885 () Bool)

(assert (=> b!1210321 m!1115885))

(declare-fun m!1115887 () Bool)

(assert (=> b!1210315 m!1115887))

(declare-fun m!1115889 () Bool)

(assert (=> b!1210315 m!1115889))

(declare-fun m!1115891 () Bool)

(assert (=> b!1210315 m!1115891))

(declare-fun m!1115893 () Bool)

(assert (=> b!1210315 m!1115893))

(declare-fun m!1115895 () Bool)

(assert (=> bm!59601 m!1115895))

(declare-fun m!1115897 () Bool)

(assert (=> b!1210331 m!1115897))

(assert (=> b!1210331 m!1115869))

(assert (=> b!1210312 m!1115879))

(declare-fun m!1115899 () Bool)

(assert (=> b!1210322 m!1115899))

(declare-fun m!1115901 () Bool)

(assert (=> b!1210322 m!1115901))

(check-sat (not bm!59601) (not bm!59596) (not b!1210325) (not b!1210323) (not b!1210317) b_and!43109 (not b!1210316) (not b!1210307) (not mapNonEmpty!47944) (not b!1210321) (not b!1210319) (not b_next!26013) (not b!1210331) (not b_lambda!21613) (not bm!59599) (not bm!59600) (not b!1210315) (not b!1210328) (not bm!59597) (not b!1210305) (not b!1210312) (not b!1210327) tp_is_empty!30717 (not b!1210322) (not b!1210314) (not start!101014))
(check-sat b_and!43109 (not b_next!26013))
