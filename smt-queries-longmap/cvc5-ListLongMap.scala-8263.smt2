; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100526 () Bool)

(assert start!100526)

(declare-fun b_free!25849 () Bool)

(declare-fun b_next!25849 () Bool)

(assert (=> start!100526 (= b_free!25849 (not b_next!25849))))

(declare-fun tp!90537 () Bool)

(declare-fun b_and!42585 () Bool)

(assert (=> start!100526 (= tp!90537 b_and!42585)))

(declare-datatypes ((V!45865 0))(
  ( (V!45866 (val!15333 Int)) )
))
(declare-fun zeroValue!944 () V!45865)

(declare-fun c!117494 () Bool)

(declare-datatypes ((tuple2!19638 0))(
  ( (tuple2!19639 (_1!9830 (_ BitVec 64)) (_2!9830 V!45865)) )
))
(declare-datatypes ((List!26456 0))(
  ( (Nil!26453) (Cons!26452 (h!27661 tuple2!19638) (t!39285 List!26456)) )
))
(declare-datatypes ((ListLongMap!17607 0))(
  ( (ListLongMap!17608 (toList!8819 List!26456)) )
))
(declare-fun call!57393 () ListLongMap!17607)

(declare-fun c!117492 () Bool)

(declare-fun bm!57385 () Bool)

(declare-fun lt!544375 () ListLongMap!17607)

(declare-fun minValue!944 () V!45865)

(declare-fun +!3951 (ListLongMap!17607 tuple2!19638) ListLongMap!17607)

