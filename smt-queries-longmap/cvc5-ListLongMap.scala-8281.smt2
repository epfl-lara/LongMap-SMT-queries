; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100818 () Bool)

(assert start!100818)

(declare-fun b_free!25957 () Bool)

(declare-fun b_next!25957 () Bool)

(assert (=> start!100818 (= b_free!25957 (not b_next!25957))))

(declare-fun tp!90876 () Bool)

(declare-fun b_and!42915 () Bool)

(assert (=> start!100818 (= tp!90876 b_and!42915)))

(declare-fun b!1206893 () Bool)

(declare-fun e!685395 () Bool)

(declare-fun e!685393 () Bool)

(assert (=> b!1206893 (= e!685395 (not e!685393))))

(declare-fun res!802545 () Bool)

(assert (=> b!1206893 (=> res!802545 e!685393)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206893 (= res!802545 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78105 0))(
  ( (array!78106 (arr!37692 (Array (_ BitVec 32) (_ BitVec 64))) (size!38228 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78105)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206893 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40007 0))(
  ( (Unit!40008) )
))
(declare-fun lt!547553 () Unit!40007)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78105 (_ BitVec 64) (_ BitVec 32)) Unit!40007)

(assert (=> b!1206893 (= lt!547553 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1206894 () Bool)

(declare-fun res!802547 () Bool)

(declare-fun e!685397 () Bool)

(assert (=> b!1206894 (=> (not res!802547) (not e!685397))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46009 0))(
  ( (V!46010 (val!15387 Int)) )
))
(declare-datatypes ((ValueCell!14621 0))(
  ( (ValueCellFull!14621 (v!18032 V!46009)) (EmptyCell!14621) )
))
(declare-datatypes ((array!78107 0))(
  ( (array!78108 (arr!37693 (Array (_ BitVec 32) ValueCell!14621)) (size!38229 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78107)

(assert (=> b!1206894 (= res!802547 (and (= (size!38229 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38228 _keys!1208) (size!38229 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206895 () Bool)

(declare-fun res!802543 () Bool)

(assert (=> b!1206895 (=> (not res!802543) (not e!685397))))

(assert (=> b!1206895 (= res!802543 (= (select (arr!37692 _keys!1208) i!673) k!934))))

(declare-fun b!1206896 () Bool)

(declare-fun res!802548 () Bool)

(assert (=> b!1206896 (=> (not res!802548) (not e!685395))))

(declare-fun lt!547556 () array!78105)

(declare-datatypes ((List!26548 0))(
  ( (Nil!26545) (Cons!26544 (h!27753 (_ BitVec 64)) (t!39485 List!26548)) )
))
(declare-fun arrayNoDuplicates!0 (array!78105 (_ BitVec 32) List!26548) Bool)

(assert (=> b!1206896 (= res!802548 (arrayNoDuplicates!0 lt!547556 #b00000000000000000000000000000000 Nil!26545))))

(declare-fun e!685383 () Bool)

(declare-fun b!1206897 () Bool)

(assert (=> b!1206897 (= e!685383 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58830 () Bool)

(declare-datatypes ((tuple2!19746 0))(
  ( (tuple2!19747 (_1!9884 (_ BitVec 64)) (_2!9884 V!46009)) )
))
(declare-datatypes ((List!26549 0))(
  ( (Nil!26546) (Cons!26545 (h!27754 tuple2!19746) (t!39486 List!26549)) )
))
(declare-datatypes ((ListLongMap!17715 0))(
  ( (ListLongMap!17716 (toList!8873 List!26549)) )
))
(declare-fun call!58834 () ListLongMap!17715)

(declare-fun call!58835 () ListLongMap!17715)

(assert (=> bm!58830 (= call!58834 call!58835)))

(declare-fun b!1206898 () Bool)

(declare-fun e!685389 () Bool)

(declare-fun call!58838 () ListLongMap!17715)

(declare-fun call!58839 () ListLongMap!17715)

(assert (=> b!1206898 (= e!685389 (= call!58838 call!58839))))

(declare-fun zeroValue!944 () V!46009)

(declare-fun call!58836 () Unit!40007)

(declare-fun lt!547548 () ListLongMap!17715)

(declare-fun c!118551 () Bool)

(declare-fun c!118549 () Bool)

(declare-fun minValue!944 () V!46009)

(declare-fun bm!58831 () Bool)

(declare-fun addStillContains!1023 (ListLongMap!17715 (_ BitVec 64) V!46009 (_ BitVec 64)) Unit!40007)

(assert (=> bm!58831 (= call!58836 (addStillContains!1023 lt!547548 (ite (or c!118549 c!118551) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118549 c!118551) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1206899 () Bool)

(declare-fun call!58837 () Bool)

(assert (=> b!1206899 call!58837))

(declare-fun lt!547551 () Unit!40007)

(declare-fun call!58840 () Unit!40007)

(assert (=> b!1206899 (= lt!547551 call!58840)))

(declare-fun e!685388 () Unit!40007)

(assert (=> b!1206899 (= e!685388 lt!547551)))

(declare-fun b!1206900 () Bool)

(declare-fun e!685392 () Bool)

(declare-fun e!685384 () Bool)

(assert (=> b!1206900 (= e!685392 e!685384)))

(declare-fun res!802537 () Bool)

(assert (=> b!1206900 (=> res!802537 e!685384)))

(declare-fun contains!6932 (ListLongMap!17715 (_ BitVec 64)) Bool)

(assert (=> b!1206900 (= res!802537 (not (contains!6932 lt!547548 k!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5307 (array!78105 array!78107 (_ BitVec 32) (_ BitVec 32) V!46009 V!46009 (_ BitVec 32) Int) ListLongMap!17715)

(assert (=> b!1206900 (= lt!547548 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58832 () Bool)

(assert (=> bm!58832 (= call!58839 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206901 () Bool)

(declare-fun e!685390 () Unit!40007)

(declare-fun Unit!40009 () Unit!40007)

(assert (=> b!1206901 (= e!685390 Unit!40009)))

(declare-fun b!1206902 () Bool)

(declare-fun res!802539 () Bool)

(assert (=> b!1206902 (=> (not res!802539) (not e!685397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78105 (_ BitVec 32)) Bool)

(assert (=> b!1206902 (= res!802539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47850 () Bool)

(declare-fun mapRes!47850 () Bool)

(declare-fun tp!90877 () Bool)

(declare-fun e!685391 () Bool)

(assert (=> mapNonEmpty!47850 (= mapRes!47850 (and tp!90877 e!685391))))

(declare-fun mapKey!47850 () (_ BitVec 32))

(declare-fun mapRest!47850 () (Array (_ BitVec 32) ValueCell!14621))

(declare-fun mapValue!47850 () ValueCell!14621)

(assert (=> mapNonEmpty!47850 (= (arr!37693 _values!996) (store mapRest!47850 mapKey!47850 mapValue!47850))))

(declare-fun lt!547555 () ListLongMap!17715)

(declare-fun bm!58833 () Bool)

(declare-fun +!3994 (ListLongMap!17715 tuple2!19746) ListLongMap!17715)

(assert (=> bm!58833 (= call!58835 (+!3994 (ite c!118549 lt!547555 lt!547548) (ite c!118549 (tuple2!19747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118551 (tuple2!19747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19747 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!547544 () array!78107)

(declare-fun bm!58834 () Bool)

(assert (=> bm!58834 (= call!58838 (getCurrentListMapNoExtraKeys!5307 lt!547556 lt!547544 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206903 () Bool)

(declare-fun c!118550 () Bool)

(declare-fun lt!547558 () Bool)

(assert (=> b!1206903 (= c!118550 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547558))))

(assert (=> b!1206903 (= e!685388 e!685390)))

(declare-fun bm!58835 () Bool)

(declare-fun call!58833 () Bool)

(assert (=> bm!58835 (= call!58833 (contains!6932 (ite c!118549 lt!547555 call!58834) k!934))))

(declare-fun bm!58836 () Bool)

(assert (=> bm!58836 (= call!58840 call!58836)))

(declare-fun b!1206904 () Bool)

(declare-fun e!685387 () Bool)

(assert (=> b!1206904 (= e!685393 e!685387)))

(declare-fun res!802536 () Bool)

(assert (=> b!1206904 (=> res!802536 e!685387)))

(assert (=> b!1206904 (= res!802536 (not (= from!1455 i!673)))))

(declare-fun lt!547550 () ListLongMap!17715)

(assert (=> b!1206904 (= lt!547550 (getCurrentListMapNoExtraKeys!5307 lt!547556 lt!547544 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3211 (Int (_ BitVec 64)) V!46009)

(assert (=> b!1206904 (= lt!547544 (array!78108 (store (arr!37693 _values!996) i!673 (ValueCellFull!14621 (dynLambda!3211 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38229 _values!996)))))

(declare-fun lt!547546 () ListLongMap!17715)

(assert (=> b!1206904 (= lt!547546 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206905 () Bool)

(declare-fun res!802540 () Bool)

(assert (=> b!1206905 (=> (not res!802540) (not e!685397))))

(assert (=> b!1206905 (= res!802540 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38228 _keys!1208))))))

(declare-fun b!1206906 () Bool)

(declare-fun res!802541 () Bool)

(assert (=> b!1206906 (=> (not res!802541) (not e!685397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206906 (= res!802541 (validKeyInArray!0 k!934))))

(declare-fun b!1206907 () Bool)

(declare-fun e!685382 () Bool)

(declare-fun e!685385 () Bool)

(assert (=> b!1206907 (= e!685382 (and e!685385 mapRes!47850))))

(declare-fun condMapEmpty!47850 () Bool)

(declare-fun mapDefault!47850 () ValueCell!14621)

