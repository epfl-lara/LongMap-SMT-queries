; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98646 () Bool)

(assert start!98646)

(declare-fun b_free!24251 () Bool)

(declare-fun b_next!24251 () Bool)

(assert (=> start!98646 (= b_free!24251 (not b_next!24251))))

(declare-fun tp!85464 () Bool)

(declare-fun b_and!39351 () Bool)

(assert (=> start!98646 (= tp!85464 b_and!39351)))

(declare-fun b!1146558 () Bool)

(declare-fun e!652193 () Bool)

(declare-fun e!652199 () Bool)

(assert (=> b!1146558 (= e!652193 (not e!652199))))

(declare-fun res!763322 () Bool)

(assert (=> b!1146558 (=> res!763322 e!652199)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146558 (= res!763322 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74409 0))(
  ( (array!74410 (arr!35855 (Array (_ BitVec 32) (_ BitVec 64))) (size!36391 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74409)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146558 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37649 0))(
  ( (Unit!37650) )
))
(declare-fun lt!512112 () Unit!37649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74409 (_ BitVec 64) (_ BitVec 32)) Unit!37649)

(assert (=> b!1146558 (= lt!512112 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1146559 () Bool)

(declare-fun res!763316 () Bool)

(declare-fun e!652198 () Bool)

(assert (=> b!1146559 (=> (not res!763316) (not e!652198))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146559 (= res!763316 (validMask!0 mask!1564))))

(declare-datatypes ((V!43501 0))(
  ( (V!43502 (val!14447 Int)) )
))
(declare-fun zeroValue!944 () V!43501)

(declare-fun c!113117 () Bool)

(declare-datatypes ((tuple2!18306 0))(
  ( (tuple2!18307 (_1!9164 (_ BitVec 64)) (_2!9164 V!43501)) )
))
(declare-datatypes ((List!25057 0))(
  ( (Nil!25054) (Cons!25053 (h!26262 tuple2!18306) (t!36300 List!25057)) )
))
(declare-datatypes ((ListLongMap!16275 0))(
  ( (ListLongMap!16276 (toList!8153 List!25057)) )
))
(declare-fun call!52559 () ListLongMap!16275)

(declare-fun bm!52551 () Bool)

(declare-fun lt!512101 () ListLongMap!16275)

(declare-fun c!113121 () Bool)

(declare-fun minValue!944 () V!43501)

(declare-fun +!3577 (ListLongMap!16275 tuple2!18306) ListLongMap!16275)

(assert (=> bm!52551 (= call!52559 (+!3577 lt!512101 (ite (or c!113117 c!113121) (tuple2!18307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146560 () Bool)

(declare-fun e!652196 () Bool)

(declare-fun call!52561 () ListLongMap!16275)

(declare-fun call!52560 () ListLongMap!16275)

(assert (=> b!1146560 (= e!652196 (= call!52561 call!52560))))

(declare-fun b!1146561 () Bool)

(declare-fun e!652185 () Bool)

(assert (=> b!1146561 (= e!652185 true)))

(declare-fun e!652200 () Bool)

(assert (=> b!1146561 e!652200))

(declare-fun res!763320 () Bool)

(assert (=> b!1146561 (=> (not res!763320) (not e!652200))))

(declare-fun lt!512108 () V!43501)

(declare-fun -!1290 (ListLongMap!16275 (_ BitVec 64)) ListLongMap!16275)

(assert (=> b!1146561 (= res!763320 (= (-!1290 (+!3577 lt!512101 (tuple2!18307 (select (arr!35855 _keys!1208) from!1455) lt!512108)) (select (arr!35855 _keys!1208) from!1455)) lt!512101))))

(declare-fun lt!512111 () Unit!37649)

(declare-fun addThenRemoveForNewKeyIsSame!139 (ListLongMap!16275 (_ BitVec 64) V!43501) Unit!37649)

(assert (=> b!1146561 (= lt!512111 (addThenRemoveForNewKeyIsSame!139 lt!512101 (select (arr!35855 _keys!1208) from!1455) lt!512108))))

(declare-fun lt!512116 () V!43501)

(declare-datatypes ((ValueCell!13681 0))(
  ( (ValueCellFull!13681 (v!17084 V!43501)) (EmptyCell!13681) )
))
(declare-datatypes ((array!74411 0))(
  ( (array!74412 (arr!35856 (Array (_ BitVec 32) ValueCell!13681)) (size!36392 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74411)

(declare-fun get!18235 (ValueCell!13681 V!43501) V!43501)

(assert (=> b!1146561 (= lt!512108 (get!18235 (select (arr!35856 _values!996) from!1455) lt!512116))))

(declare-fun lt!512114 () Unit!37649)

(declare-fun e!652187 () Unit!37649)

(assert (=> b!1146561 (= lt!512114 e!652187)))

(declare-fun c!113122 () Bool)

(declare-fun contains!6678 (ListLongMap!16275 (_ BitVec 64)) Bool)

(assert (=> b!1146561 (= c!113122 (contains!6678 lt!512101 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4627 (array!74409 array!74411 (_ BitVec 32) (_ BitVec 32) V!43501 V!43501 (_ BitVec 32) Int) ListLongMap!16275)

(assert (=> b!1146561 (= lt!512101 (getCurrentListMapNoExtraKeys!4627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146562 () Bool)

(assert (=> b!1146562 (= e!652196 (= call!52561 (-!1290 call!52560 k!934)))))

(declare-fun b!1146564 () Bool)

(declare-fun res!763328 () Bool)

(assert (=> b!1146564 (=> (not res!763328) (not e!652198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146564 (= res!763328 (validKeyInArray!0 k!934))))

(declare-fun b!1146565 () Bool)

(declare-fun e!652192 () Unit!37649)

(declare-fun e!652188 () Unit!37649)

(assert (=> b!1146565 (= e!652192 e!652188)))

(declare-fun c!113119 () Bool)

(declare-fun lt!512107 () Bool)

(assert (=> b!1146565 (= c!113119 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512107))))

(declare-fun b!1146566 () Bool)

(declare-fun res!763315 () Bool)

(assert (=> b!1146566 (=> (not res!763315) (not e!652198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74409 (_ BitVec 32)) Bool)

(assert (=> b!1146566 (= res!763315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1146567 () Bool)

(declare-fun res!763323 () Bool)

(assert (=> b!1146567 (=> (not res!763323) (not e!652198))))

(declare-datatypes ((List!25058 0))(
  ( (Nil!25055) (Cons!25054 (h!26263 (_ BitVec 64)) (t!36301 List!25058)) )
))
(declare-fun arrayNoDuplicates!0 (array!74409 (_ BitVec 32) List!25058) Bool)

(assert (=> b!1146567 (= res!763323 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25055))))

(declare-fun b!1146568 () Bool)

(declare-fun e!652189 () Bool)

(assert (=> b!1146568 (= e!652199 e!652189)))

(declare-fun res!763317 () Bool)

(assert (=> b!1146568 (=> res!763317 e!652189)))

(assert (=> b!1146568 (= res!763317 (not (= from!1455 i!673)))))

(declare-fun lt!512100 () array!74409)

(declare-fun lt!512110 () array!74411)

(declare-fun lt!512102 () ListLongMap!16275)

(assert (=> b!1146568 (= lt!512102 (getCurrentListMapNoExtraKeys!4627 lt!512100 lt!512110 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1146568 (= lt!512110 (array!74412 (store (arr!35856 _values!996) i!673 (ValueCellFull!13681 lt!512116)) (size!36392 _values!996)))))

(declare-fun dynLambda!2660 (Int (_ BitVec 64)) V!43501)

(assert (=> b!1146568 (= lt!512116 (dynLambda!2660 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512115 () ListLongMap!16275)

(assert (=> b!1146568 (= lt!512115 (getCurrentListMapNoExtraKeys!4627 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52552 () Bool)

(assert (=> bm!52552 (= call!52561 (getCurrentListMapNoExtraKeys!4627 lt!512100 lt!512110 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52553 () Bool)

(declare-fun call!52557 () Bool)

(declare-fun call!52555 () Bool)

(assert (=> bm!52553 (= call!52557 call!52555)))

(declare-fun bm!52554 () Bool)

(declare-fun call!52554 () Unit!37649)

(declare-fun call!52558 () Unit!37649)

(assert (=> bm!52554 (= call!52554 call!52558)))

(declare-fun b!1146569 () Bool)

(declare-fun res!763325 () Bool)

(assert (=> b!1146569 (=> (not res!763325) (not e!652198))))

(assert (=> b!1146569 (= res!763325 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36391 _keys!1208))))))

(declare-fun b!1146570 () Bool)

(declare-fun e!652194 () Bool)

(assert (=> b!1146570 (= e!652194 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146571 () Bool)

(assert (=> b!1146571 (= e!652189 e!652185)))

(declare-fun res!763327 () Bool)

(assert (=> b!1146571 (=> res!763327 e!652185)))

(assert (=> b!1146571 (= res!763327 (not (= (select (arr!35855 _keys!1208) from!1455) k!934)))))

(assert (=> b!1146571 e!652196))

(declare-fun c!113118 () Bool)

(assert (=> b!1146571 (= c!113118 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512117 () Unit!37649)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!529 (array!74409 array!74411 (_ BitVec 32) (_ BitVec 32) V!43501 V!43501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37649)

(assert (=> b!1146571 (= lt!512117 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1146572 () Bool)

(declare-fun lt!512106 () Unit!37649)

(assert (=> b!1146572 (= e!652192 lt!512106)))

(assert (=> b!1146572 (= lt!512106 call!52554)))

(assert (=> b!1146572 call!52557))

(declare-fun b!1146573 () Bool)

(assert (=> b!1146573 call!52557))

(declare-fun lt!512109 () Unit!37649)

(assert (=> b!1146573 (= lt!512109 call!52554)))

(assert (=> b!1146573 (= e!652188 lt!512109)))

(declare-fun bm!52555 () Bool)

(declare-fun addStillContains!830 (ListLongMap!16275 (_ BitVec 64) V!43501 (_ BitVec 64)) Unit!37649)

(assert (=> bm!52555 (= call!52558 (addStillContains!830 lt!512101 (ite (or c!113117 c!113121) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113117 c!113121) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1146574 () Bool)

(assert (=> b!1146574 (= e!652194 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512107) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1146575 () Bool)

(declare-fun res!763318 () Bool)

(assert (=> b!1146575 (=> (not res!763318) (not e!652198))))

(assert (=> b!1146575 (= res!763318 (and (= (size!36392 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36391 _keys!1208) (size!36392 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1146576 () Bool)

(declare-fun res!763319 () Bool)

(assert (=> b!1146576 (=> (not res!763319) (not e!652193))))

(assert (=> b!1146576 (= res!763319 (arrayNoDuplicates!0 lt!512100 #b00000000000000000000000000000000 Nil!25055))))

(declare-fun b!1146577 () Bool)

(declare-fun Unit!37651 () Unit!37649)

(assert (=> b!1146577 (= e!652187 Unit!37651)))

(assert (=> b!1146577 (= lt!512107 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1146577 (= c!113117 (and (not lt!512107) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512099 () Unit!37649)

(declare-fun e!652186 () Unit!37649)

(assert (=> b!1146577 (= lt!512099 e!652186)))

(declare-fun lt!512098 () Unit!37649)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!423 (array!74409 array!74411 (_ BitVec 32) (_ BitVec 32) V!43501 V!43501 (_ BitVec 64) (_ BitVec 32) Int) Unit!37649)

(assert (=> b!1146577 (= lt!512098 (lemmaListMapContainsThenArrayContainsFrom!423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113120 () Bool)

(assert (=> b!1146577 (= c!113120 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763326 () Bool)

(assert (=> b!1146577 (= res!763326 e!652194)))

(declare-fun e!652190 () Bool)

(assert (=> b!1146577 (=> (not res!763326) (not e!652190))))

(assert (=> b!1146577 e!652190))

(declare-fun lt!512103 () Unit!37649)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74409 (_ BitVec 32) (_ BitVec 32)) Unit!37649)

(assert (=> b!1146577 (= lt!512103 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1146577 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25055)))

(declare-fun lt!512104 () Unit!37649)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74409 (_ BitVec 64) (_ BitVec 32) List!25058) Unit!37649)

(assert (=> b!1146577 (= lt!512104 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25055))))

(assert (=> b!1146577 false))

(declare-fun b!1146578 () Bool)

(declare-fun res!763314 () Bool)

(assert (=> b!1146578 (=> (not res!763314) (not e!652198))))

(assert (=> b!1146578 (= res!763314 (= (select (arr!35855 _keys!1208) i!673) k!934))))

(declare-fun b!1146579 () Bool)

(declare-fun e!652191 () Bool)

(declare-fun e!652184 () Bool)

(declare-fun mapRes!44996 () Bool)

(assert (=> b!1146579 (= e!652191 (and e!652184 mapRes!44996))))

(declare-fun condMapEmpty!44996 () Bool)

(declare-fun mapDefault!44996 () ValueCell!13681)

