; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97994 () Bool)

(assert start!97994)

(declare-fun b_free!23695 () Bool)

(declare-fun b_next!23695 () Bool)

(assert (=> start!97994 (= b_free!23695 (not b_next!23695))))

(declare-fun tp!83788 () Bool)

(declare-fun b_and!38173 () Bool)

(assert (=> start!97994 (= tp!83788 b_and!38173)))

(declare-fun b!1123892 () Bool)

(declare-fun res!750906 () Bool)

(declare-fun e!639814 () Bool)

(assert (=> b!1123892 (=> (not res!750906) (not e!639814))))

(declare-datatypes ((array!73317 0))(
  ( (array!73318 (arr!35311 (Array (_ BitVec 32) (_ BitVec 64))) (size!35847 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73317)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1123892 (= res!750906 (= (select (arr!35311 _keys!1208) i!673) k!934))))

(declare-fun res!750905 () Bool)

(assert (=> start!97994 (=> (not res!750905) (not e!639814))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97994 (= res!750905 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35847 _keys!1208))))))

(assert (=> start!97994 e!639814))

(declare-fun tp_is_empty!28225 () Bool)

(assert (=> start!97994 tp_is_empty!28225))

(declare-fun array_inv!27106 (array!73317) Bool)

(assert (=> start!97994 (array_inv!27106 _keys!1208)))

(assert (=> start!97994 true))

(assert (=> start!97994 tp!83788))

