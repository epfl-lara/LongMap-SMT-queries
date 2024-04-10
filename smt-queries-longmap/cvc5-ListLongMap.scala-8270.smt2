; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100568 () Bool)

(assert start!100568)

(declare-fun b_free!25891 () Bool)

(declare-fun b_next!25891 () Bool)

(assert (=> start!100568 (= b_free!25891 (not b_next!25891))))

(declare-fun tp!90663 () Bool)

(declare-fun b_and!42669 () Bool)

(assert (=> start!100568 (= tp!90663 b_and!42669)))

(declare-fun b!1202908 () Bool)

(declare-fun res!800581 () Bool)

(declare-fun e!683066 () Bool)

(assert (=> b!1202908 (=> (not res!800581) (not e!683066))))

(declare-datatypes ((array!77963 0))(
  ( (array!77964 (arr!37626 (Array (_ BitVec 32) (_ BitVec 64))) (size!38162 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77963)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77963 (_ BitVec 32)) Bool)

(assert (=> b!1202908 (= res!800581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202909 () Bool)

(declare-datatypes ((Unit!39878 0))(
  ( (Unit!39879) )
))
(declare-fun e!683067 () Unit!39878)

(declare-fun lt!545253 () Unit!39878)

(assert (=> b!1202909 (= e!683067 lt!545253)))

(declare-fun call!57893 () Unit!39878)

(assert (=> b!1202909 (= lt!545253 call!57893)))

(declare-fun call!57892 () Bool)

(assert (=> b!1202909 call!57892))

(declare-fun b!1202910 () Bool)

(declare-fun e!683059 () Bool)

(declare-fun tp_is_empty!30595 () Bool)

(assert (=> b!1202910 (= e!683059 tp_is_empty!30595)))

(declare-fun b!1202911 () Bool)

(declare-fun e!683063 () Bool)

(declare-fun e!683065 () Bool)

(assert (=> b!1202911 (= e!683063 e!683065)))

(declare-fun res!800576 () Bool)

(assert (=> b!1202911 (=> res!800576 e!683065)))

(declare-datatypes ((V!45921 0))(
  ( (V!45922 (val!15354 Int)) )
))
(declare-datatypes ((tuple2!19680 0))(
  ( (tuple2!19681 (_1!9851 (_ BitVec 64)) (_2!9851 V!45921)) )
))
(declare-datatypes ((List!26490 0))(
  ( (Nil!26487) (Cons!26486 (h!27695 tuple2!19680) (t!39361 List!26490)) )
))
(declare-datatypes ((ListLongMap!17649 0))(
  ( (ListLongMap!17650 (toList!8840 List!26490)) )
))
(declare-fun lt!545254 () ListLongMap!17649)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun contains!6894 (ListLongMap!17649 (_ BitVec 64)) Bool)

(assert (=> b!1202911 (= res!800576 (not (contains!6894 lt!545254 k!934)))))

(declare-fun zeroValue!944 () V!45921)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14588 0))(
  ( (ValueCellFull!14588 (v!17992 V!45921)) (EmptyCell!14588) )
))
(declare-datatypes ((array!77965 0))(
  ( (array!77966 (arr!37627 (Array (_ BitVec 32) ValueCell!14588)) (size!38163 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77965)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45921)

(declare-fun getCurrentListMapNoExtraKeys!5276 (array!77963 array!77965 (_ BitVec 32) (_ BitVec 32) V!45921 V!45921 (_ BitVec 32) Int) ListLongMap!17649)

(assert (=> b!1202911 (= lt!545254 (getCurrentListMapNoExtraKeys!5276 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545266 () ListLongMap!17649)

(declare-fun bm!57889 () Bool)

(declare-fun c!117746 () Bool)

(declare-fun call!57895 () ListLongMap!17649)

(declare-fun call!57897 () Bool)

(assert (=> bm!57889 (= call!57897 (contains!6894 (ite c!117746 lt!545266 call!57895) k!934))))

(declare-fun b!1202912 () Bool)

(declare-fun e!683061 () Bool)

(assert (=> b!1202912 (= e!683066 e!683061)))

(declare-fun res!800575 () Bool)

(assert (=> b!1202912 (=> (not res!800575) (not e!683061))))

(declare-fun lt!545258 () array!77963)

(assert (=> b!1202912 (= res!800575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545258 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202912 (= lt!545258 (array!77964 (store (arr!37626 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38162 _keys!1208)))))

(declare-fun b!1202913 () Bool)

(declare-fun e!683070 () Unit!39878)

(declare-fun lt!545256 () Unit!39878)

(assert (=> b!1202913 (= e!683070 lt!545256)))

(declare-fun lt!545264 () Unit!39878)

(declare-fun addStillContains!995 (ListLongMap!17649 (_ BitVec 64) V!45921 (_ BitVec 64)) Unit!39878)

(assert (=> b!1202913 (= lt!545264 (addStillContains!995 lt!545254 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun call!57896 () ListLongMap!17649)

(assert (=> b!1202913 (= lt!545266 call!57896)))

(assert (=> b!1202913 call!57897))

(declare-fun call!57899 () Unit!39878)

(assert (=> b!1202913 (= lt!545256 call!57899)))

(declare-fun +!3966 (ListLongMap!17649 tuple2!19680) ListLongMap!17649)

(assert (=> b!1202913 (contains!6894 (+!3966 lt!545266 (tuple2!19681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1202914 () Bool)

(declare-fun res!800579 () Bool)

(assert (=> b!1202914 (=> (not res!800579) (not e!683066))))

(assert (=> b!1202914 (= res!800579 (and (= (size!38163 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38162 _keys!1208) (size!38163 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202915 () Bool)

(declare-fun res!800573 () Bool)

(assert (=> b!1202915 (=> (not res!800573) (not e!683066))))

(declare-datatypes ((List!26491 0))(
  ( (Nil!26488) (Cons!26487 (h!27696 (_ BitVec 64)) (t!39362 List!26491)) )
))
(declare-fun arrayNoDuplicates!0 (array!77963 (_ BitVec 32) List!26491) Bool)

(assert (=> b!1202915 (= res!800573 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26488))))

(declare-fun b!1202916 () Bool)

(declare-fun e!683064 () Bool)

(assert (=> b!1202916 (= e!683064 e!683063)))

(declare-fun res!800585 () Bool)

(assert (=> b!1202916 (=> res!800585 e!683063)))

(assert (=> b!1202916 (= res!800585 (not (= (select (arr!37626 _keys!1208) from!1455) k!934)))))

(declare-fun e!683069 () Bool)

(assert (=> b!1202916 e!683069))

(declare-fun c!117744 () Bool)

(assert (=> b!1202916 (= c!117744 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545259 () Unit!39878)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1012 (array!77963 array!77965 (_ BitVec 32) (_ BitVec 32) V!45921 V!45921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39878)

(assert (=> b!1202916 (= lt!545259 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1012 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202917 () Bool)

(declare-fun res!800578 () Bool)

(assert (=> b!1202917 (=> (not res!800578) (not e!683066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202917 (= res!800578 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!47735 () Bool)

(declare-fun mapRes!47735 () Bool)

(declare-fun tp!90662 () Bool)

(declare-fun e!683060 () Bool)

(assert (=> mapNonEmpty!47735 (= mapRes!47735 (and tp!90662 e!683060))))

(declare-fun mapKey!47735 () (_ BitVec 32))

(declare-fun mapValue!47735 () ValueCell!14588)

(declare-fun mapRest!47735 () (Array (_ BitVec 32) ValueCell!14588))

(assert (=> mapNonEmpty!47735 (= (arr!37627 _values!996) (store mapRest!47735 mapKey!47735 mapValue!47735))))

(declare-fun call!57894 () ListLongMap!17649)

(declare-fun call!57898 () ListLongMap!17649)

(declare-fun b!1202918 () Bool)

(declare-fun -!1807 (ListLongMap!17649 (_ BitVec 64)) ListLongMap!17649)

(assert (=> b!1202918 (= e!683069 (= call!57894 (-!1807 call!57898 k!934)))))

(declare-fun bm!57890 () Bool)

(assert (=> bm!57890 (= call!57892 call!57897)))

(declare-fun b!1202919 () Bool)

(declare-fun e!683058 () Bool)

(assert (=> b!1202919 (= e!683061 (not e!683058))))

(declare-fun res!800584 () Bool)

(assert (=> b!1202919 (=> res!800584 e!683058)))

(assert (=> b!1202919 (= res!800584 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202919 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!545262 () Unit!39878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77963 (_ BitVec 64) (_ BitVec 32)) Unit!39878)

(assert (=> b!1202919 (= lt!545262 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1202920 () Bool)

(assert (=> b!1202920 (= e!683060 tp_is_empty!30595)))

(declare-fun b!1202921 () Bool)

(assert (=> b!1202921 (= e!683065 true)))

(declare-fun lt!545257 () Unit!39878)

(assert (=> b!1202921 (= lt!545257 e!683070)))

(declare-fun lt!545265 () Bool)

(assert (=> b!1202921 (= c!117746 (and (not lt!545265) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202921 (= lt!545265 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!47735 () Bool)

(assert (=> mapIsEmpty!47735 mapRes!47735))

(declare-fun bm!57891 () Bool)

(assert (=> bm!57891 (= call!57893 call!57899)))

(declare-fun b!1202922 () Bool)

(declare-fun e!683068 () Bool)

(assert (=> b!1202922 (= e!683068 (and e!683059 mapRes!47735))))

(declare-fun condMapEmpty!47735 () Bool)

(declare-fun mapDefault!47735 () ValueCell!14588)

