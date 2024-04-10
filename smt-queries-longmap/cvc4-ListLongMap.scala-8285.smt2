; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100950 () Bool)

(assert start!100950)

(declare-fun b_free!25985 () Bool)

(declare-fun b_next!25985 () Bool)

(assert (=> start!100950 (= b_free!25985 (not b_next!25985))))

(declare-fun tp!90968 () Bool)

(declare-fun b_and!43033 () Bool)

(assert (=> start!100950 (= tp!90968 b_and!43033)))

(declare-fun bm!59237 () Bool)

(declare-datatypes ((Unit!40068 0))(
  ( (Unit!40069) )
))
(declare-fun call!59240 () Unit!40068)

(declare-fun call!59246 () Unit!40068)

(assert (=> bm!59237 (= call!59240 call!59246)))

(declare-fun b!1208846 () Bool)

(declare-fun res!803490 () Bool)

(declare-fun e!686555 () Bool)

(assert (=> b!1208846 (=> (not res!803490) (not e!686555))))

(declare-datatypes ((array!78161 0))(
  ( (array!78162 (arr!37718 (Array (_ BitVec 32) (_ BitVec 64))) (size!38254 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78161)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46045 0))(
  ( (V!46046 (val!15401 Int)) )
))
(declare-datatypes ((ValueCell!14635 0))(
  ( (ValueCellFull!14635 (v!18050 V!46045)) (EmptyCell!14635) )
))
(declare-datatypes ((array!78163 0))(
  ( (array!78164 (arr!37719 (Array (_ BitVec 32) ValueCell!14635)) (size!38255 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78163)

(assert (=> b!1208846 (= res!803490 (and (= (size!38255 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38254 _keys!1208) (size!38255 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!46045)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!59239 () Bool)

(declare-fun lt!548650 () array!78161)

(declare-datatypes ((tuple2!19768 0))(
  ( (tuple2!19769 (_1!9895 (_ BitVec 64)) (_2!9895 V!46045)) )
))
(declare-datatypes ((List!26570 0))(
  ( (Nil!26567) (Cons!26566 (h!27775 tuple2!19768) (t!39535 List!26570)) )
))
(declare-datatypes ((ListLongMap!17737 0))(
  ( (ListLongMap!17738 (toList!8884 List!26570)) )
))
(declare-fun call!59245 () ListLongMap!17737)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!548656 () array!78163)

(declare-fun minValue!944 () V!46045)

(declare-fun getCurrentListMapNoExtraKeys!5318 (array!78161 array!78163 (_ BitVec 32) (_ BitVec 32) V!46045 V!46045 (_ BitVec 32) Int) ListLongMap!17737)

(assert (=> bm!59239 (= call!59245 (getCurrentListMapNoExtraKeys!5318 lt!548650 lt!548656 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208847 () Bool)

(declare-fun e!686556 () Bool)

(declare-datatypes ((List!26571 0))(
  ( (Nil!26568) (Cons!26567 (h!27776 (_ BitVec 64)) (t!39536 List!26571)) )
))
(declare-fun contains!6948 (List!26571 (_ BitVec 64)) Bool)

(assert (=> b!1208847 (= e!686556 (not (contains!6948 Nil!26568 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208848 () Bool)

(declare-fun e!686543 () Bool)

(declare-fun e!686554 () Bool)

(assert (=> b!1208848 (= e!686543 e!686554)))

(declare-fun res!803487 () Bool)

(assert (=> b!1208848 (=> res!803487 e!686554)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208848 (= res!803487 (not (= from!1455 i!673)))))

(declare-fun lt!548653 () ListLongMap!17737)

(assert (=> b!1208848 (= lt!548653 (getCurrentListMapNoExtraKeys!5318 lt!548650 lt!548656 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3219 (Int (_ BitVec 64)) V!46045)

(assert (=> b!1208848 (= lt!548656 (array!78164 (store (arr!37719 _values!996) i!673 (ValueCellFull!14635 (dynLambda!3219 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38255 _values!996)))))

(declare-fun lt!548648 () ListLongMap!17737)

(assert (=> b!1208848 (= lt!548648 (getCurrentListMapNoExtraKeys!5318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47899 () Bool)

(declare-fun mapRes!47899 () Bool)

(assert (=> mapIsEmpty!47899 mapRes!47899))

(declare-fun b!1208849 () Bool)

(declare-fun e!686551 () Bool)

(declare-fun tp_is_empty!30689 () Bool)

(assert (=> b!1208849 (= e!686551 tp_is_empty!30689)))

(declare-fun b!1208850 () Bool)

(declare-fun res!803496 () Bool)

(assert (=> b!1208850 (=> (not res!803496) (not e!686555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208850 (= res!803496 (validMask!0 mask!1564))))

(declare-fun b!1208851 () Bool)

(declare-fun res!803494 () Bool)

(assert (=> b!1208851 (=> (not res!803494) (not e!686555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78161 (_ BitVec 32)) Bool)

(assert (=> b!1208851 (= res!803494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!686559 () Bool)

(declare-fun call!59243 () ListLongMap!17737)

(declare-fun b!1208852 () Bool)

(declare-fun -!1838 (ListLongMap!17737 (_ BitVec 64)) ListLongMap!17737)

(assert (=> b!1208852 (= e!686559 (= call!59245 (-!1838 call!59243 k!934)))))

(declare-fun c!118963 () Bool)

(declare-fun lt!548658 () ListLongMap!17737)

(declare-fun bm!59240 () Bool)

(declare-fun lt!548651 () ListLongMap!17737)

(declare-fun call!59244 () ListLongMap!17737)

(declare-fun c!118964 () Bool)

(declare-fun +!4003 (ListLongMap!17737 tuple2!19768) ListLongMap!17737)

(assert (=> bm!59240 (= call!59244 (+!4003 (ite c!118964 lt!548651 lt!548658) (ite c!118964 (tuple2!19769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118963 (tuple2!19769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208853 () Bool)

(declare-fun e!686546 () Bool)

(declare-fun lt!548659 () Bool)

(assert (=> b!1208853 (= e!686546 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548659) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1208854 () Bool)

(declare-fun c!118965 () Bool)

(assert (=> b!1208854 (= c!118965 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548659))))

(declare-fun e!686549 () Unit!40068)

(declare-fun e!686553 () Unit!40068)

(assert (=> b!1208854 (= e!686549 e!686553)))

(declare-fun b!1208855 () Bool)

(declare-fun res!803500 () Bool)

(declare-fun e!686545 () Bool)

(assert (=> b!1208855 (=> (not res!803500) (not e!686545))))

(declare-fun arrayNoDuplicates!0 (array!78161 (_ BitVec 32) List!26571) Bool)

(assert (=> b!1208855 (= res!803500 (arrayNoDuplicates!0 lt!548650 #b00000000000000000000000000000000 Nil!26568))))

(declare-fun b!1208856 () Bool)

(declare-fun e!686552 () Bool)

(declare-fun e!686547 () Bool)

(assert (=> b!1208856 (= e!686552 e!686547)))

(declare-fun res!803492 () Bool)

(assert (=> b!1208856 (=> res!803492 e!686547)))

(assert (=> b!1208856 (= res!803492 (or (bvsge (size!38254 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38254 _keys!1208)) (bvsge from!1455 (size!38254 _keys!1208))))))

(assert (=> b!1208856 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26568)))

(declare-fun lt!548661 () Unit!40068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78161 (_ BitVec 32) (_ BitVec 32)) Unit!40068)

(assert (=> b!1208856 (= lt!548661 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686557 () Bool)

(assert (=> b!1208856 e!686557))

(declare-fun res!803501 () Bool)

(assert (=> b!1208856 (=> (not res!803501) (not e!686557))))

(assert (=> b!1208856 (= res!803501 e!686546)))

(declare-fun c!118962 () Bool)

(assert (=> b!1208856 (= c!118962 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548655 () Unit!40068)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!586 (array!78161 array!78163 (_ BitVec 32) (_ BitVec 32) V!46045 V!46045 (_ BitVec 64) (_ BitVec 32) Int) Unit!40068)

(assert (=> b!1208856 (= lt!548655 (lemmaListMapContainsThenArrayContainsFrom!586 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548654 () Unit!40068)

(declare-fun e!686558 () Unit!40068)

(assert (=> b!1208856 (= lt!548654 e!686558)))

(assert (=> b!1208856 (= c!118964 (and (not lt!548659) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208856 (= lt!548659 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1208857 () Bool)

(declare-fun res!803503 () Bool)

(assert (=> b!1208857 (=> res!803503 e!686547)))

(declare-fun noDuplicate!1626 (List!26571) Bool)

(assert (=> b!1208857 (= res!803503 (not (noDuplicate!1626 Nil!26568)))))

(declare-fun call!59242 () Bool)

(declare-fun bm!59238 () Bool)

(declare-fun call!59247 () ListLongMap!17737)

(declare-fun contains!6949 (ListLongMap!17737 (_ BitVec 64)) Bool)

(assert (=> bm!59238 (= call!59242 (contains!6949 (ite c!118964 lt!548651 call!59247) k!934))))

(declare-fun res!803491 () Bool)

(assert (=> start!100950 (=> (not res!803491) (not e!686555))))

(assert (=> start!100950 (= res!803491 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38254 _keys!1208))))))

(assert (=> start!100950 e!686555))

(assert (=> start!100950 tp_is_empty!30689))

(declare-fun array_inv!28730 (array!78161) Bool)

(assert (=> start!100950 (array_inv!28730 _keys!1208)))

(assert (=> start!100950 true))

(assert (=> start!100950 tp!90968))

(declare-fun e!686548 () Bool)

(declare-fun array_inv!28731 (array!78163) Bool)

(assert (=> start!100950 (and (array_inv!28731 _values!996) e!686548)))

(declare-fun b!1208858 () Bool)

(assert (=> b!1208858 (= e!686558 e!686549)))

(assert (=> b!1208858 (= c!118963 (and (not lt!548659) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208859 () Bool)

(declare-fun lt!548657 () Unit!40068)

(assert (=> b!1208859 (= e!686553 lt!548657)))

(assert (=> b!1208859 (= lt!548657 call!59240)))

(declare-fun call!59241 () Bool)

(assert (=> b!1208859 call!59241))

(declare-fun b!1208860 () Bool)

(declare-fun arrayContainsKey!0 (array!78161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208860 (= e!686546 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208861 () Bool)

(assert (=> b!1208861 call!59241))

(declare-fun lt!548663 () Unit!40068)

(assert (=> b!1208861 (= lt!548663 call!59240)))

(assert (=> b!1208861 (= e!686549 lt!548663)))

(declare-fun b!1208862 () Bool)

(declare-fun e!686544 () Bool)

(assert (=> b!1208862 (= e!686544 tp_is_empty!30689)))

(declare-fun b!1208863 () Bool)

(declare-fun res!803489 () Bool)

(assert (=> b!1208863 (=> (not res!803489) (not e!686555))))

(assert (=> b!1208863 (= res!803489 (= (select (arr!37718 _keys!1208) i!673) k!934))))

(declare-fun b!1208864 () Bool)

(declare-fun e!686550 () Bool)

(assert (=> b!1208864 (= e!686550 e!686552)))

(declare-fun res!803498 () Bool)

(assert (=> b!1208864 (=> res!803498 e!686552)))

(assert (=> b!1208864 (= res!803498 (not (contains!6949 lt!548658 k!934)))))

(assert (=> b!1208864 (= lt!548658 (getCurrentListMapNoExtraKeys!5318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59241 () Bool)

(assert (=> bm!59241 (= call!59243 (getCurrentListMapNoExtraKeys!5318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208865 () Bool)

(assert (=> b!1208865 (= e!686547 e!686556)))

(declare-fun res!803497 () Bool)

(assert (=> b!1208865 (=> (not res!803497) (not e!686556))))

(assert (=> b!1208865 (= res!803497 (not (contains!6948 Nil!26568 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208866 () Bool)

(assert (=> b!1208866 (= e!686554 e!686550)))

(declare-fun res!803495 () Bool)

(assert (=> b!1208866 (=> res!803495 e!686550)))

(assert (=> b!1208866 (= res!803495 (not (= (select (arr!37718 _keys!1208) from!1455) k!934)))))

(assert (=> b!1208866 e!686559))

(declare-fun c!118961 () Bool)

(assert (=> b!1208866 (= c!118961 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548652 () Unit!40068)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1046 (array!78161 array!78163 (_ BitVec 32) (_ BitVec 32) V!46045 V!46045 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40068)

(assert (=> b!1208866 (= lt!548652 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1046 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208867 () Bool)

(declare-fun res!803504 () Bool)

(assert (=> b!1208867 (=> (not res!803504) (not e!686555))))

(assert (=> b!1208867 (= res!803504 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26568))))

(declare-fun bm!59242 () Bool)

(assert (=> bm!59242 (= call!59241 call!59242)))

(declare-fun b!1208868 () Bool)

(assert (=> b!1208868 (= e!686555 e!686545)))

(declare-fun res!803493 () Bool)

(assert (=> b!1208868 (=> (not res!803493) (not e!686545))))

(assert (=> b!1208868 (= res!803493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548650 mask!1564))))

(assert (=> b!1208868 (= lt!548650 (array!78162 (store (arr!37718 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38254 _keys!1208)))))

(declare-fun b!1208869 () Bool)

(declare-fun Unit!40070 () Unit!40068)

(assert (=> b!1208869 (= e!686553 Unit!40070)))

(declare-fun b!1208870 () Bool)

(declare-fun res!803499 () Bool)

(assert (=> b!1208870 (=> (not res!803499) (not e!686555))))

(assert (=> b!1208870 (= res!803499 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38254 _keys!1208))))))

(declare-fun bm!59243 () Bool)

(assert (=> bm!59243 (= call!59247 call!59244)))

(declare-fun b!1208871 () Bool)

(assert (=> b!1208871 (= e!686545 (not e!686543))))

(declare-fun res!803488 () Bool)

(assert (=> b!1208871 (=> res!803488 e!686543)))

(assert (=> b!1208871 (= res!803488 (bvsgt from!1455 i!673))))

(assert (=> b!1208871 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!548662 () Unit!40068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78161 (_ BitVec 64) (_ BitVec 32)) Unit!40068)

(assert (=> b!1208871 (= lt!548662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!59244 () Bool)

(declare-fun addStillContains!1032 (ListLongMap!17737 (_ BitVec 64) V!46045 (_ BitVec 64)) Unit!40068)

(assert (=> bm!59244 (= call!59246 (addStillContains!1032 lt!548658 (ite (or c!118964 c!118963) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118964 c!118963) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1208872 () Bool)

(assert (=> b!1208872 (= e!686548 (and e!686551 mapRes!47899))))

(declare-fun condMapEmpty!47899 () Bool)

(declare-fun mapDefault!47899 () ValueCell!14635)

