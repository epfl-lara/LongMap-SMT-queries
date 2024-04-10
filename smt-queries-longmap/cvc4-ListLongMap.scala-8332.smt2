; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101422 () Bool)

(assert start!101422)

(declare-fun b_free!26267 () Bool)

(declare-fun b_next!26267 () Bool)

(assert (=> start!101422 (= b_free!26267 (not b_next!26267))))

(declare-fun tp!91832 () Bool)

(declare-fun b_and!43705 () Bool)

(assert (=> start!101422 (= tp!91832 b_and!43705)))

(declare-fun mapNonEmpty!48340 () Bool)

(declare-fun mapRes!48340 () Bool)

(declare-fun tp!91831 () Bool)

(declare-fun e!692073 () Bool)

(assert (=> mapNonEmpty!48340 (= mapRes!48340 (and tp!91831 e!692073))))

(declare-datatypes ((V!46421 0))(
  ( (V!46422 (val!15542 Int)) )
))
(declare-datatypes ((ValueCell!14776 0))(
  ( (ValueCellFull!14776 (v!18198 V!46421)) (EmptyCell!14776) )
))
(declare-fun mapValue!48340 () ValueCell!14776)

(declare-datatypes ((array!78717 0))(
  ( (array!78718 (arr!37990 (Array (_ BitVec 32) ValueCell!14776)) (size!38526 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78717)

(declare-fun mapKey!48340 () (_ BitVec 32))

(declare-fun mapRest!48340 () (Array (_ BitVec 32) ValueCell!14776))

(assert (=> mapNonEmpty!48340 (= (arr!37990 _values!996) (store mapRest!48340 mapKey!48340 mapValue!48340))))

(declare-fun b!1218928 () Bool)

(declare-fun e!692074 () Bool)

(declare-fun e!692076 () Bool)

(assert (=> b!1218928 (= e!692074 e!692076)))

(declare-fun res!809568 () Bool)

(assert (=> b!1218928 (=> res!809568 e!692076)))

(declare-datatypes ((array!78719 0))(
  ( (array!78720 (arr!37991 (Array (_ BitVec 32) (_ BitVec 64))) (size!38527 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78719)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218928 (= res!809568 (not (= (select (arr!37991 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!48340 () Bool)

(assert (=> mapIsEmpty!48340 mapRes!48340))

(declare-fun b!1218929 () Bool)

(declare-fun res!809564 () Bool)

(declare-fun e!692077 () Bool)

(assert (=> b!1218929 (=> (not res!809564) (not e!692077))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1218929 (= res!809564 (= (select (arr!37991 _keys!1208) i!673) k!934))))

(declare-fun b!1218930 () Bool)

(declare-fun res!809575 () Bool)

(assert (=> b!1218930 (=> (not res!809575) (not e!692077))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1218930 (= res!809575 (and (= (size!38526 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38527 _keys!1208) (size!38526 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218931 () Bool)

(declare-fun res!809565 () Bool)

(assert (=> b!1218931 (=> (not res!809565) (not e!692077))))

(declare-datatypes ((List!26798 0))(
  ( (Nil!26795) (Cons!26794 (h!28003 (_ BitVec 64)) (t!40045 List!26798)) )
))
(declare-fun arrayNoDuplicates!0 (array!78719 (_ BitVec 32) List!26798) Bool)

(assert (=> b!1218931 (= res!809565 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26795))))

(declare-fun b!1218932 () Bool)

(declare-fun e!692075 () Bool)

(assert (=> b!1218932 (= e!692075 true)))

(assert (=> b!1218932 e!692074))

(declare-fun res!809573 () Bool)

(assert (=> b!1218932 (=> (not res!809573) (not e!692074))))

(declare-datatypes ((tuple2!19996 0))(
  ( (tuple2!19997 (_1!10009 (_ BitVec 64)) (_2!10009 V!46421)) )
))
(declare-datatypes ((List!26799 0))(
  ( (Nil!26796) (Cons!26795 (h!28004 tuple2!19996) (t!40046 List!26799)) )
))
(declare-datatypes ((ListLongMap!17965 0))(
  ( (ListLongMap!17966 (toList!8998 List!26799)) )
))
(declare-fun lt!554155 () ListLongMap!17965)

(declare-fun lt!554150 () ListLongMap!17965)

(declare-fun lt!554154 () V!46421)

(declare-fun +!4067 (ListLongMap!17965 tuple2!19996) ListLongMap!17965)

(declare-fun get!19368 (ValueCell!14776 V!46421) V!46421)

(assert (=> b!1218932 (= res!809573 (= lt!554150 (+!4067 lt!554155 (tuple2!19997 (select (arr!37991 _keys!1208) from!1455) (get!19368 (select (arr!37990 _values!996) from!1455) lt!554154)))))))

(declare-fun b!1218933 () Bool)

(declare-fun e!692071 () Bool)

(declare-fun tp_is_empty!30971 () Bool)

(assert (=> b!1218933 (= e!692071 tp_is_empty!30971)))

(declare-fun b!1218934 () Bool)

(declare-fun res!809577 () Bool)

(assert (=> b!1218934 (=> (not res!809577) (not e!692077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218934 (= res!809577 (validMask!0 mask!1564))))

(declare-fun b!1218935 () Bool)

(declare-fun e!692078 () Bool)

(declare-fun e!692068 () Bool)

(assert (=> b!1218935 (= e!692078 e!692068)))

(declare-fun res!809576 () Bool)

(assert (=> b!1218935 (=> res!809576 e!692068)))

(assert (=> b!1218935 (= res!809576 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46421)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554148 () array!78717)

(declare-fun minValue!944 () V!46421)

(declare-fun lt!554157 () array!78719)

(declare-fun getCurrentListMapNoExtraKeys!5424 (array!78719 array!78717 (_ BitVec 32) (_ BitVec 32) V!46421 V!46421 (_ BitVec 32) Int) ListLongMap!17965)

(assert (=> b!1218935 (= lt!554150 (getCurrentListMapNoExtraKeys!5424 lt!554157 lt!554148 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1218935 (= lt!554148 (array!78718 (store (arr!37990 _values!996) i!673 (ValueCellFull!14776 lt!554154)) (size!38526 _values!996)))))

(declare-fun dynLambda!3307 (Int (_ BitVec 64)) V!46421)

(assert (=> b!1218935 (= lt!554154 (dynLambda!3307 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554149 () ListLongMap!17965)

(assert (=> b!1218935 (= lt!554149 (getCurrentListMapNoExtraKeys!5424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218936 () Bool)

(declare-fun res!809572 () Bool)

(assert (=> b!1218936 (=> (not res!809572) (not e!692077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78719 (_ BitVec 32)) Bool)

(assert (=> b!1218936 (= res!809572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218937 () Bool)

(assert (=> b!1218937 (= e!692073 tp_is_empty!30971)))

(declare-fun b!1218938 () Bool)

(declare-fun e!692070 () Bool)

(assert (=> b!1218938 (= e!692070 (not e!692078))))

(declare-fun res!809566 () Bool)

(assert (=> b!1218938 (=> res!809566 e!692078)))

(assert (=> b!1218938 (= res!809566 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218938 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40398 0))(
  ( (Unit!40399) )
))
(declare-fun lt!554152 () Unit!40398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78719 (_ BitVec 64) (_ BitVec 32)) Unit!40398)

(assert (=> b!1218938 (= lt!554152 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218939 () Bool)

(assert (=> b!1218939 (= e!692068 e!692075)))

(declare-fun res!809569 () Bool)

(assert (=> b!1218939 (=> res!809569 e!692075)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218939 (= res!809569 (not (validKeyInArray!0 (select (arr!37991 _keys!1208) from!1455))))))

(declare-fun lt!554153 () ListLongMap!17965)

(assert (=> b!1218939 (= lt!554153 lt!554155)))

(declare-fun lt!554156 () ListLongMap!17965)

(declare-fun -!1911 (ListLongMap!17965 (_ BitVec 64)) ListLongMap!17965)

(assert (=> b!1218939 (= lt!554155 (-!1911 lt!554156 k!934))))

(assert (=> b!1218939 (= lt!554153 (getCurrentListMapNoExtraKeys!5424 lt!554157 lt!554148 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218939 (= lt!554156 (getCurrentListMapNoExtraKeys!5424 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554151 () Unit!40398)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1118 (array!78719 array!78717 (_ BitVec 32) (_ BitVec 32) V!46421 V!46421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40398)

(assert (=> b!1218939 (= lt!554151 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1118 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!809567 () Bool)

(assert (=> start!101422 (=> (not res!809567) (not e!692077))))

(assert (=> start!101422 (= res!809567 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38527 _keys!1208))))))

(assert (=> start!101422 e!692077))

(assert (=> start!101422 tp_is_empty!30971))

(declare-fun array_inv!28914 (array!78719) Bool)

(assert (=> start!101422 (array_inv!28914 _keys!1208)))

(assert (=> start!101422 true))

(assert (=> start!101422 tp!91832))

(declare-fun e!692072 () Bool)

(declare-fun array_inv!28915 (array!78717) Bool)

(assert (=> start!101422 (and (array_inv!28915 _values!996) e!692072)))

(declare-fun b!1218940 () Bool)

(declare-fun res!809563 () Bool)

(assert (=> b!1218940 (=> (not res!809563) (not e!692077))))

(assert (=> b!1218940 (= res!809563 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38527 _keys!1208))))))

(declare-fun b!1218941 () Bool)

(declare-fun res!809574 () Bool)

(assert (=> b!1218941 (=> (not res!809574) (not e!692077))))

(assert (=> b!1218941 (= res!809574 (validKeyInArray!0 k!934))))

(declare-fun b!1218942 () Bool)

(assert (=> b!1218942 (= e!692072 (and e!692071 mapRes!48340))))

(declare-fun condMapEmpty!48340 () Bool)

(declare-fun mapDefault!48340 () ValueCell!14776)

