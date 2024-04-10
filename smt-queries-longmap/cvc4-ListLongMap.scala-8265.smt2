; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100542 () Bool)

(assert start!100542)

(declare-fun b_free!25865 () Bool)

(declare-fun b_next!25865 () Bool)

(assert (=> start!100542 (= b_free!25865 (not b_next!25865))))

(declare-fun tp!90585 () Bool)

(declare-fun b_and!42617 () Bool)

(assert (=> start!100542 (= tp!90585 b_and!42617)))

(declare-fun b!1201907 () Bool)

(declare-fun e!682513 () Bool)

(declare-fun e!682514 () Bool)

(assert (=> b!1201907 (= e!682513 e!682514)))

(declare-fun res!800033 () Bool)

(assert (=> b!1201907 (=> res!800033 e!682514)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201907 (= res!800033 (not (= from!1455 i!673)))))

(declare-datatypes ((V!45885 0))(
  ( (V!45886 (val!15341 Int)) )
))
(declare-fun zeroValue!944 () V!45885)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14575 0))(
  ( (ValueCellFull!14575 (v!17979 V!45885)) (EmptyCell!14575) )
))
(declare-datatypes ((array!77911 0))(
  ( (array!77912 (arr!37600 (Array (_ BitVec 32) ValueCell!14575)) (size!38136 (_ BitVec 32))) )
))
(declare-fun lt!544707 () array!77911)

(declare-datatypes ((tuple2!19654 0))(
  ( (tuple2!19655 (_1!9838 (_ BitVec 64)) (_2!9838 V!45885)) )
))
(declare-datatypes ((List!26469 0))(
  ( (Nil!26466) (Cons!26465 (h!27674 tuple2!19654) (t!39314 List!26469)) )
))
(declare-datatypes ((ListLongMap!17623 0))(
  ( (ListLongMap!17624 (toList!8827 List!26469)) )
))
(declare-fun lt!544716 () ListLongMap!17623)

(declare-datatypes ((array!77913 0))(
  ( (array!77914 (arr!37601 (Array (_ BitVec 32) (_ BitVec 64))) (size!38137 (_ BitVec 32))) )
))
(declare-fun lt!544717 () array!77913)

(declare-fun minValue!944 () V!45885)

(declare-fun getCurrentListMapNoExtraKeys!5265 (array!77913 array!77911 (_ BitVec 32) (_ BitVec 32) V!45885 V!45885 (_ BitVec 32) Int) ListLongMap!17623)