(declare-datatypes ((V!42761 0))(
  ( (V!42762 (val!14169 Int)) )
))
(declare-datatypes ((ValueCell!13403 0))(
  ( (ValueCellFull!13403 (v!16802 V!42761)) (EmptyCell!13403) )
))
(declare-datatypes ((array!73319 0))(
  ( (array!73320 (arr!35312 (Array (_ BitVec 32) ValueCell!13403)) (size!35848 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73319)

(declare-fun e!639816 () Bool)

(declare-fun array_inv!27107 (array!73319) Bool)

(assert (=> start!97994 (and (array_inv!27107 _values!996) e!639816)))

(declare-fun b!1123893 () Bool)

(declare-fun res!750907 () Bool)

(assert (=> b!1123893 (=> (not res!750907) (not e!639814))))

(declare-datatypes ((List!24573 0))(
  ( (Nil!24570) (Cons!24569 (h!25778 (_ BitVec 64)) (t!35260 List!24573)) )
))
(declare-fun arrayNoDuplicates!0 (array!73317 (_ BitVec 32) List!24573) Bool)

(assert (=> b!1123893 (= res!750907 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24570))))

(declare-fun b!1123894 () Bool)

(declare-fun e!639810 () Bool)

(declare-fun e!639819 () Bool)

(assert (=> b!1123894 (= e!639810 e!639819)))

(declare-fun res!750908 () Bool)

(assert (=> b!1123894 (=> res!750908 e!639819)))

(assert (=> b!1123894 (= res!750908 (not (= from!1455 i!673)))))

(declare-datatypes ((tuple2!17794 0))(
  ( (tuple2!17795 (_1!8908 (_ BitVec 64)) (_2!8908 V!42761)) )
))
(declare-datatypes ((List!24574 0))(
  ( (Nil!24571) (Cons!24570 (h!25779 tuple2!17794) (t!35261 List!24574)) )
))
(declare-datatypes ((ListLongMap!15763 0))(
  ( (ListLongMap!15764 (toList!7897 List!24574)) )
))
(declare-fun lt!499255 () ListLongMap!15763)

(declare-fun lt!499252 () array!73317)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499253 () array!73319)

(declare-fun minValue!944 () V!42761)

(declare-fun zeroValue!944 () V!42761)

(declare-fun getCurrentListMapNoExtraKeys!4385 (array!73317 array!73319 (_ BitVec 32) (_ BitVec 32) V!42761 V!42761 (_ BitVec 32) Int) ListLongMap!15763)

(assert (=> b!1123894 (= lt!499255 (getCurrentListMapNoExtraKeys!4385 lt!499252 lt!499253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2481 (Int (_ BitVec 64)) V!42761)

(assert (=> b!1123894 (= lt!499253 (array!73320 (store (arr!35312 _values!996) i!673 (ValueCellFull!13403 (dynLambda!2481 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35848 _values!996)))))

(declare-fun lt!499249 () ListLongMap!15763)

(assert (=> b!1123894 (= lt!499249 (getCurrentListMapNoExtraKeys!4385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47367 () ListLongMap!15763)

(declare-fun call!47368 () ListLongMap!15763)

(declare-fun b!1123895 () Bool)

(declare-fun e!639813 () Bool)

(declare-fun -!1102 (ListLongMap!15763 (_ BitVec 64)) ListLongMap!15763)

(assert (=> b!1123895 (= e!639813 (= call!47367 (-!1102 call!47368 k!934)))))

(declare-fun b!1123896 () Bool)

(declare-fun res!750898 () Bool)

(declare-fun e!639815 () Bool)

(assert (=> b!1123896 (=> res!750898 e!639815)))

(assert (=> b!1123896 (= res!750898 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!47364 () Bool)

(assert (=> bm!47364 (= call!47368 (getCurrentListMapNoExtraKeys!4385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47365 () Bool)

(assert (=> bm!47365 (= call!47367 (getCurrentListMapNoExtraKeys!4385 lt!499252 lt!499253 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123897 () Bool)

(declare-fun res!750899 () Bool)

(assert (=> b!1123897 (=> (not res!750899) (not e!639814))))

(assert (=> b!1123897 (= res!750899 (and (= (size!35848 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35847 _keys!1208) (size!35848 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44155 () Bool)

(declare-fun mapRes!44155 () Bool)

(declare-fun tp!83789 () Bool)

(declare-fun e!639817 () Bool)

(assert (=> mapNonEmpty!44155 (= mapRes!44155 (and tp!83789 e!639817))))

(declare-fun mapRest!44155 () (Array (_ BitVec 32) ValueCell!13403))

(declare-fun mapValue!44155 () ValueCell!13403)

(declare-fun mapKey!44155 () (_ BitVec 32))

(assert (=> mapNonEmpty!44155 (= (arr!35312 _values!996) (store mapRest!44155 mapKey!44155 mapValue!44155))))

(declare-fun b!1123898 () Bool)

(declare-fun e!639811 () Bool)

(assert (=> b!1123898 (= e!639811 tp_is_empty!28225)))

(declare-fun b!1123899 () Bool)

(declare-fun res!750901 () Bool)

(assert (=> b!1123899 (=> (not res!750901) (not e!639814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123899 (= res!750901 (validKeyInArray!0 k!934))))

(declare-fun b!1123900 () Bool)

(declare-fun e!639809 () Bool)

(assert (=> b!1123900 (= e!639819 e!639809)))

(declare-fun res!750902 () Bool)

(assert (=> b!1123900 (=> res!750902 e!639809)))

(assert (=> b!1123900 (= res!750902 (not (= (select (arr!35311 _keys!1208) from!1455) k!934)))))

(assert (=> b!1123900 e!639813))

(declare-fun c!109533 () Bool)

(assert (=> b!1123900 (= c!109533 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36848 0))(
  ( (Unit!36849) )
))
(declare-fun lt!499256 () Unit!36848)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!349 (array!73317 array!73319 (_ BitVec 32) (_ BitVec 32) V!42761 V!42761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36848)

(assert (=> b!1123900 (= lt!499256 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123901 () Bool)

(assert (=> b!1123901 (= e!639815 true)))

(declare-fun lt!499250 () ListLongMap!15763)

(declare-fun contains!6436 (ListLongMap!15763 (_ BitVec 64)) Bool)

(declare-fun +!3408 (ListLongMap!15763 tuple2!17794) ListLongMap!15763)

(assert (=> b!1123901 (contains!6436 (+!3408 lt!499250 (tuple2!17795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k!934)))

(declare-fun lt!499251 () Unit!36848)

(declare-fun addStillContains!670 (ListLongMap!15763 (_ BitVec 64) V!42761 (_ BitVec 64)) Unit!36848)

(assert (=> b!1123901 (= lt!499251 (addStillContains!670 lt!499250 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun b!1123902 () Bool)

(declare-fun e!639812 () Bool)

(assert (=> b!1123902 (= e!639814 e!639812)))

(declare-fun res!750896 () Bool)

(assert (=> b!1123902 (=> (not res!750896) (not e!639812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73317 (_ BitVec 32)) Bool)

(assert (=> b!1123902 (= res!750896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499252 mask!1564))))

(assert (=> b!1123902 (= lt!499252 (array!73318 (store (arr!35311 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35847 _keys!1208)))))

(declare-fun b!1123903 () Bool)

(assert (=> b!1123903 (= e!639809 e!639815)))

(declare-fun res!750897 () Bool)

(assert (=> b!1123903 (=> res!750897 e!639815)))

(assert (=> b!1123903 (= res!750897 (not (contains!6436 lt!499250 k!934)))))

(assert (=> b!1123903 (= lt!499250 (getCurrentListMapNoExtraKeys!4385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123904 () Bool)

(assert (=> b!1123904 (= e!639817 tp_is_empty!28225)))

(declare-fun b!1123905 () Bool)

(declare-fun res!750903 () Bool)

(assert (=> b!1123905 (=> (not res!750903) (not e!639814))))

(assert (=> b!1123905 (= res!750903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123906 () Bool)

(declare-fun res!750910 () Bool)

(assert (=> b!1123906 (=> (not res!750910) (not e!639812))))

(assert (=> b!1123906 (= res!750910 (arrayNoDuplicates!0 lt!499252 #b00000000000000000000000000000000 Nil!24570))))

(declare-fun b!1123907 () Bool)

(assert (=> b!1123907 (= e!639812 (not e!639810))))

(declare-fun res!750909 () Bool)

(assert (=> b!1123907 (=> res!750909 e!639810)))

(assert (=> b!1123907 (= res!750909 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123907 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!499254 () Unit!36848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73317 (_ BitVec 64) (_ BitVec 32)) Unit!36848)

(assert (=> b!1123907 (= lt!499254 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1123908 () Bool)

(assert (=> b!1123908 (= e!639816 (and e!639811 mapRes!44155))))

(declare-fun condMapEmpty!44155 () Bool)

(declare-fun mapDefault!44155 () ValueCell!13403)

