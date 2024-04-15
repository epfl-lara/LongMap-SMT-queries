; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98846 () Bool)

(assert start!98846)

(declare-fun b_free!24457 () Bool)

(declare-fun b_next!24457 () Bool)

(assert (=> start!98846 (= b_free!24457 (not b_next!24457))))

(declare-fun tp!86082 () Bool)

(declare-fun b_and!39741 () Bool)

(assert (=> start!98846 (= tp!86082 b_and!39741)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!657375 () Bool)

(declare-fun b!1155910 () Bool)

(declare-datatypes ((V!43777 0))(
  ( (V!43778 (val!14550 Int)) )
))
(declare-datatypes ((tuple2!18584 0))(
  ( (tuple2!18585 (_1!9303 (_ BitVec 64)) (_2!9303 V!43777)) )
))
(declare-datatypes ((List!25314 0))(
  ( (Nil!25311) (Cons!25310 (h!26519 tuple2!18584) (t!36754 List!25314)) )
))
(declare-datatypes ((ListLongMap!16553 0))(
  ( (ListLongMap!16554 (toList!8292 List!25314)) )
))
(declare-fun call!55006 () ListLongMap!16553)

(declare-fun call!55008 () ListLongMap!16553)

(declare-fun -!1351 (ListLongMap!16553 (_ BitVec 64)) ListLongMap!16553)

(assert (=> b!1155910 (= e!657375 (= call!55006 (-!1351 call!55008 k0!934)))))

(declare-fun bm!55000 () Bool)

(declare-fun call!55010 () Bool)

(declare-fun call!55004 () Bool)

(assert (=> bm!55000 (= call!55010 call!55004)))

(declare-datatypes ((array!74738 0))(
  ( (array!74739 (arr!36020 (Array (_ BitVec 32) (_ BitVec 64))) (size!36558 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74738)

(declare-fun e!657363 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1155911 () Bool)

(declare-fun arrayContainsKey!0 (array!74738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155911 (= e!657363 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155912 () Bool)

(declare-fun e!657370 () Bool)

(declare-fun tp_is_empty!28987 () Bool)

(assert (=> b!1155912 (= e!657370 tp_is_empty!28987)))

(declare-fun b!1155913 () Bool)

(declare-fun call!55005 () ListLongMap!16553)

(declare-fun contains!6744 (ListLongMap!16553 (_ BitVec 64)) Bool)

(assert (=> b!1155913 (contains!6744 call!55005 k0!934)))

(declare-datatypes ((Unit!37916 0))(
  ( (Unit!37917) )
))
(declare-fun lt!518642 () Unit!37916)

(declare-fun lt!518633 () ListLongMap!16553)

(declare-fun minValue!944 () V!43777)

(declare-fun addStillContains!914 (ListLongMap!16553 (_ BitVec 64) V!43777 (_ BitVec 64)) Unit!37916)

(assert (=> b!1155913 (= lt!518642 (addStillContains!914 lt!518633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1155913 call!55004))

(declare-fun lt!518635 () ListLongMap!16553)

(declare-fun zeroValue!944 () V!43777)

(declare-fun +!3703 (ListLongMap!16553 tuple2!18584) ListLongMap!16553)

(assert (=> b!1155913 (= lt!518633 (+!3703 lt!518635 (tuple2!18585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518624 () Unit!37916)

(declare-fun call!55003 () Unit!37916)

(assert (=> b!1155913 (= lt!518624 call!55003)))

(declare-fun e!657372 () Unit!37916)

(assert (=> b!1155913 (= e!657372 lt!518642)))

(declare-fun lt!518623 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1155914 () Bool)

(assert (=> b!1155914 (= e!657363 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518623) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155915 () Bool)

(declare-fun e!657374 () Bool)

(declare-fun e!657371 () Bool)

(assert (=> b!1155915 (= e!657374 e!657371)))

(declare-fun res!767894 () Bool)

(assert (=> b!1155915 (=> res!767894 e!657371)))

(assert (=> b!1155915 (= res!767894 (not (= (select (arr!36020 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1155915 e!657375))

(declare-fun c!114947 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155915 (= c!114947 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518631 () Unit!37916)

(declare-datatypes ((ValueCell!13784 0))(
  ( (ValueCellFull!13784 (v!17186 V!43777)) (EmptyCell!13784) )
))
(declare-datatypes ((array!74740 0))(
  ( (array!74741 (arr!36021 (Array (_ BitVec 32) ValueCell!13784)) (size!36559 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74740)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!623 (array!74738 array!74740 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37916)

(assert (=> b!1155915 (= lt!518631 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!623 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55001 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4773 (array!74738 array!74740 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 32) Int) ListLongMap!16553)

(assert (=> bm!55001 (= call!55008 (getCurrentListMapNoExtraKeys!4773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155916 () Bool)

(declare-fun e!657359 () Bool)

(declare-fun e!657368 () Bool)

(declare-fun mapRes!45305 () Bool)

(assert (=> b!1155916 (= e!657359 (and e!657368 mapRes!45305))))

(declare-fun condMapEmpty!45305 () Bool)

(declare-fun mapDefault!45305 () ValueCell!13784)

(assert (=> b!1155916 (= condMapEmpty!45305 (= (arr!36021 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13784)) mapDefault!45305)))))

(declare-fun bm!55002 () Bool)

(declare-fun lt!518641 () array!74740)

(declare-fun lt!518643 () array!74738)

(assert (=> bm!55002 (= call!55006 (getCurrentListMapNoExtraKeys!4773 lt!518643 lt!518641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!767893 () Bool)

(declare-fun e!657369 () Bool)

(assert (=> start!98846 (=> (not res!767893) (not e!657369))))

(assert (=> start!98846 (= res!767893 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36558 _keys!1208))))))

(assert (=> start!98846 e!657369))

(assert (=> start!98846 tp_is_empty!28987))

(declare-fun array_inv!27682 (array!74738) Bool)

(assert (=> start!98846 (array_inv!27682 _keys!1208)))

(assert (=> start!98846 true))

(assert (=> start!98846 tp!86082))

(declare-fun array_inv!27683 (array!74740) Bool)

(assert (=> start!98846 (and (array_inv!27683 _values!996) e!657359)))

(declare-fun bm!55003 () Bool)

(declare-fun call!55007 () ListLongMap!16553)

(assert (=> bm!55003 (= call!55007 call!55005)))

(declare-fun b!1155917 () Bool)

(declare-fun c!114949 () Bool)

(assert (=> b!1155917 (= c!114949 (and (not lt!518623) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657365 () Unit!37916)

(assert (=> b!1155917 (= e!657372 e!657365)))

(declare-fun c!114950 () Bool)

(declare-fun bm!55004 () Bool)

(assert (=> bm!55004 (= call!55004 (contains!6744 (ite c!114950 lt!518633 call!55007) k0!934))))

(declare-fun b!1155918 () Bool)

(declare-fun e!657361 () Bool)

(declare-fun e!657367 () Bool)

(assert (=> b!1155918 (= e!657361 (not e!657367))))

(declare-fun res!767890 () Bool)

(assert (=> b!1155918 (=> res!767890 e!657367)))

(assert (=> b!1155918 (= res!767890 (bvsgt from!1455 i!673))))

(assert (=> b!1155918 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518627 () Unit!37916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74738 (_ BitVec 64) (_ BitVec 32)) Unit!37916)

(assert (=> b!1155918 (= lt!518627 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!55005 () Bool)

(assert (=> bm!55005 (= call!55003 (addStillContains!914 lt!518635 (ite (or c!114950 c!114949) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114950 c!114949) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1155919 () Bool)

(declare-fun res!767883 () Bool)

(assert (=> b!1155919 (=> (not res!767883) (not e!657369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74738 (_ BitVec 32)) Bool)

(assert (=> b!1155919 (= res!767883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155920 () Bool)

(declare-fun e!657364 () Unit!37916)

(assert (=> b!1155920 (= e!657365 e!657364)))

(declare-fun c!114948 () Bool)

(assert (=> b!1155920 (= c!114948 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518623))))

(declare-fun b!1155921 () Bool)

(declare-fun res!767887 () Bool)

(assert (=> b!1155921 (=> (not res!767887) (not e!657369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155921 (= res!767887 (validKeyInArray!0 k0!934))))

(declare-fun b!1155922 () Bool)

(declare-fun e!657366 () Unit!37916)

(declare-fun Unit!37918 () Unit!37916)

(assert (=> b!1155922 (= e!657366 Unit!37918)))

(declare-fun bm!55006 () Bool)

(declare-fun call!55009 () Unit!37916)

(assert (=> bm!55006 (= call!55009 call!55003)))

(declare-fun b!1155923 () Bool)

(declare-fun e!657373 () Bool)

(assert (=> b!1155923 (= e!657373 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155924 () Bool)

(declare-fun res!767886 () Bool)

(assert (=> b!1155924 (=> (not res!767886) (not e!657369))))

(assert (=> b!1155924 (= res!767886 (and (= (size!36559 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36558 _keys!1208) (size!36559 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45305 () Bool)

(assert (=> mapIsEmpty!45305 mapRes!45305))

(declare-fun b!1155925 () Bool)

(assert (=> b!1155925 (= e!657367 e!657374)))

(declare-fun res!767896 () Bool)

(assert (=> b!1155925 (=> res!767896 e!657374)))

(assert (=> b!1155925 (= res!767896 (not (= from!1455 i!673)))))

(declare-fun lt!518632 () ListLongMap!16553)

(assert (=> b!1155925 (= lt!518632 (getCurrentListMapNoExtraKeys!4773 lt!518643 lt!518641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518636 () V!43777)

(assert (=> b!1155925 (= lt!518641 (array!74741 (store (arr!36021 _values!996) i!673 (ValueCellFull!13784 lt!518636)) (size!36559 _values!996)))))

(declare-fun dynLambda!2731 (Int (_ BitVec 64)) V!43777)

(assert (=> b!1155925 (= lt!518636 (dynLambda!2731 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518625 () ListLongMap!16553)

(assert (=> b!1155925 (= lt!518625 (getCurrentListMapNoExtraKeys!4773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155926 () Bool)

(declare-fun res!767895 () Bool)

(assert (=> b!1155926 (=> (not res!767895) (not e!657361))))

(declare-datatypes ((List!25315 0))(
  ( (Nil!25312) (Cons!25311 (h!26520 (_ BitVec 64)) (t!36755 List!25315)) )
))
(declare-fun arrayNoDuplicates!0 (array!74738 (_ BitVec 32) List!25315) Bool)

(assert (=> b!1155926 (= res!767895 (arrayNoDuplicates!0 lt!518643 #b00000000000000000000000000000000 Nil!25312))))

(declare-fun b!1155927 () Bool)

(declare-fun res!767884 () Bool)

(assert (=> b!1155927 (=> (not res!767884) (not e!657369))))

(assert (=> b!1155927 (= res!767884 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36558 _keys!1208))))))

(declare-fun b!1155928 () Bool)

(declare-fun lt!518626 () Unit!37916)

(assert (=> b!1155928 (= e!657365 lt!518626)))

(assert (=> b!1155928 (= lt!518626 call!55009)))

(assert (=> b!1155928 call!55010))

(declare-fun b!1155929 () Bool)

(assert (=> b!1155929 call!55010))

(declare-fun lt!518634 () Unit!37916)

(assert (=> b!1155929 (= lt!518634 call!55009)))

(assert (=> b!1155929 (= e!657364 lt!518634)))

(declare-fun b!1155930 () Bool)

(declare-fun Unit!37919 () Unit!37916)

(assert (=> b!1155930 (= e!657364 Unit!37919)))

(declare-fun b!1155931 () Bool)

(declare-fun Unit!37920 () Unit!37916)

(assert (=> b!1155931 (= e!657366 Unit!37920)))

(assert (=> b!1155931 (= lt!518623 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155931 (= c!114950 (and (not lt!518623) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518637 () Unit!37916)

(assert (=> b!1155931 (= lt!518637 e!657372)))

(declare-fun lt!518628 () Unit!37916)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!498 (array!74738 array!74740 (_ BitVec 32) (_ BitVec 32) V!43777 V!43777 (_ BitVec 64) (_ BitVec 32) Int) Unit!37916)

(assert (=> b!1155931 (= lt!518628 (lemmaListMapContainsThenArrayContainsFrom!498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114946 () Bool)

(assert (=> b!1155931 (= c!114946 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767885 () Bool)

(assert (=> b!1155931 (= res!767885 e!657363)))

(assert (=> b!1155931 (=> (not res!767885) (not e!657373))))

(assert (=> b!1155931 e!657373))

(declare-fun lt!518622 () Unit!37916)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74738 (_ BitVec 32) (_ BitVec 32)) Unit!37916)

(assert (=> b!1155931 (= lt!518622 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155931 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25312)))

(declare-fun lt!518639 () Unit!37916)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74738 (_ BitVec 64) (_ BitVec 32) List!25315) Unit!37916)

(assert (=> b!1155931 (= lt!518639 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25312))))

(assert (=> b!1155931 false))

(declare-fun b!1155932 () Bool)

(declare-fun res!767889 () Bool)

(assert (=> b!1155932 (=> (not res!767889) (not e!657369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155932 (= res!767889 (validMask!0 mask!1564))))

(declare-fun b!1155933 () Bool)

(declare-fun res!767897 () Bool)

(assert (=> b!1155933 (=> (not res!767897) (not e!657369))))

(assert (=> b!1155933 (= res!767897 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25312))))

(declare-fun lt!518630 () ListLongMap!16553)

(declare-fun e!657362 () Bool)

(declare-fun b!1155934 () Bool)

(assert (=> b!1155934 (= e!657362 (= lt!518630 (getCurrentListMapNoExtraKeys!4773 lt!518643 lt!518641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun mapNonEmpty!45305 () Bool)

(declare-fun tp!86081 () Bool)

(assert (=> mapNonEmpty!45305 (= mapRes!45305 (and tp!86081 e!657370))))

(declare-fun mapValue!45305 () ValueCell!13784)

(declare-fun mapKey!45305 () (_ BitVec 32))

(declare-fun mapRest!45305 () (Array (_ BitVec 32) ValueCell!13784))

(assert (=> mapNonEmpty!45305 (= (arr!36021 _values!996) (store mapRest!45305 mapKey!45305 mapValue!45305))))

(declare-fun bm!55007 () Bool)

(assert (=> bm!55007 (= call!55005 (+!3703 (ite c!114950 lt!518633 lt!518635) (ite c!114950 (tuple2!18585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114949 (tuple2!18585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155935 () Bool)

(declare-fun res!767892 () Bool)

(assert (=> b!1155935 (=> (not res!767892) (not e!657369))))

(assert (=> b!1155935 (= res!767892 (= (select (arr!36020 _keys!1208) i!673) k0!934))))

(declare-fun b!1155936 () Bool)

(assert (=> b!1155936 (= e!657371 true)))

(assert (=> b!1155936 e!657362))

(declare-fun res!767891 () Bool)

(assert (=> b!1155936 (=> (not res!767891) (not e!657362))))

(assert (=> b!1155936 (= res!767891 (= lt!518630 lt!518635))))

(assert (=> b!1155936 (= lt!518630 (-!1351 lt!518625 k0!934))))

(declare-fun lt!518638 () V!43777)

(assert (=> b!1155936 (= (-!1351 (+!3703 lt!518635 (tuple2!18585 (select (arr!36020 _keys!1208) from!1455) lt!518638)) (select (arr!36020 _keys!1208) from!1455)) lt!518635)))

(declare-fun lt!518629 () Unit!37916)

(declare-fun addThenRemoveForNewKeyIsSame!204 (ListLongMap!16553 (_ BitVec 64) V!43777) Unit!37916)

(assert (=> b!1155936 (= lt!518629 (addThenRemoveForNewKeyIsSame!204 lt!518635 (select (arr!36020 _keys!1208) from!1455) lt!518638))))

(declare-fun get!18370 (ValueCell!13784 V!43777) V!43777)

(assert (=> b!1155936 (= lt!518638 (get!18370 (select (arr!36021 _values!996) from!1455) lt!518636))))

(declare-fun lt!518640 () Unit!37916)

(assert (=> b!1155936 (= lt!518640 e!657366)))

(declare-fun c!114945 () Bool)

(assert (=> b!1155936 (= c!114945 (contains!6744 lt!518635 k0!934))))

(assert (=> b!1155936 (= lt!518635 (getCurrentListMapNoExtraKeys!4773 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155937 () Bool)

(assert (=> b!1155937 (= e!657368 tp_is_empty!28987)))

(declare-fun b!1155938 () Bool)

(assert (=> b!1155938 (= e!657375 (= call!55006 call!55008))))

(declare-fun b!1155939 () Bool)

(assert (=> b!1155939 (= e!657369 e!657361)))

(declare-fun res!767888 () Bool)

(assert (=> b!1155939 (=> (not res!767888) (not e!657361))))

(assert (=> b!1155939 (= res!767888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518643 mask!1564))))

(assert (=> b!1155939 (= lt!518643 (array!74739 (store (arr!36020 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36558 _keys!1208)))))

(assert (= (and start!98846 res!767893) b!1155932))

(assert (= (and b!1155932 res!767889) b!1155924))

(assert (= (and b!1155924 res!767886) b!1155919))

(assert (= (and b!1155919 res!767883) b!1155933))

(assert (= (and b!1155933 res!767897) b!1155927))

(assert (= (and b!1155927 res!767884) b!1155921))

(assert (= (and b!1155921 res!767887) b!1155935))

(assert (= (and b!1155935 res!767892) b!1155939))

(assert (= (and b!1155939 res!767888) b!1155926))

(assert (= (and b!1155926 res!767895) b!1155918))

(assert (= (and b!1155918 (not res!767890)) b!1155925))

(assert (= (and b!1155925 (not res!767896)) b!1155915))

(assert (= (and b!1155915 c!114947) b!1155910))

(assert (= (and b!1155915 (not c!114947)) b!1155938))

(assert (= (or b!1155910 b!1155938) bm!55002))

(assert (= (or b!1155910 b!1155938) bm!55001))

(assert (= (and b!1155915 (not res!767894)) b!1155936))

(assert (= (and b!1155936 c!114945) b!1155931))

(assert (= (and b!1155936 (not c!114945)) b!1155922))

(assert (= (and b!1155931 c!114950) b!1155913))

(assert (= (and b!1155931 (not c!114950)) b!1155917))

(assert (= (and b!1155917 c!114949) b!1155928))

(assert (= (and b!1155917 (not c!114949)) b!1155920))

(assert (= (and b!1155920 c!114948) b!1155929))

(assert (= (and b!1155920 (not c!114948)) b!1155930))

(assert (= (or b!1155928 b!1155929) bm!55006))

(assert (= (or b!1155928 b!1155929) bm!55003))

(assert (= (or b!1155928 b!1155929) bm!55000))

(assert (= (or b!1155913 bm!55000) bm!55004))

(assert (= (or b!1155913 bm!55006) bm!55005))

(assert (= (or b!1155913 bm!55003) bm!55007))

(assert (= (and b!1155931 c!114946) b!1155911))

(assert (= (and b!1155931 (not c!114946)) b!1155914))

(assert (= (and b!1155931 res!767885) b!1155923))

(assert (= (and b!1155936 res!767891) b!1155934))

(assert (= (and b!1155916 condMapEmpty!45305) mapIsEmpty!45305))

(assert (= (and b!1155916 (not condMapEmpty!45305)) mapNonEmpty!45305))

(get-info :version)

(assert (= (and mapNonEmpty!45305 ((_ is ValueCellFull!13784) mapValue!45305)) b!1155912))

(assert (= (and b!1155916 ((_ is ValueCellFull!13784) mapDefault!45305)) b!1155937))

(assert (= start!98846 b!1155916))

(declare-fun b_lambda!19545 () Bool)

(assert (=> (not b_lambda!19545) (not b!1155925)))

(declare-fun t!36753 () Bool)

(declare-fun tb!9261 () Bool)

(assert (=> (and start!98846 (= defaultEntry!1004 defaultEntry!1004) t!36753) tb!9261))

(declare-fun result!19095 () Bool)

(assert (=> tb!9261 (= result!19095 tp_is_empty!28987)))

(assert (=> b!1155925 t!36753))

(declare-fun b_and!39743 () Bool)

(assert (= b_and!39741 (and (=> t!36753 result!19095) b_and!39743)))

(declare-fun m!1064951 () Bool)

(assert (=> bm!55004 m!1064951))

(declare-fun m!1064953 () Bool)

(assert (=> b!1155935 m!1064953))

(declare-fun m!1064955 () Bool)

(assert (=> bm!55005 m!1064955))

(declare-fun m!1064957 () Bool)

(assert (=> b!1155936 m!1064957))

(declare-fun m!1064959 () Bool)

(assert (=> b!1155936 m!1064959))

(declare-fun m!1064961 () Bool)

(assert (=> b!1155936 m!1064961))

(declare-fun m!1064963 () Bool)

(assert (=> b!1155936 m!1064963))

(declare-fun m!1064965 () Bool)

(assert (=> b!1155936 m!1064965))

(declare-fun m!1064967 () Bool)

(assert (=> b!1155936 m!1064967))

(declare-fun m!1064969 () Bool)

(assert (=> b!1155936 m!1064969))

(assert (=> b!1155936 m!1064957))

(assert (=> b!1155936 m!1064959))

(declare-fun m!1064971 () Bool)

(assert (=> b!1155936 m!1064971))

(assert (=> b!1155936 m!1064965))

(declare-fun m!1064973 () Bool)

(assert (=> b!1155936 m!1064973))

(assert (=> b!1155936 m!1064959))

(declare-fun m!1064975 () Bool)

(assert (=> b!1155913 m!1064975))

(declare-fun m!1064977 () Bool)

(assert (=> b!1155913 m!1064977))

(declare-fun m!1064979 () Bool)

(assert (=> b!1155913 m!1064979))

(declare-fun m!1064981 () Bool)

(assert (=> b!1155921 m!1064981))

(assert (=> b!1155915 m!1064959))

(declare-fun m!1064983 () Bool)

(assert (=> b!1155915 m!1064983))

(declare-fun m!1064985 () Bool)

(assert (=> b!1155932 m!1064985))

(declare-fun m!1064987 () Bool)

(assert (=> b!1155910 m!1064987))

(declare-fun m!1064989 () Bool)

(assert (=> b!1155919 m!1064989))

(assert (=> bm!55001 m!1064963))

(declare-fun m!1064991 () Bool)

(assert (=> mapNonEmpty!45305 m!1064991))

(declare-fun m!1064993 () Bool)

(assert (=> b!1155931 m!1064993))

(declare-fun m!1064995 () Bool)

(assert (=> b!1155931 m!1064995))

(declare-fun m!1064997 () Bool)

(assert (=> b!1155931 m!1064997))

(declare-fun m!1064999 () Bool)

(assert (=> b!1155931 m!1064999))

(declare-fun m!1065001 () Bool)

(assert (=> b!1155911 m!1065001))

(declare-fun m!1065003 () Bool)

(assert (=> start!98846 m!1065003))

(declare-fun m!1065005 () Bool)

(assert (=> start!98846 m!1065005))

(declare-fun m!1065007 () Bool)

(assert (=> bm!55002 m!1065007))

(declare-fun m!1065009 () Bool)

(assert (=> b!1155925 m!1065009))

(declare-fun m!1065011 () Bool)

(assert (=> b!1155925 m!1065011))

(declare-fun m!1065013 () Bool)

(assert (=> b!1155925 m!1065013))

(declare-fun m!1065015 () Bool)

(assert (=> b!1155925 m!1065015))

(declare-fun m!1065017 () Bool)

(assert (=> b!1155918 m!1065017))

(declare-fun m!1065019 () Bool)

(assert (=> b!1155918 m!1065019))

(assert (=> b!1155923 m!1065001))

(declare-fun m!1065021 () Bool)

(assert (=> b!1155939 m!1065021))

(declare-fun m!1065023 () Bool)

(assert (=> b!1155939 m!1065023))

(declare-fun m!1065025 () Bool)

(assert (=> bm!55007 m!1065025))

(assert (=> b!1155934 m!1065007))

(declare-fun m!1065027 () Bool)

(assert (=> b!1155926 m!1065027))

(declare-fun m!1065029 () Bool)

(assert (=> b!1155933 m!1065029))

(check-sat (not b!1155925) (not bm!55005) b_and!39743 (not b!1155910) (not start!98846) (not b!1155934) (not mapNonEmpty!45305) (not b!1155931) (not b_lambda!19545) (not bm!55002) (not bm!55004) (not b!1155911) (not b!1155919) (not bm!55007) (not bm!55001) (not b!1155915) (not b!1155923) (not b!1155921) (not b!1155933) (not b_next!24457) (not b!1155918) (not b!1155939) (not b!1155932) tp_is_empty!28987 (not b!1155936) (not b!1155926) (not b!1155913))
(check-sat b_and!39743 (not b_next!24457))