(assert (=> b!1201907 (= lt!544716 (getCurrentListMapNoExtraKeys!5265 lt!544717 lt!544707 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77911)

(declare-fun dynLambda!3181 (Int (_ BitVec 64)) V!45885)

(assert (=> b!1201907 (= lt!544707 (array!77912 (store (arr!37600 _values!996) i!673 (ValueCellFull!14575 (dynLambda!3181 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38136 _values!996)))))

(declare-fun _keys!1208 () array!77913)

(declare-fun lt!544713 () ListLongMap!17623)

(assert (=> b!1201907 (= lt!544713 (getCurrentListMapNoExtraKeys!5265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!544719 () ListLongMap!17623)

(declare-datatypes ((Unit!39847 0))(
  ( (Unit!39848) )
))
(declare-fun call!57581 () Unit!39847)

(declare-fun c!117589 () Bool)

(declare-fun bm!57577 () Bool)

(declare-fun c!117590 () Bool)

(declare-fun addStillContains!985 (ListLongMap!17623 (_ BitVec 64) V!45885 (_ BitVec 64)) Unit!39847)

(assert (=> bm!57577 (= call!57581 (addStillContains!985 lt!544719 (ite (or c!117590 c!117589) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117590 c!117589) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1201908 () Bool)

(declare-fun res!800034 () Bool)

(declare-fun e!682521 () Bool)

(assert (=> b!1201908 (=> (not res!800034) (not e!682521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201908 (= res!800034 (validMask!0 mask!1564))))

(declare-fun b!1201909 () Bool)

(declare-fun e!682518 () Bool)

(assert (=> b!1201909 (= e!682518 (not e!682513))))

(declare-fun res!800030 () Bool)

(assert (=> b!1201909 (=> res!800030 e!682513)))

(assert (=> b!1201909 (= res!800030 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201909 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!544711 () Unit!39847)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77913 (_ BitVec 64) (_ BitVec 32)) Unit!39847)

(assert (=> b!1201909 (= lt!544711 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1201910 () Bool)

(declare-fun call!57584 () Bool)

(assert (=> b!1201910 call!57584))

(declare-fun lt!544712 () Unit!39847)

(declare-fun call!57582 () Unit!39847)

(assert (=> b!1201910 (= lt!544712 call!57582)))

(declare-fun e!682524 () Unit!39847)

(assert (=> b!1201910 (= e!682524 lt!544712)))

(declare-fun call!57587 () ListLongMap!17623)

(declare-fun bm!57578 () Bool)

(assert (=> bm!57578 (= call!57587 (getCurrentListMapNoExtraKeys!5265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201911 () Bool)

(declare-fun res!800028 () Bool)

(assert (=> b!1201911 (=> (not res!800028) (not e!682521))))

(declare-datatypes ((List!26470 0))(
  ( (Nil!26467) (Cons!26466 (h!27675 (_ BitVec 64)) (t!39315 List!26470)) )
))
(declare-fun arrayNoDuplicates!0 (array!77913 (_ BitVec 32) List!26470) Bool)

(assert (=> b!1201911 (= res!800028 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26467))))

(declare-fun b!1201912 () Bool)

(declare-fun e!682520 () Unit!39847)

(assert (=> b!1201912 (= e!682520 e!682524)))

(declare-fun lt!544708 () Bool)

(assert (=> b!1201912 (= c!117589 (and (not lt!544708) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201913 () Bool)

(declare-fun e!682512 () Bool)

(declare-fun call!57585 () ListLongMap!17623)

(assert (=> b!1201913 (= e!682512 (= call!57585 call!57587))))

(declare-fun b!1201914 () Bool)

(declare-fun e!682525 () Unit!39847)

(declare-fun Unit!39849 () Unit!39847)

(assert (=> b!1201914 (= e!682525 Unit!39849)))

(declare-fun bm!57579 () Bool)

(declare-fun call!57586 () ListLongMap!17623)

(declare-fun call!57583 () ListLongMap!17623)

(assert (=> bm!57579 (= call!57586 call!57583)))

(declare-fun lt!544709 () ListLongMap!17623)

(declare-fun bm!57581 () Bool)

(declare-fun call!57580 () Bool)

(declare-fun contains!6884 (ListLongMap!17623 (_ BitVec 64)) Bool)

(assert (=> bm!57581 (= call!57580 (contains!6884 (ite c!117590 lt!544709 call!57586) k!934))))

(declare-fun b!1201915 () Bool)

(declare-fun e!682517 () Bool)

(declare-fun tp_is_empty!30569 () Bool)

(assert (=> b!1201915 (= e!682517 tp_is_empty!30569)))

(declare-fun b!1201916 () Bool)

(declare-fun res!800036 () Bool)

(assert (=> b!1201916 (=> (not res!800036) (not e!682521))))

(assert (=> b!1201916 (= res!800036 (= (select (arr!37601 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!47696 () Bool)

(declare-fun mapRes!47696 () Bool)

(assert (=> mapIsEmpty!47696 mapRes!47696))

(declare-fun b!1201917 () Bool)

(declare-fun e!682515 () Bool)

(declare-fun e!682519 () Bool)

(assert (=> b!1201917 (= e!682515 e!682519)))

(declare-fun res!800031 () Bool)

(assert (=> b!1201917 (=> res!800031 e!682519)))

(assert (=> b!1201917 (= res!800031 (not (contains!6884 lt!544719 k!934)))))

(assert (=> b!1201917 (= lt!544719 (getCurrentListMapNoExtraKeys!5265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47696 () Bool)

(declare-fun tp!90584 () Bool)

(declare-fun e!682523 () Bool)

(assert (=> mapNonEmpty!47696 (= mapRes!47696 (and tp!90584 e!682523))))

(declare-fun mapValue!47696 () ValueCell!14575)

(declare-fun mapKey!47696 () (_ BitVec 32))

(declare-fun mapRest!47696 () (Array (_ BitVec 32) ValueCell!14575))

(assert (=> mapNonEmpty!47696 (= (arr!37600 _values!996) (store mapRest!47696 mapKey!47696 mapValue!47696))))

(declare-fun bm!57582 () Bool)

(declare-fun +!3957 (ListLongMap!17623 tuple2!19654) ListLongMap!17623)

(assert (=> bm!57582 (= call!57583 (+!3957 lt!544719 (ite (or c!117590 c!117589) (tuple2!19655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!57583 () Bool)

(assert (=> bm!57583 (= call!57582 call!57581)))

(declare-fun b!1201918 () Bool)

(declare-fun res!800037 () Bool)

(assert (=> b!1201918 (=> (not res!800037) (not e!682521))))

(assert (=> b!1201918 (= res!800037 (and (= (size!38136 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38137 _keys!1208) (size!38136 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201919 () Bool)

(assert (=> b!1201919 (= e!682514 e!682515)))

(declare-fun res!800040 () Bool)

(assert (=> b!1201919 (=> res!800040 e!682515)))

(assert (=> b!1201919 (= res!800040 (not (= (select (arr!37601 _keys!1208) from!1455) k!934)))))

(assert (=> b!1201919 e!682512))

(declare-fun c!117588 () Bool)

(assert (=> b!1201919 (= c!117588 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544714 () Unit!39847)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1004 (array!77913 array!77911 (_ BitVec 32) (_ BitVec 32) V!45885 V!45885 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39847)

(assert (=> b!1201919 (= lt!544714 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1004 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201920 () Bool)

(declare-fun res!800027 () Bool)

(assert (=> b!1201920 (=> (not res!800027) (not e!682518))))

(assert (=> b!1201920 (= res!800027 (arrayNoDuplicates!0 lt!544717 #b00000000000000000000000000000000 Nil!26467))))

(declare-fun b!1201921 () Bool)

(declare-fun e!682516 () Bool)

(assert (=> b!1201921 (= e!682516 (and e!682517 mapRes!47696))))

(declare-fun condMapEmpty!47696 () Bool)

(declare-fun mapDefault!47696 () ValueCell!14575)