(assert (=> bm!57385 (= call!57393 (+!3951 lt!544375 (ite (or c!117494 c!117492) (tuple2!19639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1201291 () Bool)

(declare-fun e!682180 () Bool)

(declare-fun e!682184 () Bool)

(assert (=> b!1201291 (= e!682180 (not e!682184))))

(declare-fun res!799693 () Bool)

(assert (=> b!1201291 (=> res!799693 e!682184)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201291 (= res!799693 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77879 0))(
  ( (array!77880 (arr!37584 (Array (_ BitVec 32) (_ BitVec 64))) (size!38120 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77879)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201291 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39826 0))(
  ( (Unit!39827) )
))
(declare-fun lt!544376 () Unit!39826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77879 (_ BitVec 64) (_ BitVec 32)) Unit!39826)

(assert (=> b!1201291 (= lt!544376 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!47672 () Bool)

(declare-fun mapRes!47672 () Bool)

(assert (=> mapIsEmpty!47672 mapRes!47672))

(declare-fun b!1201292 () Bool)

(declare-fun res!799698 () Bool)

(declare-fun e!682186 () Bool)

(assert (=> b!1201292 (=> (not res!799698) (not e!682186))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201292 (= res!799698 (validMask!0 mask!1564))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!57391 () ListLongMap!17607)

(declare-fun lt!544382 () array!77879)

(declare-fun bm!57386 () Bool)

(declare-datatypes ((ValueCell!14567 0))(
  ( (ValueCellFull!14567 (v!17971 V!45865)) (EmptyCell!14567) )
))
(declare-datatypes ((array!77881 0))(
  ( (array!77882 (arr!37585 (Array (_ BitVec 32) ValueCell!14567)) (size!38121 (_ BitVec 32))) )
))
(declare-fun lt!544380 () array!77881)

(declare-fun getCurrentListMapNoExtraKeys!5258 (array!77879 array!77881 (_ BitVec 32) (_ BitVec 32) V!45865 V!45865 (_ BitVec 32) Int) ListLongMap!17607)

(assert (=> bm!57386 (= call!57391 (getCurrentListMapNoExtraKeys!5258 lt!544382 lt!544380 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201293 () Bool)

(declare-fun res!799700 () Bool)

(assert (=> b!1201293 (=> (not res!799700) (not e!682186))))

(assert (=> b!1201293 (= res!799700 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38120 _keys!1208))))))

(declare-fun b!1201294 () Bool)

(declare-fun res!799702 () Bool)

(assert (=> b!1201294 (=> (not res!799702) (not e!682186))))

(assert (=> b!1201294 (= res!799702 (= (select (arr!37584 _keys!1208) i!673) k!934))))

(declare-fun b!1201295 () Bool)

(declare-fun e!682183 () Unit!39826)

(declare-fun Unit!39828 () Unit!39826)

(assert (=> b!1201295 (= e!682183 Unit!39828)))

(declare-fun bm!57387 () Bool)

(declare-fun call!57390 () Bool)

(declare-fun call!57395 () Bool)

(assert (=> bm!57387 (= call!57390 call!57395)))

(declare-fun b!1201296 () Bool)

(declare-fun res!799694 () Bool)

(assert (=> b!1201296 (=> (not res!799694) (not e!682186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77879 (_ BitVec 32)) Bool)

(assert (=> b!1201296 (= res!799694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57388 () Bool)

(declare-fun call!57388 () Unit!39826)

(declare-fun call!57394 () Unit!39826)

(assert (=> bm!57388 (= call!57388 call!57394)))

(declare-fun b!1201297 () Bool)

(assert (=> b!1201297 (= e!682186 e!682180)))

(declare-fun res!799704 () Bool)

(assert (=> b!1201297 (=> (not res!799704) (not e!682180))))

(assert (=> b!1201297 (= res!799704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544382 mask!1564))))

(assert (=> b!1201297 (= lt!544382 (array!77880 (store (arr!37584 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38120 _keys!1208)))))

(declare-fun b!1201298 () Bool)

(declare-fun e!682189 () Bool)

(declare-fun e!682178 () Bool)

(assert (=> b!1201298 (= e!682189 e!682178)))

(declare-fun res!799701 () Bool)

(assert (=> b!1201298 (=> res!799701 e!682178)))

(assert (=> b!1201298 (= res!799701 (not (= (select (arr!37584 _keys!1208) from!1455) k!934)))))

(declare-fun e!682176 () Bool)

(assert (=> b!1201298 e!682176))

(declare-fun c!117491 () Bool)

(assert (=> b!1201298 (= c!117491 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544378 () Unit!39826)

(declare-fun _values!996 () array!77881)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!998 (array!77879 array!77881 (_ BitVec 32) (_ BitVec 32) V!45865 V!45865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39826)

(assert (=> b!1201298 (= lt!544378 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!998 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57389 () Bool)

(declare-fun lt!544373 () ListLongMap!17607)

(declare-fun call!57389 () ListLongMap!17607)

(declare-fun contains!6877 (ListLongMap!17607 (_ BitVec 64)) Bool)

(assert (=> bm!57389 (= call!57395 (contains!6877 (ite c!117494 lt!544373 call!57389) k!934))))

(declare-fun b!1201299 () Bool)

(declare-fun lt!544372 () Unit!39826)

(assert (=> b!1201299 (= e!682183 lt!544372)))

(assert (=> b!1201299 (= lt!544372 call!57388)))

(assert (=> b!1201299 call!57390))

(declare-fun b!1201300 () Bool)

(declare-fun res!799692 () Bool)

(assert (=> b!1201300 (=> (not res!799692) (not e!682186))))

(declare-datatypes ((List!26457 0))(
  ( (Nil!26454) (Cons!26453 (h!27662 (_ BitVec 64)) (t!39286 List!26457)) )
))
(declare-fun arrayNoDuplicates!0 (array!77879 (_ BitVec 32) List!26457) Bool)

(assert (=> b!1201300 (= res!799692 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26454))))

(declare-fun b!1201301 () Bool)

(assert (=> b!1201301 (= e!682184 e!682189)))

(declare-fun res!799699 () Bool)

(assert (=> b!1201301 (=> res!799699 e!682189)))

(assert (=> b!1201301 (= res!799699 (not (= from!1455 i!673)))))

(declare-fun lt!544371 () ListLongMap!17607)

(assert (=> b!1201301 (= lt!544371 (getCurrentListMapNoExtraKeys!5258 lt!544382 lt!544380 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3175 (Int (_ BitVec 64)) V!45865)

(assert (=> b!1201301 (= lt!544380 (array!77882 (store (arr!37585 _values!996) i!673 (ValueCellFull!14567 (dynLambda!3175 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38121 _values!996)))))

(declare-fun lt!544383 () ListLongMap!17607)

(assert (=> b!1201301 (= lt!544383 (getCurrentListMapNoExtraKeys!5258 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201302 () Bool)

(declare-fun call!57392 () ListLongMap!17607)

(declare-fun -!1792 (ListLongMap!17607 (_ BitVec 64)) ListLongMap!17607)

(assert (=> b!1201302 (= e!682176 (= call!57391 (-!1792 call!57392 k!934)))))

(declare-fun b!1201303 () Bool)

(declare-fun e!682179 () Bool)

(declare-fun tp_is_empty!30553 () Bool)

(assert (=> b!1201303 (= e!682179 tp_is_empty!30553)))

(declare-fun mapNonEmpty!47672 () Bool)

(declare-fun tp!90536 () Bool)

(declare-fun e!682187 () Bool)

(assert (=> mapNonEmpty!47672 (= mapRes!47672 (and tp!90536 e!682187))))

(declare-fun mapKey!47672 () (_ BitVec 32))

(declare-fun mapValue!47672 () ValueCell!14567)

(declare-fun mapRest!47672 () (Array (_ BitVec 32) ValueCell!14567))

(assert (=> mapNonEmpty!47672 (= (arr!37585 _values!996) (store mapRest!47672 mapKey!47672 mapValue!47672))))

(declare-fun bm!57390 () Bool)

(declare-fun addStillContains!978 (ListLongMap!17607 (_ BitVec 64) V!45865 (_ BitVec 64)) Unit!39826)

(assert (=> bm!57390 (= call!57394 (addStillContains!978 lt!544375 (ite (or c!117494 c!117492) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117494 c!117492) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1201304 () Bool)

(declare-fun e!682182 () Unit!39826)

(declare-fun e!682181 () Unit!39826)

(assert (=> b!1201304 (= e!682182 e!682181)))

(declare-fun lt!544377 () Bool)

(assert (=> b!1201304 (= c!117492 (and (not lt!544377) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201305 () Bool)

(declare-fun c!117493 () Bool)

(assert (=> b!1201305 (= c!117493 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544377))))

(assert (=> b!1201305 (= e!682181 e!682183)))

(declare-fun b!1201306 () Bool)

(declare-fun res!799703 () Bool)

(assert (=> b!1201306 (=> (not res!799703) (not e!682180))))

(assert (=> b!1201306 (= res!799703 (arrayNoDuplicates!0 lt!544382 #b00000000000000000000000000000000 Nil!26454))))

(declare-fun b!1201307 () Bool)

(declare-fun e!682188 () Bool)

(assert (=> b!1201307 (= e!682188 true)))

(declare-fun lt!544381 () Unit!39826)

(assert (=> b!1201307 (= lt!544381 e!682182)))

(assert (=> b!1201307 (= c!117494 (and (not lt!544377) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201307 (= lt!544377 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201308 () Bool)

(declare-fun res!799691 () Bool)

(assert (=> b!1201308 (=> (not res!799691) (not e!682186))))

(assert (=> b!1201308 (= res!799691 (and (= (size!38121 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38120 _keys!1208) (size!38121 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201309 () Bool)

(declare-fun lt!544379 () Unit!39826)

(assert (=> b!1201309 (= e!682182 lt!544379)))

(declare-fun lt!544374 () Unit!39826)

(assert (=> b!1201309 (= lt!544374 call!57394)))

(assert (=> b!1201309 (= lt!544373 call!57393)))

(assert (=> b!1201309 call!57395))

(assert (=> b!1201309 (= lt!544379 (addStillContains!978 lt!544373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1201309 (contains!6877 (+!3951 lt!544373 (tuple2!19639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1201310 () Bool)

(assert (=> b!1201310 call!57390))

(declare-fun lt!544384 () Unit!39826)

(assert (=> b!1201310 (= lt!544384 call!57388)))

(assert (=> b!1201310 (= e!682181 lt!544384)))

(declare-fun b!1201311 () Bool)

(declare-fun res!799697 () Bool)

(assert (=> b!1201311 (=> (not res!799697) (not e!682186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201311 (= res!799697 (validKeyInArray!0 k!934))))

(declare-fun bm!57391 () Bool)

(assert (=> bm!57391 (= call!57389 call!57393)))

(declare-fun b!1201312 () Bool)

(assert (=> b!1201312 (= e!682176 (= call!57391 call!57392))))

(declare-fun b!1201313 () Bool)

(assert (=> b!1201313 (= e!682187 tp_is_empty!30553)))

(declare-fun bm!57392 () Bool)

(assert (=> bm!57392 (= call!57392 (getCurrentListMapNoExtraKeys!5258 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201314 () Bool)

(declare-fun e!682177 () Bool)

(assert (=> b!1201314 (= e!682177 (and e!682179 mapRes!47672))))

(declare-fun condMapEmpty!47672 () Bool)

(declare-fun mapDefault!47672 () ValueCell!14567)

