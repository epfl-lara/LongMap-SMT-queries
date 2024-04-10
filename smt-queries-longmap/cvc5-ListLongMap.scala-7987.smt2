; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98762 () Bool)

(assert start!98762)

(declare-fun b_free!24367 () Bool)

(declare-fun b_next!24367 () Bool)

(assert (=> start!98762 (= b_free!24367 (not b_next!24367))))

(declare-fun tp!85811 () Bool)

(declare-fun b_and!39583 () Bool)

(assert (=> start!98762 (= tp!85811 b_and!39583)))

(declare-fun b!1151894 () Bool)

(declare-fun e!655154 () Bool)

(declare-fun tp_is_empty!28897 () Bool)

(assert (=> b!1151894 (= e!655154 tp_is_empty!28897)))

(declare-fun bm!53943 () Bool)

(declare-fun call!53950 () Bool)

(declare-fun call!53947 () Bool)

(assert (=> bm!53943 (= call!53950 call!53947)))

(declare-fun b!1151895 () Bool)

(declare-datatypes ((Unit!37896 0))(
  ( (Unit!37897) )
))
(declare-fun e!655143 () Unit!37896)

(declare-fun Unit!37898 () Unit!37896)

(assert (=> b!1151895 (= e!655143 Unit!37898)))

(declare-fun lt!515848 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1151895 (= lt!515848 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114161 () Bool)

(assert (=> b!1151895 (= c!114161 (and (not lt!515848) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515857 () Unit!37896)

(declare-fun e!655142 () Unit!37896)

(assert (=> b!1151895 (= lt!515857 e!655142)))

(declare-datatypes ((V!43657 0))(
  ( (V!43658 (val!14505 Int)) )
))
(declare-fun zeroValue!944 () V!43657)

(declare-datatypes ((array!74641 0))(
  ( (array!74642 (arr!35971 (Array (_ BitVec 32) (_ BitVec 64))) (size!36507 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74641)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!515852 () Unit!37896)

(declare-datatypes ((ValueCell!13739 0))(
  ( (ValueCellFull!13739 (v!17142 V!43657)) (EmptyCell!13739) )
))
(declare-datatypes ((array!74643 0))(
  ( (array!74644 (arr!35972 (Array (_ BitVec 32) ValueCell!13739)) (size!36508 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74643)

(declare-fun minValue!944 () V!43657)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!468 (array!74641 array!74643 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 64) (_ BitVec 32) Int) Unit!37896)

(assert (=> b!1151895 (= lt!515852 (lemmaListMapContainsThenArrayContainsFrom!468 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114162 () Bool)

(assert (=> b!1151895 (= c!114162 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765926 () Bool)

(declare-fun e!655152 () Bool)

(assert (=> b!1151895 (= res!765926 e!655152)))

(declare-fun e!655144 () Bool)

(assert (=> b!1151895 (=> (not res!765926) (not e!655144))))

(assert (=> b!1151895 e!655144))

(declare-fun lt!515864 () Unit!37896)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74641 (_ BitVec 32) (_ BitVec 32)) Unit!37896)

(assert (=> b!1151895 (= lt!515864 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25166 0))(
  ( (Nil!25163) (Cons!25162 (h!26371 (_ BitVec 64)) (t!36525 List!25166)) )
))
(declare-fun arrayNoDuplicates!0 (array!74641 (_ BitVec 32) List!25166) Bool)

(assert (=> b!1151895 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25163)))

(declare-fun lt!515865 () Unit!37896)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74641 (_ BitVec 64) (_ BitVec 32) List!25166) Unit!37896)

(assert (=> b!1151895 (= lt!515865 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25163))))

(assert (=> b!1151895 false))

(declare-fun b!1151896 () Bool)

(declare-fun Unit!37899 () Unit!37896)

(assert (=> b!1151896 (= e!655143 Unit!37899)))

(declare-fun b!1151897 () Bool)

(declare-fun res!765931 () Bool)

(declare-fun e!655151 () Bool)

(assert (=> b!1151897 (=> (not res!765931) (not e!655151))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151897 (= res!765931 (= (select (arr!35971 _keys!1208) i!673) k!934))))

(declare-fun b!1151898 () Bool)

(assert (=> b!1151898 (= e!655152 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515848) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151899 () Bool)

(declare-fun e!655146 () Bool)

(assert (=> b!1151899 (= e!655151 e!655146)))

(declare-fun res!765927 () Bool)

(assert (=> b!1151899 (=> (not res!765927) (not e!655146))))

(declare-fun lt!515844 () array!74641)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74641 (_ BitVec 32)) Bool)

(assert (=> b!1151899 (= res!765927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515844 mask!1564))))

(assert (=> b!1151899 (= lt!515844 (array!74642 (store (arr!35971 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36507 _keys!1208)))))

(declare-fun b!1151900 () Bool)

(declare-fun e!655157 () Bool)

(declare-datatypes ((tuple2!18418 0))(
  ( (tuple2!18419 (_1!9220 (_ BitVec 64)) (_2!9220 V!43657)) )
))
(declare-datatypes ((List!25167 0))(
  ( (Nil!25164) (Cons!25163 (h!26372 tuple2!18418) (t!36526 List!25167)) )
))
(declare-datatypes ((ListLongMap!16387 0))(
  ( (ListLongMap!16388 (toList!8209 List!25167)) )
))
(declare-fun call!53953 () ListLongMap!16387)

(declare-fun call!53949 () ListLongMap!16387)

(assert (=> b!1151900 (= e!655157 (= call!53953 call!53949))))

(declare-fun b!1151901 () Bool)

(declare-fun e!655158 () Unit!37896)

(declare-fun Unit!37900 () Unit!37896)

(assert (=> b!1151901 (= e!655158 Unit!37900)))

(declare-fun b!1151902 () Bool)

(declare-fun e!655148 () Bool)

(assert (=> b!1151902 (= e!655146 (not e!655148))))

(declare-fun res!765934 () Bool)

(assert (=> b!1151902 (=> res!765934 e!655148)))

(assert (=> b!1151902 (= res!765934 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151902 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!515853 () Unit!37896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74641 (_ BitVec 64) (_ BitVec 32)) Unit!37896)

(assert (=> b!1151902 (= lt!515853 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1151903 () Bool)

(declare-fun res!765933 () Bool)

(assert (=> b!1151903 (=> (not res!765933) (not e!655151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151903 (= res!765933 (validMask!0 mask!1564))))

(declare-fun b!1151904 () Bool)

(declare-fun res!765935 () Bool)

(assert (=> b!1151904 (=> (not res!765935) (not e!655151))))

(assert (=> b!1151904 (= res!765935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun lt!515860 () ListLongMap!16387)

(declare-fun call!53951 () ListLongMap!16387)

(declare-fun bm!53944 () Bool)

(declare-fun c!114165 () Bool)

(declare-fun +!3627 (ListLongMap!16387 tuple2!18418) ListLongMap!16387)

(assert (=> bm!53944 (= call!53951 (+!3627 lt!515860 (ite (or c!114161 c!114165) (tuple2!18419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1151905 () Bool)

(declare-fun lt!515847 () ListLongMap!16387)

(declare-fun contains!6727 (ListLongMap!16387 (_ BitVec 64)) Bool)

(assert (=> b!1151905 (contains!6727 (+!3627 lt!515847 (tuple2!18419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!515855 () Unit!37896)

(declare-fun call!53952 () Unit!37896)

(assert (=> b!1151905 (= lt!515855 call!53952)))

(assert (=> b!1151905 call!53947))

(assert (=> b!1151905 (= lt!515847 call!53951)))

(declare-fun lt!515862 () Unit!37896)

(declare-fun addStillContains!875 (ListLongMap!16387 (_ BitVec 64) V!43657 (_ BitVec 64)) Unit!37896)

(assert (=> b!1151905 (= lt!515862 (addStillContains!875 lt!515860 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(assert (=> b!1151905 (= e!655142 lt!515855)))

(declare-fun b!1151906 () Bool)

(declare-fun res!765928 () Bool)

(assert (=> b!1151906 (=> (not res!765928) (not e!655146))))

(assert (=> b!1151906 (= res!765928 (arrayNoDuplicates!0 lt!515844 #b00000000000000000000000000000000 Nil!25163))))

(declare-fun b!1151907 () Bool)

(declare-fun -!1340 (ListLongMap!16387 (_ BitVec 64)) ListLongMap!16387)

(assert (=> b!1151907 (= e!655157 (= call!53953 (-!1340 call!53949 k!934)))))

(declare-fun b!1151908 () Bool)

(assert (=> b!1151908 (= c!114165 (and (not lt!515848) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655156 () Unit!37896)

(assert (=> b!1151908 (= e!655142 e!655156)))

(declare-fun b!1151909 () Bool)

(declare-fun lt!515850 () Unit!37896)

(assert (=> b!1151909 (= e!655156 lt!515850)))

(declare-fun call!53948 () Unit!37896)

(assert (=> b!1151909 (= lt!515850 call!53948)))

(assert (=> b!1151909 call!53950))

(declare-fun bm!53945 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4681 (array!74641 array!74643 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 32) Int) ListLongMap!16387)

(assert (=> bm!53945 (= call!53949 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53946 () Bool)

(assert (=> bm!53946 (= call!53948 call!53952)))

(declare-fun mapNonEmpty!45170 () Bool)

(declare-fun mapRes!45170 () Bool)

(declare-fun tp!85812 () Bool)

(assert (=> mapNonEmpty!45170 (= mapRes!45170 (and tp!85812 e!655154))))

(declare-fun mapValue!45170 () ValueCell!13739)

(declare-fun mapRest!45170 () (Array (_ BitVec 32) ValueCell!13739))

(declare-fun mapKey!45170 () (_ BitVec 32))

(assert (=> mapNonEmpty!45170 (= (arr!35972 _values!996) (store mapRest!45170 mapKey!45170 mapValue!45170))))

(declare-fun b!1151910 () Bool)

(assert (=> b!1151910 (= e!655156 e!655158)))

(declare-fun c!114163 () Bool)

(assert (=> b!1151910 (= c!114163 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515848))))

(declare-fun bm!53947 () Bool)

(declare-fun lt!515846 () array!74643)

(assert (=> bm!53947 (= call!53953 (getCurrentListMapNoExtraKeys!4681 lt!515844 lt!515846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!655153 () Bool)

(declare-fun b!1151911 () Bool)

(declare-fun lt!515863 () ListLongMap!16387)

(assert (=> b!1151911 (= e!655153 (= lt!515863 (getCurrentListMapNoExtraKeys!4681 lt!515844 lt!515846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151912 () Bool)

(assert (=> b!1151912 (= e!655152 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151913 () Bool)

(declare-fun res!765938 () Bool)

(assert (=> b!1151913 (=> (not res!765938) (not e!655151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151913 (= res!765938 (validKeyInArray!0 k!934))))

(declare-fun b!1151914 () Bool)

(assert (=> b!1151914 call!53950))

(declare-fun lt!515851 () Unit!37896)

(assert (=> b!1151914 (= lt!515851 call!53948)))

(assert (=> b!1151914 (= e!655158 lt!515851)))

(declare-fun bm!53948 () Bool)

(declare-fun call!53946 () ListLongMap!16387)

(assert (=> bm!53948 (= call!53947 (contains!6727 (ite c!114161 lt!515847 call!53946) k!934))))

(declare-fun b!1151915 () Bool)

(assert (=> b!1151915 (= e!655144 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151916 () Bool)

(declare-fun e!655147 () Bool)

(assert (=> b!1151916 (= e!655148 e!655147)))

(declare-fun res!765936 () Bool)

(assert (=> b!1151916 (=> res!765936 e!655147)))

(assert (=> b!1151916 (= res!765936 (not (= from!1455 i!673)))))

(declare-fun lt!515849 () ListLongMap!16387)

(assert (=> b!1151916 (= lt!515849 (getCurrentListMapNoExtraKeys!4681 lt!515844 lt!515846 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515861 () V!43657)

(assert (=> b!1151916 (= lt!515846 (array!74644 (store (arr!35972 _values!996) i!673 (ValueCellFull!13739 lt!515861)) (size!36508 _values!996)))))

(declare-fun dynLambda!2703 (Int (_ BitVec 64)) V!43657)

(assert (=> b!1151916 (= lt!515861 (dynLambda!2703 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515859 () ListLongMap!16387)

(assert (=> b!1151916 (= lt!515859 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151917 () Bool)

(declare-fun res!765929 () Bool)

(assert (=> b!1151917 (=> (not res!765929) (not e!655151))))

(assert (=> b!1151917 (= res!765929 (and (= (size!36508 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36507 _keys!1208) (size!36508 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!53949 () Bool)

(assert (=> bm!53949 (= call!53946 call!53951)))

(declare-fun res!765930 () Bool)

(assert (=> start!98762 (=> (not res!765930) (not e!655151))))

(assert (=> start!98762 (= res!765930 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36507 _keys!1208))))))

(assert (=> start!98762 e!655151))

(assert (=> start!98762 tp_is_empty!28897))

(declare-fun array_inv!27546 (array!74641) Bool)

(assert (=> start!98762 (array_inv!27546 _keys!1208)))

(assert (=> start!98762 true))

(assert (=> start!98762 tp!85811))

(declare-fun e!655145 () Bool)

(declare-fun array_inv!27547 (array!74643) Bool)

(assert (=> start!98762 (and (array_inv!27547 _values!996) e!655145)))

(declare-fun b!1151918 () Bool)

(declare-fun res!765932 () Bool)

(assert (=> b!1151918 (=> (not res!765932) (not e!655151))))

(assert (=> b!1151918 (= res!765932 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36507 _keys!1208))))))

(declare-fun b!1151919 () Bool)

(declare-fun e!655150 () Bool)

(assert (=> b!1151919 (= e!655147 e!655150)))

(declare-fun res!765924 () Bool)

(assert (=> b!1151919 (=> res!765924 e!655150)))

(assert (=> b!1151919 (= res!765924 (not (= (select (arr!35971 _keys!1208) from!1455) k!934)))))

(assert (=> b!1151919 e!655157))

(declare-fun c!114166 () Bool)

(assert (=> b!1151919 (= c!114166 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515856 () Unit!37896)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!575 (array!74641 array!74643 (_ BitVec 32) (_ BitVec 32) V!43657 V!43657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37896)

(assert (=> b!1151919 (= lt!515856 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!575 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151920 () Bool)

(assert (=> b!1151920 (= e!655150 true)))

(assert (=> b!1151920 e!655153))

(declare-fun res!765937 () Bool)

(assert (=> b!1151920 (=> (not res!765937) (not e!655153))))

(assert (=> b!1151920 (= res!765937 (= lt!515863 lt!515860))))

(assert (=> b!1151920 (= lt!515863 (-!1340 lt!515859 k!934))))

(declare-fun lt!515858 () V!43657)

(assert (=> b!1151920 (= (-!1340 (+!3627 lt!515860 (tuple2!18419 (select (arr!35971 _keys!1208) from!1455) lt!515858)) (select (arr!35971 _keys!1208) from!1455)) lt!515860)))

(declare-fun lt!515854 () Unit!37896)

(declare-fun addThenRemoveForNewKeyIsSame!182 (ListLongMap!16387 (_ BitVec 64) V!43657) Unit!37896)

(assert (=> b!1151920 (= lt!515854 (addThenRemoveForNewKeyIsSame!182 lt!515860 (select (arr!35971 _keys!1208) from!1455) lt!515858))))

(declare-fun get!18318 (ValueCell!13739 V!43657) V!43657)

(assert (=> b!1151920 (= lt!515858 (get!18318 (select (arr!35972 _values!996) from!1455) lt!515861))))

(declare-fun lt!515845 () Unit!37896)

(assert (=> b!1151920 (= lt!515845 e!655143)))

(declare-fun c!114164 () Bool)

(assert (=> b!1151920 (= c!114164 (contains!6727 lt!515860 k!934))))

(assert (=> b!1151920 (= lt!515860 (getCurrentListMapNoExtraKeys!4681 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151921 () Bool)

(declare-fun e!655149 () Bool)

(assert (=> b!1151921 (= e!655145 (and e!655149 mapRes!45170))))

(declare-fun condMapEmpty!45170 () Bool)

(declare-fun mapDefault!45170 () ValueCell!13739)

