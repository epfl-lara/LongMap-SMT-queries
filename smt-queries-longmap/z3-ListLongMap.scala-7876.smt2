; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97994 () Bool)

(assert start!97994)

(declare-fun b_free!23701 () Bool)

(declare-fun b_next!23701 () Bool)

(assert (=> start!97994 (= b_free!23701 (not b_next!23701))))

(declare-fun tp!83807 () Bool)

(declare-fun b_and!38163 () Bool)

(assert (=> start!97994 (= tp!83807 b_and!38163)))

(declare-datatypes ((V!42769 0))(
  ( (V!42770 (val!14172 Int)) )
))
(declare-datatypes ((tuple2!17884 0))(
  ( (tuple2!17885 (_1!8953 (_ BitVec 64)) (_2!8953 V!42769)) )
))
(declare-datatypes ((List!24646 0))(
  ( (Nil!24643) (Cons!24642 (h!25851 tuple2!17884) (t!35330 List!24646)) )
))
(declare-datatypes ((ListLongMap!15853 0))(
  ( (ListLongMap!15854 (toList!7942 List!24646)) )
))
(declare-fun call!47362 () ListLongMap!15853)

(declare-fun e!639829 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!47363 () ListLongMap!15853)

(declare-fun b!1123949 () Bool)

(declare-fun -!1081 (ListLongMap!15853 (_ BitVec 64)) ListLongMap!15853)

(assert (=> b!1123949 (= e!639829 (= call!47362 (-!1081 call!47363 k0!934)))))

(declare-fun b!1123950 () Bool)

(declare-fun res!750975 () Bool)

(declare-fun e!639832 () Bool)

(assert (=> b!1123950 (=> (not res!750975) (not e!639832))))

