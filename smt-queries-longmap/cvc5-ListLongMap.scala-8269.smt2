; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100562 () Bool)

(assert start!100562)

(declare-fun b_free!25885 () Bool)

(declare-fun b_next!25885 () Bool)

(assert (=> start!100562 (= b_free!25885 (not b_next!25885))))

(declare-fun tp!90645 () Bool)

(declare-fun b_and!42657 () Bool)

(assert (=> start!100562 (= tp!90645 b_and!42657)))

(declare-fun b!1202677 () Bool)

(declare-fun res!800452 () Bool)

(declare-fun e!682940 () Bool)

(assert (=> b!1202677 (=> (not res!800452) (not e!682940))))

(declare-datatypes ((array!77951 0))(
  ( (array!77952 (arr!37620 (Array (_ BitVec 32) (_ BitVec 64))) (size!38156 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77951)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45913 0))(
  ( (V!45914 (val!15351 Int)) )
))
(declare-datatypes ((ValueCell!14585 0))(
  ( (ValueCellFull!14585 (v!17989 V!45913)) (EmptyCell!14585) )
))
(declare-datatypes ((array!77953 0))(
  ( (array!77954 (arr!37621 (Array (_ BitVec 32) ValueCell!14585)) (size!38157 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77953)

(assert (=> b!1202677 (= res!800452 (and (= (size!38157 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38156 _keys!1208) (size!38157 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202678 () Bool)

(declare-fun e!682945 () Bool)

(declare-fun e!682936 () Bool)

(assert (=> b!1202678 (= e!682945 (not e!682936))))

(declare-fun res!800457 () Bool)

(assert (=> b!1202678 (=> res!800457 e!682936)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202678 (= res!800457 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202678 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39871 0))(
  ( (Unit!39872) )
))
(declare-fun lt!545138 () Unit!39871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77951 (_ BitVec 64) (_ BitVec 32)) Unit!39871)

(assert (=> b!1202678 (= lt!545138 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun zeroValue!944 () V!45913)

(declare-fun lt!545139 () array!77951)

(declare-fun lt!545130 () array!77953)

(declare-datatypes ((tuple2!19674 0))(
  ( (tuple2!19675 (_1!9848 (_ BitVec 64)) (_2!9848 V!45913)) )
))
(declare-datatypes ((List!26485 0))(
  ( (Nil!26482) (Cons!26481 (h!27690 tuple2!19674) (t!39350 List!26485)) )
))
(declare-datatypes ((ListLongMap!17643 0))(
  ( (ListLongMap!17644 (toList!8837 List!26485)) )
))
(declare-fun call!57826 () ListLongMap!17643)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45913)

(declare-fun bm!57817 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5273 (array!77951 array!77953 (_ BitVec 32) (_ BitVec 32) V!45913 V!45913 (_ BitVec 32) Int) ListLongMap!17643)

(assert (=> bm!57817 (= call!57826 (getCurrentListMapNoExtraKeys!5273 lt!545139 lt!545130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202679 () Bool)

(declare-fun e!682932 () Bool)

(assert (=> b!1202679 (= e!682936 e!682932)))

(declare-fun res!800449 () Bool)

(assert (=> b!1202679 (=> res!800449 e!682932)))

(assert (=> b!1202679 (= res!800449 (not (= from!1455 i!673)))))

(declare-fun lt!545134 () ListLongMap!17643)

(assert (=> b!1202679 (= lt!545134 (getCurrentListMapNoExtraKeys!5273 lt!545139 lt!545130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3187 (Int (_ BitVec 64)) V!45913)

(assert (=> b!1202679 (= lt!545130 (array!77954 (store (arr!37621 _values!996) i!673 (ValueCellFull!14585 (dynLambda!3187 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38157 _values!996)))))

(declare-fun lt!545132 () ListLongMap!17643)

(assert (=> b!1202679 (= lt!545132 (getCurrentListMapNoExtraKeys!5273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202680 () Bool)

(declare-fun call!57827 () ListLongMap!17643)

(declare-fun e!682941 () Bool)

(declare-fun -!1804 (ListLongMap!17643 (_ BitVec 64)) ListLongMap!17643)

(assert (=> b!1202680 (= e!682941 (= call!57826 (-!1804 call!57827 k!934)))))

(declare-fun b!1202681 () Bool)

(declare-fun e!682935 () Unit!39871)

(declare-fun e!682944 () Unit!39871)

(assert (=> b!1202681 (= e!682935 e!682944)))

(declare-fun c!117707 () Bool)

(declare-fun lt!545129 () Bool)

(assert (=> b!1202681 (= c!117707 (and (not lt!545129) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!545137 () ListLongMap!17643)

(declare-fun c!117709 () Bool)

(declare-fun bm!57818 () Bool)

(declare-fun call!57820 () Unit!39871)

(declare-fun addStillContains!993 (ListLongMap!17643 (_ BitVec 64) V!45913 (_ BitVec 64)) Unit!39871)

(assert (=> bm!57818 (= call!57820 (addStillContains!993 lt!545137 (ite (or c!117709 c!117707) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117709 c!117707) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1202682 () Bool)

(declare-fun res!800458 () Bool)

(assert (=> b!1202682 (=> (not res!800458) (not e!682940))))

(assert (=> b!1202682 (= res!800458 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38156 _keys!1208))))))

(declare-fun call!57825 () ListLongMap!17643)

(declare-fun lt!545136 () ListLongMap!17643)

(declare-fun bm!57819 () Bool)

(declare-fun call!57821 () Bool)

(declare-fun contains!6892 (ListLongMap!17643 (_ BitVec 64)) Bool)

(assert (=> bm!57819 (= call!57821 (contains!6892 (ite c!117709 lt!545136 call!57825) k!934))))

(declare-fun mapIsEmpty!47726 () Bool)

(declare-fun mapRes!47726 () Bool)

(assert (=> mapIsEmpty!47726 mapRes!47726))

(declare-fun bm!57820 () Bool)

(assert (=> bm!57820 (= call!57827 (getCurrentListMapNoExtraKeys!5273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202683 () Bool)

(declare-fun e!682939 () Bool)

(declare-fun e!682938 () Bool)

(assert (=> b!1202683 (= e!682939 e!682938)))

(declare-fun res!800448 () Bool)

(assert (=> b!1202683 (=> res!800448 e!682938)))

(assert (=> b!1202683 (= res!800448 (not (contains!6892 lt!545137 k!934)))))

(assert (=> b!1202683 (= lt!545137 (getCurrentListMapNoExtraKeys!5273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202684 () Bool)

(declare-fun e!682942 () Bool)

(declare-fun tp_is_empty!30589 () Bool)

(assert (=> b!1202684 (= e!682942 tp_is_empty!30589)))

(declare-fun bm!57821 () Bool)

(declare-fun call!57824 () Unit!39871)

(assert (=> bm!57821 (= call!57824 call!57820)))

(declare-fun b!1202685 () Bool)

(declare-fun e!682943 () Unit!39871)

(declare-fun lt!545133 () Unit!39871)

(assert (=> b!1202685 (= e!682943 lt!545133)))

(assert (=> b!1202685 (= lt!545133 call!57824)))

(declare-fun call!57822 () Bool)

(assert (=> b!1202685 call!57822))

(declare-fun b!1202686 () Bool)

(declare-fun res!800453 () Bool)

(assert (=> b!1202686 (=> (not res!800453) (not e!682940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202686 (= res!800453 (validMask!0 mask!1564))))

(declare-fun b!1202687 () Bool)

(declare-fun res!800450 () Bool)

(assert (=> b!1202687 (=> (not res!800450) (not e!682940))))

(declare-datatypes ((List!26486 0))(
  ( (Nil!26483) (Cons!26482 (h!27691 (_ BitVec 64)) (t!39351 List!26486)) )
))
(declare-fun arrayNoDuplicates!0 (array!77951 (_ BitVec 32) List!26486) Bool)

(assert (=> b!1202687 (= res!800450 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26483))))

(declare-fun b!1202688 () Bool)

(assert (=> b!1202688 (= e!682932 e!682939)))

(declare-fun res!800454 () Bool)

(assert (=> b!1202688 (=> res!800454 e!682939)))

(assert (=> b!1202688 (= res!800454 (not (= (select (arr!37620 _keys!1208) from!1455) k!934)))))

(assert (=> b!1202688 e!682941))

(declare-fun c!117708 () Bool)

(assert (=> b!1202688 (= c!117708 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545135 () Unit!39871)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1010 (array!77951 array!77953 (_ BitVec 32) (_ BitVec 32) V!45913 V!45913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39871)

(assert (=> b!1202688 (= lt!545135 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1010 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202689 () Bool)

(declare-fun e!682934 () Bool)

(assert (=> b!1202689 (= e!682934 (and e!682942 mapRes!47726))))

(declare-fun condMapEmpty!47726 () Bool)

(declare-fun mapDefault!47726 () ValueCell!14585)

