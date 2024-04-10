; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98184 () Bool)

(assert start!98184)

(declare-fun b_free!23885 () Bool)

(declare-fun b_next!23885 () Bool)

(assert (=> start!98184 (= b_free!23885 (not b_next!23885))))

(declare-fun tp!84358 () Bool)

(declare-fun b_and!38553 () Bool)

(assert (=> start!98184 (= tp!84358 b_and!38553)))

(declare-fun b!1129596 () Bool)

(declare-fun res!754829 () Bool)

(declare-fun e!642875 () Bool)

(assert (=> b!1129596 (=> (not res!754829) (not e!642875))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129596 (= res!754829 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!43013 0))(
  ( (V!43014 (val!14264 Int)) )
))
(declare-fun zeroValue!944 () V!43013)

(declare-datatypes ((array!73687 0))(
  ( (array!73688 (arr!35496 (Array (_ BitVec 32) (_ BitVec 64))) (size!36032 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73687)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13498 0))(
  ( (ValueCellFull!13498 (v!16897 V!43013)) (EmptyCell!13498) )
))
(declare-datatypes ((array!73689 0))(
  ( (array!73690 (arr!35497 (Array (_ BitVec 32) ValueCell!13498)) (size!36033 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73689)

(declare-fun bm!48090 () Bool)

(declare-fun minValue!944 () V!43013)

(declare-datatypes ((tuple2!17962 0))(
  ( (tuple2!17963 (_1!8992 (_ BitVec 64)) (_2!8992 V!43013)) )
))
(declare-datatypes ((List!24729 0))(
  ( (Nil!24726) (Cons!24725 (h!25934 tuple2!17962) (t!35606 List!24729)) )
))
(declare-datatypes ((ListLongMap!15931 0))(
  ( (ListLongMap!15932 (toList!7981 List!24729)) )
))
(declare-fun call!48099 () ListLongMap!15931)

(declare-fun getCurrentListMapNoExtraKeys!4468 (array!73687 array!73689 (_ BitVec 32) (_ BitVec 32) V!43013 V!43013 (_ BitVec 32) Int) ListLongMap!15931)

(assert (=> bm!48090 (= call!48099 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!642874 () Bool)

(declare-fun call!48098 () ListLongMap!15931)

(declare-fun b!1129597 () Bool)

(declare-fun -!1162 (ListLongMap!15931 (_ BitVec 64)) ListLongMap!15931)

(assert (=> b!1129597 (= e!642874 (= call!48098 (-!1162 call!48099 k!934)))))

(declare-fun b!1129599 () Bool)

(declare-datatypes ((Unit!37006 0))(
  ( (Unit!37007) )
))
(declare-fun e!642876 () Unit!37006)

(declare-fun e!642870 () Unit!37006)

(assert (=> b!1129599 (= e!642876 e!642870)))

(declare-fun c!109896 () Bool)

(declare-fun lt!501520 () Bool)

(assert (=> b!1129599 (= c!109896 (and (not lt!501520) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44440 () Bool)

(declare-fun mapRes!44440 () Bool)

(declare-fun tp!84359 () Bool)

(declare-fun e!642880 () Bool)

(assert (=> mapNonEmpty!44440 (= mapRes!44440 (and tp!84359 e!642880))))

(declare-fun mapValue!44440 () ValueCell!13498)

(declare-fun mapKey!44440 () (_ BitVec 32))

(declare-fun mapRest!44440 () (Array (_ BitVec 32) ValueCell!13498))

(assert (=> mapNonEmpty!44440 (= (arr!35497 _values!996) (store mapRest!44440 mapKey!44440 mapValue!44440))))

(declare-fun b!1129600 () Bool)

(declare-fun e!642868 () Bool)

(declare-fun e!642871 () Bool)

(assert (=> b!1129600 (= e!642868 (not e!642871))))

(declare-fun res!754833 () Bool)

(assert (=> b!1129600 (=> res!754833 e!642871)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129600 (= res!754833 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129600 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501514 () Unit!37006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73687 (_ BitVec 64) (_ BitVec 32)) Unit!37006)

(assert (=> b!1129600 (= lt!501514 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1129601 () Bool)

(declare-fun e!642881 () Bool)

(declare-fun e!642879 () Bool)

(assert (=> b!1129601 (= e!642881 e!642879)))

(declare-fun res!754834 () Bool)

(assert (=> b!1129601 (=> res!754834 e!642879)))

(assert (=> b!1129601 (= res!754834 (not (= (select (arr!35496 _keys!1208) from!1455) k!934)))))

(assert (=> b!1129601 e!642874))

(declare-fun c!109899 () Bool)

(assert (=> b!1129601 (= c!109899 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501515 () Unit!37006)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!414 (array!73687 array!73689 (_ BitVec 32) (_ BitVec 32) V!43013 V!43013 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37006)

(assert (=> b!1129601 (= lt!501515 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129602 () Bool)

(declare-fun e!642872 () Bool)

(declare-fun tp_is_empty!28415 () Bool)

(assert (=> b!1129602 (= e!642872 tp_is_empty!28415)))

(declare-fun call!48095 () Unit!37006)

(declare-fun lt!501516 () ListLongMap!15931)

(declare-fun lt!501525 () ListLongMap!15931)

(declare-fun bm!48091 () Bool)

(declare-fun c!109898 () Bool)

(declare-fun addStillContains!695 (ListLongMap!15931 (_ BitVec 64) V!43013 (_ BitVec 64)) Unit!37006)

(assert (=> bm!48091 (= call!48095 (addStillContains!695 (ite c!109898 lt!501516 lt!501525) (ite c!109898 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109896 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109898 minValue!944 (ite c!109896 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1129603 () Bool)

(declare-fun res!754843 () Bool)

(assert (=> b!1129603 (=> (not res!754843) (not e!642875))))

(assert (=> b!1129603 (= res!754843 (= (select (arr!35496 _keys!1208) i!673) k!934))))

(declare-fun b!1129604 () Bool)

(declare-fun call!48094 () Bool)

(assert (=> b!1129604 call!48094))

(declare-fun lt!501521 () Unit!37006)

(declare-fun call!48100 () Unit!37006)

(assert (=> b!1129604 (= lt!501521 call!48100)))

(assert (=> b!1129604 (= e!642870 lt!501521)))

(declare-fun b!1129605 () Bool)

(assert (=> b!1129605 (= e!642880 tp_is_empty!28415)))

(declare-fun b!1129606 () Bool)

(assert (=> b!1129606 (= e!642871 e!642881)))

(declare-fun res!754839 () Bool)

(assert (=> b!1129606 (=> res!754839 e!642881)))

(assert (=> b!1129606 (= res!754839 (not (= from!1455 i!673)))))

(declare-fun lt!501517 () array!73689)

(declare-fun lt!501518 () array!73687)

(declare-fun lt!501526 () ListLongMap!15931)

(assert (=> b!1129606 (= lt!501526 (getCurrentListMapNoExtraKeys!4468 lt!501518 lt!501517 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2546 (Int (_ BitVec 64)) V!43013)

(assert (=> b!1129606 (= lt!501517 (array!73690 (store (arr!35497 _values!996) i!673 (ValueCellFull!13498 (dynLambda!2546 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36033 _values!996)))))

(declare-fun lt!501523 () ListLongMap!15931)

(assert (=> b!1129606 (= lt!501523 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129607 () Bool)

(declare-fun res!754840 () Bool)

(assert (=> b!1129607 (=> (not res!754840) (not e!642875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129607 (= res!754840 (validMask!0 mask!1564))))

(declare-fun bm!48092 () Bool)

(declare-fun call!48093 () ListLongMap!15931)

(declare-fun +!3432 (ListLongMap!15931 tuple2!17962) ListLongMap!15931)

(assert (=> bm!48092 (= call!48093 (+!3432 lt!501525 (ite (or c!109898 c!109896) (tuple2!17963 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!48093 () Bool)

(assert (=> bm!48093 (= call!48098 (getCurrentListMapNoExtraKeys!4468 lt!501518 lt!501517 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48094 () Bool)

(declare-fun call!48097 () Bool)

(assert (=> bm!48094 (= call!48094 call!48097)))

(declare-fun b!1129608 () Bool)

(declare-fun e!642869 () Bool)

(assert (=> b!1129608 (= e!642879 e!642869)))

(declare-fun res!754835 () Bool)

(assert (=> b!1129608 (=> res!754835 e!642869)))

(declare-fun contains!6504 (ListLongMap!15931 (_ BitVec 64)) Bool)

(assert (=> b!1129608 (= res!754835 (not (contains!6504 lt!501525 k!934)))))

(assert (=> b!1129608 (= lt!501525 (getCurrentListMapNoExtraKeys!4468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129609 () Bool)

(declare-fun e!642878 () Unit!37006)

(declare-fun Unit!37008 () Unit!37006)

(assert (=> b!1129609 (= e!642878 Unit!37008)))

(declare-fun b!1129610 () Bool)

(declare-fun res!754837 () Bool)

(assert (=> b!1129610 (=> (not res!754837) (not e!642875))))

(assert (=> b!1129610 (= res!754837 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36032 _keys!1208))))))

(declare-fun call!48096 () ListLongMap!15931)

(declare-fun bm!48095 () Bool)

(assert (=> bm!48095 (= call!48097 (contains!6504 (ite c!109898 lt!501516 call!48096) k!934))))

(declare-fun bm!48096 () Bool)

(assert (=> bm!48096 (= call!48096 call!48093)))

(declare-fun b!1129611 () Bool)

(declare-fun e!642882 () Bool)

(assert (=> b!1129611 (= e!642882 (and e!642872 mapRes!44440))))

(declare-fun condMapEmpty!44440 () Bool)

(declare-fun mapDefault!44440 () ValueCell!13498)