(declare-datatypes ((array!73252 0))(
  ( (array!73253 (arr!35279 (Array (_ BitVec 32) (_ BitVec 64))) (size!35817 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73252)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13406 0))(
  ( (ValueCellFull!13406 (v!16804 V!42769)) (EmptyCell!13406) )
))
(declare-datatypes ((array!73254 0))(
  ( (array!73255 (arr!35280 (Array (_ BitVec 32) ValueCell!13406)) (size!35818 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73254)

(assert (=> b!1123950 (= res!750975 (and (= (size!35818 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35817 _keys!1208) (size!35818 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!42769)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42769)

(declare-fun bm!47359 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4447 (array!73252 array!73254 (_ BitVec 32) (_ BitVec 32) V!42769 V!42769 (_ BitVec 32) Int) ListLongMap!15853)

(assert (=> bm!47359 (= call!47363 (getCurrentListMapNoExtraKeys!4447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!750969 () Bool)

(assert (=> start!97994 (=> (not res!750969) (not e!639832))))

(assert (=> start!97994 (= res!750969 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35817 _keys!1208))))))

(assert (=> start!97994 e!639832))

(declare-fun tp_is_empty!28231 () Bool)

(assert (=> start!97994 tp_is_empty!28231))

(declare-fun array_inv!27152 (array!73252) Bool)

(assert (=> start!97994 (array_inv!27152 _keys!1208)))

(assert (=> start!97994 true))

(assert (=> start!97994 tp!83807))

(declare-fun e!639827 () Bool)

(declare-fun array_inv!27153 (array!73254) Bool)

(assert (=> start!97994 (and (array_inv!27153 _values!996) e!639827)))

(declare-fun mapNonEmpty!44164 () Bool)

(declare-fun mapRes!44164 () Bool)

(declare-fun tp!83806 () Bool)

(declare-fun e!639830 () Bool)

(assert (=> mapNonEmpty!44164 (= mapRes!44164 (and tp!83806 e!639830))))

(declare-fun mapRest!44164 () (Array (_ BitVec 32) ValueCell!13406))

(declare-fun mapValue!44164 () ValueCell!13406)

(declare-fun mapKey!44164 () (_ BitVec 32))

(assert (=> mapNonEmpty!44164 (= (arr!35280 _values!996) (store mapRest!44164 mapKey!44164 mapValue!44164))))

(declare-fun mapIsEmpty!44164 () Bool)

(assert (=> mapIsEmpty!44164 mapRes!44164))

(declare-fun b!1123951 () Bool)

(declare-fun e!639828 () Bool)

(declare-fun e!639834 () Bool)

(assert (=> b!1123951 (= e!639828 (not e!639834))))

(declare-fun res!750970 () Bool)

(assert (=> b!1123951 (=> res!750970 e!639834)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123951 (= res!750970 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123951 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36697 0))(
  ( (Unit!36698) )
))
(declare-fun lt!499121 () Unit!36697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73252 (_ BitVec 64) (_ BitVec 32)) Unit!36697)

(assert (=> b!1123951 (= lt!499121 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123952 () Bool)

(assert (=> b!1123952 (= e!639829 (= call!47362 call!47363))))

(declare-fun b!1123953 () Bool)

(declare-fun e!639835 () Bool)

(assert (=> b!1123953 (= e!639834 e!639835)))

(declare-fun res!750967 () Bool)

(assert (=> b!1123953 (=> res!750967 e!639835)))

(assert (=> b!1123953 (= res!750967 (not (= from!1455 i!673)))))

(declare-fun lt!499127 () array!73252)

(declare-fun lt!499123 () array!73254)

(declare-fun lt!499128 () ListLongMap!15853)

(assert (=> b!1123953 (= lt!499128 (getCurrentListMapNoExtraKeys!4447 lt!499127 lt!499123 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2473 (Int (_ BitVec 64)) V!42769)

(assert (=> b!1123953 (= lt!499123 (array!73255 (store (arr!35280 _values!996) i!673 (ValueCellFull!13406 (dynLambda!2473 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35818 _values!996)))))

(declare-fun lt!499124 () ListLongMap!15853)

(assert (=> b!1123953 (= lt!499124 (getCurrentListMapNoExtraKeys!4447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47360 () Bool)

(assert (=> bm!47360 (= call!47362 (getCurrentListMapNoExtraKeys!4447 lt!499127 lt!499123 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123954 () Bool)

(declare-fun res!750965 () Bool)

(assert (=> b!1123954 (=> (not res!750965) (not e!639832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123954 (= res!750965 (validMask!0 mask!1564))))

(declare-fun b!1123955 () Bool)

(declare-fun res!750976 () Bool)

(assert (=> b!1123955 (=> (not res!750976) (not e!639832))))

(assert (=> b!1123955 (= res!750976 (= (select (arr!35279 _keys!1208) i!673) k0!934))))

(declare-fun b!1123956 () Bool)

(declare-fun res!750971 () Bool)

(declare-fun e!639831 () Bool)

(assert (=> b!1123956 (=> res!750971 e!639831)))

(assert (=> b!1123956 (= res!750971 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1123957 () Bool)

(declare-fun e!639836 () Bool)

(assert (=> b!1123957 (= e!639836 tp_is_empty!28231)))

(declare-fun b!1123958 () Bool)

(declare-fun res!750972 () Bool)

(assert (=> b!1123958 (=> (not res!750972) (not e!639832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123958 (= res!750972 (validKeyInArray!0 k0!934))))

(declare-fun b!1123959 () Bool)

(declare-fun e!639833 () Bool)

(assert (=> b!1123959 (= e!639835 e!639833)))

(declare-fun res!750974 () Bool)

(assert (=> b!1123959 (=> res!750974 e!639833)))

(assert (=> b!1123959 (= res!750974 (not (= (select (arr!35279 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123959 e!639829))

(declare-fun c!109515 () Bool)

(assert (=> b!1123959 (= c!109515 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499122 () Unit!36697)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!357 (array!73252 array!73254 (_ BitVec 32) (_ BitVec 32) V!42769 V!42769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36697)

(assert (=> b!1123959 (= lt!499122 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123960 () Bool)

(declare-fun res!750964 () Bool)

(assert (=> b!1123960 (=> (not res!750964) (not e!639828))))

(declare-datatypes ((List!24647 0))(
  ( (Nil!24644) (Cons!24643 (h!25852 (_ BitVec 64)) (t!35331 List!24647)) )
))
(declare-fun arrayNoDuplicates!0 (array!73252 (_ BitVec 32) List!24647) Bool)

(assert (=> b!1123960 (= res!750964 (arrayNoDuplicates!0 lt!499127 #b00000000000000000000000000000000 Nil!24644))))

(declare-fun b!1123961 () Bool)

(assert (=> b!1123961 (= e!639832 e!639828)))

(declare-fun res!750973 () Bool)

(assert (=> b!1123961 (=> (not res!750973) (not e!639828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73252 (_ BitVec 32)) Bool)

(assert (=> b!1123961 (= res!750973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499127 mask!1564))))

(assert (=> b!1123961 (= lt!499127 (array!73253 (store (arr!35279 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35817 _keys!1208)))))

(declare-fun b!1123962 () Bool)

(declare-fun res!750966 () Bool)

(assert (=> b!1123962 (=> (not res!750966) (not e!639832))))

(assert (=> b!1123962 (= res!750966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123963 () Bool)

(assert (=> b!1123963 (= e!639830 tp_is_empty!28231)))

(declare-fun b!1123964 () Bool)

(assert (=> b!1123964 (= e!639833 e!639831)))

(declare-fun res!750963 () Bool)

(assert (=> b!1123964 (=> res!750963 e!639831)))

(declare-fun lt!499126 () ListLongMap!15853)

(declare-fun contains!6414 (ListLongMap!15853 (_ BitVec 64)) Bool)

(assert (=> b!1123964 (= res!750963 (not (contains!6414 lt!499126 k0!934)))))

(assert (=> b!1123964 (= lt!499126 (getCurrentListMapNoExtraKeys!4447 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123965 () Bool)

(assert (=> b!1123965 (= e!639831 true)))

(declare-fun +!3447 (ListLongMap!15853 tuple2!17884) ListLongMap!15853)

(assert (=> b!1123965 (contains!6414 (+!3447 lt!499126 (tuple2!17885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499125 () Unit!36697)

(declare-fun addStillContains!665 (ListLongMap!15853 (_ BitVec 64) V!42769 (_ BitVec 64)) Unit!36697)

(assert (=> b!1123965 (= lt!499125 (addStillContains!665 lt!499126 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1123966 () Bool)

(declare-fun res!750962 () Bool)

(assert (=> b!1123966 (=> (not res!750962) (not e!639832))))

(assert (=> b!1123966 (= res!750962 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35817 _keys!1208))))))

(declare-fun b!1123967 () Bool)

(assert (=> b!1123967 (= e!639827 (and e!639836 mapRes!44164))))

(declare-fun condMapEmpty!44164 () Bool)

(declare-fun mapDefault!44164 () ValueCell!13406)

(assert (=> b!1123967 (= condMapEmpty!44164 (= (arr!35280 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13406)) mapDefault!44164)))))

(declare-fun b!1123968 () Bool)

(declare-fun res!750968 () Bool)

(assert (=> b!1123968 (=> (not res!750968) (not e!639832))))

(assert (=> b!1123968 (= res!750968 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24644))))

(assert (= (and start!97994 res!750969) b!1123954))

(assert (= (and b!1123954 res!750965) b!1123950))

(assert (= (and b!1123950 res!750975) b!1123962))

(assert (= (and b!1123962 res!750966) b!1123968))

(assert (= (and b!1123968 res!750968) b!1123966))

(assert (= (and b!1123966 res!750962) b!1123958))

(assert (= (and b!1123958 res!750972) b!1123955))

(assert (= (and b!1123955 res!750976) b!1123961))

(assert (= (and b!1123961 res!750973) b!1123960))

(assert (= (and b!1123960 res!750964) b!1123951))

(assert (= (and b!1123951 (not res!750970)) b!1123953))

(assert (= (and b!1123953 (not res!750967)) b!1123959))

(assert (= (and b!1123959 c!109515) b!1123949))

(assert (= (and b!1123959 (not c!109515)) b!1123952))

(assert (= (or b!1123949 b!1123952) bm!47360))

(assert (= (or b!1123949 b!1123952) bm!47359))

(assert (= (and b!1123959 (not res!750974)) b!1123964))

(assert (= (and b!1123964 (not res!750963)) b!1123956))

(assert (= (and b!1123956 (not res!750971)) b!1123965))

(assert (= (and b!1123967 condMapEmpty!44164) mapIsEmpty!44164))

(assert (= (and b!1123967 (not condMapEmpty!44164)) mapNonEmpty!44164))

(get-info :version)

(assert (= (and mapNonEmpty!44164 ((_ is ValueCellFull!13406) mapValue!44164)) b!1123963))

(assert (= (and b!1123967 ((_ is ValueCellFull!13406) mapDefault!44164)) b!1123957))

(assert (= start!97994 b!1123967))

(declare-fun b_lambda!18653 () Bool)

(assert (=> (not b_lambda!18653) (not b!1123953)))

(declare-fun t!35329 () Bool)

(declare-fun tb!8505 () Bool)

(assert (=> (and start!97994 (= defaultEntry!1004 defaultEntry!1004) t!35329) tb!8505))

(declare-fun result!17579 () Bool)

(assert (=> tb!8505 (= result!17579 tp_is_empty!28231)))

(assert (=> b!1123953 t!35329))

(declare-fun b_and!38165 () Bool)

(assert (= b_and!38163 (and (=> t!35329 result!17579) b_and!38165)))

(declare-fun m!1037805 () Bool)

(assert (=> b!1123960 m!1037805))

(declare-fun m!1037807 () Bool)

(assert (=> b!1123953 m!1037807))

(declare-fun m!1037809 () Bool)

(assert (=> b!1123953 m!1037809))

(declare-fun m!1037811 () Bool)

(assert (=> b!1123953 m!1037811))

(declare-fun m!1037813 () Bool)

(assert (=> b!1123953 m!1037813))

(declare-fun m!1037815 () Bool)

(assert (=> b!1123954 m!1037815))

(declare-fun m!1037817 () Bool)

(assert (=> b!1123959 m!1037817))

(declare-fun m!1037819 () Bool)

(assert (=> b!1123959 m!1037819))

(declare-fun m!1037821 () Bool)

(assert (=> b!1123961 m!1037821))

(declare-fun m!1037823 () Bool)

(assert (=> b!1123961 m!1037823))

(declare-fun m!1037825 () Bool)

(assert (=> start!97994 m!1037825))

(declare-fun m!1037827 () Bool)

(assert (=> start!97994 m!1037827))

(declare-fun m!1037829 () Bool)

(assert (=> b!1123958 m!1037829))

(declare-fun m!1037831 () Bool)

(assert (=> b!1123949 m!1037831))

(declare-fun m!1037833 () Bool)

(assert (=> b!1123965 m!1037833))

(assert (=> b!1123965 m!1037833))

(declare-fun m!1037835 () Bool)

(assert (=> b!1123965 m!1037835))

(declare-fun m!1037837 () Bool)

(assert (=> b!1123965 m!1037837))

(declare-fun m!1037839 () Bool)

(assert (=> b!1123968 m!1037839))

(declare-fun m!1037841 () Bool)

(assert (=> mapNonEmpty!44164 m!1037841))

(declare-fun m!1037843 () Bool)

(assert (=> bm!47359 m!1037843))

(declare-fun m!1037845 () Bool)

(assert (=> bm!47360 m!1037845))

(declare-fun m!1037847 () Bool)

(assert (=> b!1123951 m!1037847))

(declare-fun m!1037849 () Bool)

(assert (=> b!1123951 m!1037849))

(declare-fun m!1037851 () Bool)

(assert (=> b!1123962 m!1037851))

(declare-fun m!1037853 () Bool)

(assert (=> b!1123955 m!1037853))

(declare-fun m!1037855 () Bool)

(assert (=> b!1123964 m!1037855))

(assert (=> b!1123964 m!1037843))

(check-sat tp_is_empty!28231 b_and!38165 (not b!1123958) (not b!1123951) (not start!97994) (not b!1123968) (not mapNonEmpty!44164) (not b!1123954) (not b!1123964) (not b!1123953) (not bm!47359) (not b!1123965) (not bm!47360) (not b!1123960) (not b!1123949) (not b!1123962) (not b_lambda!18653) (not b_next!23701) (not b!1123959) (not b!1123961))
(check-sat b_and!38165 (not b_next!23701))
