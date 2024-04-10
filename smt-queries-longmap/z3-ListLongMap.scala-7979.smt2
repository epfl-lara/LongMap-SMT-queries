; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98716 () Bool)

(assert start!98716)

(declare-fun b_free!24321 () Bool)

(declare-fun b_next!24321 () Bool)

(assert (=> start!98716 (= b_free!24321 (not b_next!24321))))

(declare-fun tp!85673 () Bool)

(declare-fun b_and!39491 () Bool)

(assert (=> start!98716 (= tp!85673 b_and!39491)))

(declare-fun b!1149778 () Bool)

(declare-datatypes ((V!43595 0))(
  ( (V!43596 (val!14482 Int)) )
))
(declare-datatypes ((tuple2!18376 0))(
  ( (tuple2!18377 (_1!9199 (_ BitVec 64)) (_2!9199 V!43595)) )
))
(declare-datatypes ((List!25125 0))(
  ( (Nil!25122) (Cons!25121 (h!26330 tuple2!18376) (t!36438 List!25125)) )
))
(declare-datatypes ((ListLongMap!16345 0))(
  ( (ListLongMap!16346 (toList!8188 List!25125)) )
))
(declare-fun call!53399 () ListLongMap!16345)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!53398 () ListLongMap!16345)

(declare-fun e!653969 () Bool)

(declare-fun -!1321 (ListLongMap!16345 (_ BitVec 64)) ListLongMap!16345)

(assert (=> b!1149778 (= e!653969 (= call!53398 (-!1321 call!53399 k0!934)))))

(declare-fun b!1149779 () Bool)

(declare-datatypes ((Unit!37801 0))(
  ( (Unit!37802) )
))
(declare-fun e!653975 () Unit!37801)

(declare-fun lt!514345 () Unit!37801)

(assert (=> b!1149779 (= e!653975 lt!514345)))

(declare-fun call!53400 () Unit!37801)

(assert (=> b!1149779 (= lt!514345 call!53400)))

(declare-fun call!53394 () Bool)

(assert (=> b!1149779 call!53394))

(declare-fun b!1149780 () Bool)

(declare-fun call!53401 () ListLongMap!16345)

(declare-fun contains!6709 (ListLongMap!16345 (_ BitVec 64)) Bool)

(assert (=> b!1149780 (contains!6709 call!53401 k0!934)))

(declare-fun lt!514339 () Unit!37801)

(declare-fun call!53395 () Unit!37801)

(assert (=> b!1149780 (= lt!514339 call!53395)))

(declare-fun call!53397 () Bool)

(assert (=> b!1149780 call!53397))

(declare-fun lt!514344 () ListLongMap!16345)

(declare-fun lt!514346 () ListLongMap!16345)

(declare-fun zeroValue!944 () V!43595)

(declare-fun +!3609 (ListLongMap!16345 tuple2!18376) ListLongMap!16345)

(assert (=> b!1149780 (= lt!514344 (+!3609 lt!514346 (tuple2!18377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!514341 () Unit!37801)

(declare-fun addStillContains!859 (ListLongMap!16345 (_ BitVec 64) V!43595 (_ BitVec 64)) Unit!37801)

(assert (=> b!1149780 (= lt!514341 (addStillContains!859 lt!514346 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!653977 () Unit!37801)

(assert (=> b!1149780 (= e!653977 lt!514339)))

(declare-fun b!1149781 () Bool)

(declare-fun res!764890 () Bool)

(declare-fun e!653985 () Bool)

(assert (=> b!1149781 (=> (not res!764890) (not e!653985))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74549 0))(
  ( (array!74550 (arr!35925 (Array (_ BitVec 32) (_ BitVec 64))) (size!36461 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74549)

(assert (=> b!1149781 (= res!764890 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36461 _keys!1208))))))

(declare-fun bm!53391 () Bool)

(declare-fun call!53396 () ListLongMap!16345)

(assert (=> bm!53391 (= call!53396 call!53401)))

(declare-fun b!1149782 () Bool)

(declare-fun e!653979 () Bool)

(declare-fun tp_is_empty!28851 () Bool)

(assert (=> b!1149782 (= e!653979 tp_is_empty!28851)))

(declare-fun c!113752 () Bool)

(declare-fun c!113751 () Bool)

(declare-fun minValue!944 () V!43595)

(declare-fun bm!53392 () Bool)

(assert (=> bm!53392 (= call!53401 (+!3609 (ite c!113751 lt!514344 lt!514346) (ite c!113751 (tuple2!18377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113752 (tuple2!18377 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18377 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1149783 () Bool)

(declare-fun res!764891 () Bool)

(assert (=> b!1149783 (=> (not res!764891) (not e!653985))))

(assert (=> b!1149783 (= res!764891 (= (select (arr!35925 _keys!1208) i!673) k0!934))))

(declare-fun b!1149784 () Bool)

(declare-fun e!653980 () Bool)

(declare-fun e!653973 () Bool)

(assert (=> b!1149784 (= e!653980 e!653973)))

(declare-fun res!764896 () Bool)

(assert (=> b!1149784 (=> res!764896 e!653973)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1149784 (= res!764896 (not (= from!1455 i!673)))))

(declare-fun lt!514338 () ListLongMap!16345)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!514342 () array!74549)

(declare-datatypes ((ValueCell!13716 0))(
  ( (ValueCellFull!13716 (v!17119 V!43595)) (EmptyCell!13716) )
))
(declare-datatypes ((array!74551 0))(
  ( (array!74552 (arr!35926 (Array (_ BitVec 32) ValueCell!13716)) (size!36462 (_ BitVec 32))) )
))
(declare-fun lt!514327 () array!74551)

(declare-fun getCurrentListMapNoExtraKeys!4661 (array!74549 array!74551 (_ BitVec 32) (_ BitVec 32) V!43595 V!43595 (_ BitVec 32) Int) ListLongMap!16345)

(assert (=> b!1149784 (= lt!514338 (getCurrentListMapNoExtraKeys!4661 lt!514342 lt!514327 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74551)

(declare-fun lt!514328 () V!43595)

(assert (=> b!1149784 (= lt!514327 (array!74552 (store (arr!35926 _values!996) i!673 (ValueCellFull!13716 lt!514328)) (size!36462 _values!996)))))

(declare-fun dynLambda!2686 (Int (_ BitVec 64)) V!43595)

(assert (=> b!1149784 (= lt!514328 (dynLambda!2686 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514331 () ListLongMap!16345)

(assert (=> b!1149784 (= lt!514331 (getCurrentListMapNoExtraKeys!4661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!653978 () Bool)

(declare-fun lt!514334 () Bool)

(declare-fun b!1149786 () Bool)

(assert (=> b!1149786 (= e!653978 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514334) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149787 () Bool)

(declare-fun e!653982 () Unit!37801)

(declare-fun Unit!37803 () Unit!37801)

(assert (=> b!1149787 (= e!653982 Unit!37803)))

(declare-fun b!1149788 () Bool)

(declare-fun e!653972 () Unit!37801)

(declare-fun Unit!37804 () Unit!37801)

(assert (=> b!1149788 (= e!653972 Unit!37804)))

(declare-fun mapIsEmpty!45101 () Bool)

(declare-fun mapRes!45101 () Bool)

(assert (=> mapIsEmpty!45101 mapRes!45101))

(declare-fun b!1149789 () Bool)

(declare-fun e!653983 () Bool)

(assert (=> b!1149789 (= e!653983 (not e!653980))))

(declare-fun res!764903 () Bool)

(assert (=> b!1149789 (=> res!764903 e!653980)))

(assert (=> b!1149789 (= res!764903 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149789 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514340 () Unit!37801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74549 (_ BitVec 64) (_ BitVec 32)) Unit!37801)

(assert (=> b!1149789 (= lt!514340 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149790 () Bool)

(assert (=> b!1149790 (= e!653969 (= call!53398 call!53399))))

(declare-fun b!1149791 () Bool)

(declare-fun Unit!37805 () Unit!37801)

(assert (=> b!1149791 (= e!653972 Unit!37805)))

(assert (=> b!1149791 (= lt!514334 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149791 (= c!113751 (and (not lt!514334) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514330 () Unit!37801)

(assert (=> b!1149791 (= lt!514330 e!653977)))

(declare-fun lt!514332 () Unit!37801)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!451 (array!74549 array!74551 (_ BitVec 32) (_ BitVec 32) V!43595 V!43595 (_ BitVec 64) (_ BitVec 32) Int) Unit!37801)

(assert (=> b!1149791 (= lt!514332 (lemmaListMapContainsThenArrayContainsFrom!451 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113747 () Bool)

(assert (=> b!1149791 (= c!113747 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764893 () Bool)

(assert (=> b!1149791 (= res!764893 e!653978)))

(declare-fun e!653984 () Bool)

(assert (=> b!1149791 (=> (not res!764893) (not e!653984))))

(assert (=> b!1149791 e!653984))

(declare-fun lt!514343 () Unit!37801)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74549 (_ BitVec 32) (_ BitVec 32)) Unit!37801)

(assert (=> b!1149791 (= lt!514343 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25126 0))(
  ( (Nil!25123) (Cons!25122 (h!26331 (_ BitVec 64)) (t!36439 List!25126)) )
))
(declare-fun arrayNoDuplicates!0 (array!74549 (_ BitVec 32) List!25126) Bool)

(assert (=> b!1149791 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25123)))

(declare-fun lt!514326 () Unit!37801)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74549 (_ BitVec 64) (_ BitVec 32) List!25126) Unit!37801)

(assert (=> b!1149791 (= lt!514326 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25123))))

(assert (=> b!1149791 false))

(declare-fun b!1149792 () Bool)

(assert (=> b!1149792 (= e!653985 e!653983)))

(declare-fun res!764902 () Bool)

(assert (=> b!1149792 (=> (not res!764902) (not e!653983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74549 (_ BitVec 32)) Bool)

(assert (=> b!1149792 (= res!764902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514342 mask!1564))))

(assert (=> b!1149792 (= lt!514342 (array!74550 (store (arr!35925 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36461 _keys!1208)))))

(declare-fun b!1149793 () Bool)

(declare-fun e!653970 () Bool)

(assert (=> b!1149793 (= e!653970 true)))

(declare-fun e!653976 () Bool)

(assert (=> b!1149793 e!653976))

(declare-fun res!764892 () Bool)

(assert (=> b!1149793 (=> (not res!764892) (not e!653976))))

(declare-fun lt!514335 () ListLongMap!16345)

(assert (=> b!1149793 (= res!764892 (= lt!514335 lt!514346))))

(assert (=> b!1149793 (= lt!514335 (-!1321 lt!514331 k0!934))))

(declare-fun lt!514347 () V!43595)

(assert (=> b!1149793 (= (-!1321 (+!3609 lt!514346 (tuple2!18377 (select (arr!35925 _keys!1208) from!1455) lt!514347)) (select (arr!35925 _keys!1208) from!1455)) lt!514346)))

(declare-fun lt!514337 () Unit!37801)

(declare-fun addThenRemoveForNewKeyIsSame!165 (ListLongMap!16345 (_ BitVec 64) V!43595) Unit!37801)

(assert (=> b!1149793 (= lt!514337 (addThenRemoveForNewKeyIsSame!165 lt!514346 (select (arr!35925 _keys!1208) from!1455) lt!514347))))

(declare-fun get!18285 (ValueCell!13716 V!43595) V!43595)

(assert (=> b!1149793 (= lt!514347 (get!18285 (select (arr!35926 _values!996) from!1455) lt!514328))))

(declare-fun lt!514329 () Unit!37801)

(assert (=> b!1149793 (= lt!514329 e!653972)))

(declare-fun c!113748 () Bool)

(assert (=> b!1149793 (= c!113748 (contains!6709 lt!514346 k0!934))))

(assert (=> b!1149793 (= lt!514346 (getCurrentListMapNoExtraKeys!4661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149794 () Bool)

(assert (=> b!1149794 (= e!653975 e!653982)))

(declare-fun c!113749 () Bool)

(assert (=> b!1149794 (= c!113749 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514334))))

(declare-fun b!1149795 () Bool)

(assert (=> b!1149795 (= e!653978 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149796 () Bool)

(assert (=> b!1149796 (= c!113752 (and (not lt!514334) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149796 (= e!653977 e!653975)))

(declare-fun b!1149797 () Bool)

(assert (=> b!1149797 (= e!653984 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53393 () Bool)

(assert (=> bm!53393 (= call!53400 call!53395)))

(declare-fun b!1149798 () Bool)

(assert (=> b!1149798 (= e!653976 (= lt!514335 (getCurrentListMapNoExtraKeys!4661 lt!514342 lt!514327 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53394 () Bool)

(assert (=> bm!53394 (= call!53399 (getCurrentListMapNoExtraKeys!4661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149799 () Bool)

(declare-fun res!764899 () Bool)

(assert (=> b!1149799 (=> (not res!764899) (not e!653983))))

(assert (=> b!1149799 (= res!764899 (arrayNoDuplicates!0 lt!514342 #b00000000000000000000000000000000 Nil!25123))))

(declare-fun b!1149800 () Bool)

(declare-fun res!764900 () Bool)

(assert (=> b!1149800 (=> (not res!764900) (not e!653985))))

(assert (=> b!1149800 (= res!764900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149801 () Bool)

(declare-fun e!653974 () Bool)

(declare-fun e!653971 () Bool)

(assert (=> b!1149801 (= e!653974 (and e!653971 mapRes!45101))))

(declare-fun condMapEmpty!45101 () Bool)

(declare-fun mapDefault!45101 () ValueCell!13716)

(assert (=> b!1149801 (= condMapEmpty!45101 (= (arr!35926 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13716)) mapDefault!45101)))))

(declare-fun bm!53395 () Bool)

(assert (=> bm!53395 (= call!53394 call!53397)))

(declare-fun mapNonEmpty!45101 () Bool)

(declare-fun tp!85674 () Bool)

(assert (=> mapNonEmpty!45101 (= mapRes!45101 (and tp!85674 e!653979))))

(declare-fun mapRest!45101 () (Array (_ BitVec 32) ValueCell!13716))

(declare-fun mapValue!45101 () ValueCell!13716)

(declare-fun mapKey!45101 () (_ BitVec 32))

(assert (=> mapNonEmpty!45101 (= (arr!35926 _values!996) (store mapRest!45101 mapKey!45101 mapValue!45101))))

(declare-fun b!1149802 () Bool)

(assert (=> b!1149802 call!53394))

(declare-fun lt!514333 () Unit!37801)

(assert (=> b!1149802 (= lt!514333 call!53400)))

(assert (=> b!1149802 (= e!653982 lt!514333)))

(declare-fun b!1149803 () Bool)

(assert (=> b!1149803 (= e!653973 e!653970)))

(declare-fun res!764901 () Bool)

(assert (=> b!1149803 (=> res!764901 e!653970)))

(assert (=> b!1149803 (= res!764901 (not (= (select (arr!35925 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1149803 e!653969))

(declare-fun c!113750 () Bool)

(assert (=> b!1149803 (= c!113750 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514336 () Unit!37801)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!558 (array!74549 array!74551 (_ BitVec 32) (_ BitVec 32) V!43595 V!43595 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37801)

(assert (=> b!1149803 (= lt!514336 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!558 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53396 () Bool)

(assert (=> bm!53396 (= call!53395 (addStillContains!859 (ite c!113751 lt!514344 lt!514346) (ite c!113751 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113752 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113751 minValue!944 (ite c!113752 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!53397 () Bool)

(assert (=> bm!53397 (= call!53397 (contains!6709 (ite c!113751 lt!514344 call!53396) k0!934))))

(declare-fun res!764894 () Bool)

(assert (=> start!98716 (=> (not res!764894) (not e!653985))))

(assert (=> start!98716 (= res!764894 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36461 _keys!1208))))))

(assert (=> start!98716 e!653985))

(assert (=> start!98716 tp_is_empty!28851))

(declare-fun array_inv!27512 (array!74549) Bool)

(assert (=> start!98716 (array_inv!27512 _keys!1208)))

(assert (=> start!98716 true))

(assert (=> start!98716 tp!85673))

(declare-fun array_inv!27513 (array!74551) Bool)

(assert (=> start!98716 (and (array_inv!27513 _values!996) e!653974)))

(declare-fun b!1149785 () Bool)

(declare-fun res!764898 () Bool)

(assert (=> b!1149785 (=> (not res!764898) (not e!653985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149785 (= res!764898 (validKeyInArray!0 k0!934))))

(declare-fun b!1149804 () Bool)

(assert (=> b!1149804 (= e!653971 tp_is_empty!28851)))

(declare-fun bm!53398 () Bool)

(assert (=> bm!53398 (= call!53398 (getCurrentListMapNoExtraKeys!4661 lt!514342 lt!514327 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149805 () Bool)

(declare-fun res!764889 () Bool)

(assert (=> b!1149805 (=> (not res!764889) (not e!653985))))

(assert (=> b!1149805 (= res!764889 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25123))))

(declare-fun b!1149806 () Bool)

(declare-fun res!764897 () Bool)

(assert (=> b!1149806 (=> (not res!764897) (not e!653985))))

(assert (=> b!1149806 (= res!764897 (and (= (size!36462 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36461 _keys!1208) (size!36462 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1149807 () Bool)

(declare-fun res!764895 () Bool)

(assert (=> b!1149807 (=> (not res!764895) (not e!653985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149807 (= res!764895 (validMask!0 mask!1564))))

(assert (= (and start!98716 res!764894) b!1149807))

(assert (= (and b!1149807 res!764895) b!1149806))

(assert (= (and b!1149806 res!764897) b!1149800))

(assert (= (and b!1149800 res!764900) b!1149805))

(assert (= (and b!1149805 res!764889) b!1149781))

(assert (= (and b!1149781 res!764890) b!1149785))

(assert (= (and b!1149785 res!764898) b!1149783))

(assert (= (and b!1149783 res!764891) b!1149792))

(assert (= (and b!1149792 res!764902) b!1149799))

(assert (= (and b!1149799 res!764899) b!1149789))

(assert (= (and b!1149789 (not res!764903)) b!1149784))

(assert (= (and b!1149784 (not res!764896)) b!1149803))

(assert (= (and b!1149803 c!113750) b!1149778))

(assert (= (and b!1149803 (not c!113750)) b!1149790))

(assert (= (or b!1149778 b!1149790) bm!53398))

(assert (= (or b!1149778 b!1149790) bm!53394))

(assert (= (and b!1149803 (not res!764901)) b!1149793))

(assert (= (and b!1149793 c!113748) b!1149791))

(assert (= (and b!1149793 (not c!113748)) b!1149788))

(assert (= (and b!1149791 c!113751) b!1149780))

(assert (= (and b!1149791 (not c!113751)) b!1149796))

(assert (= (and b!1149796 c!113752) b!1149779))

(assert (= (and b!1149796 (not c!113752)) b!1149794))

(assert (= (and b!1149794 c!113749) b!1149802))

(assert (= (and b!1149794 (not c!113749)) b!1149787))

(assert (= (or b!1149779 b!1149802) bm!53393))

(assert (= (or b!1149779 b!1149802) bm!53391))

(assert (= (or b!1149779 b!1149802) bm!53395))

(assert (= (or b!1149780 bm!53395) bm!53397))

(assert (= (or b!1149780 bm!53393) bm!53396))

(assert (= (or b!1149780 bm!53391) bm!53392))

(assert (= (and b!1149791 c!113747) b!1149795))

(assert (= (and b!1149791 (not c!113747)) b!1149786))

(assert (= (and b!1149791 res!764893) b!1149797))

(assert (= (and b!1149793 res!764892) b!1149798))

(assert (= (and b!1149801 condMapEmpty!45101) mapIsEmpty!45101))

(assert (= (and b!1149801 (not condMapEmpty!45101)) mapNonEmpty!45101))

(get-info :version)

(assert (= (and mapNonEmpty!45101 ((_ is ValueCellFull!13716) mapValue!45101)) b!1149782))

(assert (= (and b!1149801 ((_ is ValueCellFull!13716) mapDefault!45101)) b!1149804))

(assert (= start!98716 b!1149801))

(declare-fun b_lambda!19427 () Bool)

(assert (=> (not b_lambda!19427) (not b!1149784)))

(declare-fun t!36437 () Bool)

(declare-fun tb!9133 () Bool)

(assert (=> (and start!98716 (= defaultEntry!1004 defaultEntry!1004) t!36437) tb!9133))

(declare-fun result!18831 () Bool)

(assert (=> tb!9133 (= result!18831 tp_is_empty!28851)))

(assert (=> b!1149784 t!36437))

(declare-fun b_and!39493 () Bool)

(assert (= b_and!39491 (and (=> t!36437 result!18831) b_and!39493)))

(declare-fun m!1060101 () Bool)

(assert (=> b!1149792 m!1060101))

(declare-fun m!1060103 () Bool)

(assert (=> b!1149792 m!1060103))

(declare-fun m!1060105 () Bool)

(assert (=> bm!53398 m!1060105))

(declare-fun m!1060107 () Bool)

(assert (=> b!1149799 m!1060107))

(declare-fun m!1060109 () Bool)

(assert (=> mapNonEmpty!45101 m!1060109))

(declare-fun m!1060111 () Bool)

(assert (=> b!1149778 m!1060111))

(declare-fun m!1060113 () Bool)

(assert (=> b!1149789 m!1060113))

(declare-fun m!1060115 () Bool)

(assert (=> b!1149789 m!1060115))

(declare-fun m!1060117 () Bool)

(assert (=> bm!53396 m!1060117))

(declare-fun m!1060119 () Bool)

(assert (=> b!1149800 m!1060119))

(declare-fun m!1060121 () Bool)

(assert (=> start!98716 m!1060121))

(declare-fun m!1060123 () Bool)

(assert (=> start!98716 m!1060123))

(assert (=> b!1149798 m!1060105))

(declare-fun m!1060125 () Bool)

(assert (=> b!1149784 m!1060125))

(declare-fun m!1060127 () Bool)

(assert (=> b!1149784 m!1060127))

(declare-fun m!1060129 () Bool)

(assert (=> b!1149784 m!1060129))

(declare-fun m!1060131 () Bool)

(assert (=> b!1149784 m!1060131))

(declare-fun m!1060133 () Bool)

(assert (=> b!1149807 m!1060133))

(declare-fun m!1060135 () Bool)

(assert (=> b!1149791 m!1060135))

(declare-fun m!1060137 () Bool)

(assert (=> b!1149791 m!1060137))

(declare-fun m!1060139 () Bool)

(assert (=> b!1149791 m!1060139))

(declare-fun m!1060141 () Bool)

(assert (=> b!1149791 m!1060141))

(declare-fun m!1060143 () Bool)

(assert (=> b!1149793 m!1060143))

(declare-fun m!1060145 () Bool)

(assert (=> b!1149793 m!1060145))

(declare-fun m!1060147 () Bool)

(assert (=> b!1149793 m!1060147))

(declare-fun m!1060149 () Bool)

(assert (=> b!1149793 m!1060149))

(declare-fun m!1060151 () Bool)

(assert (=> b!1149793 m!1060151))

(declare-fun m!1060153 () Bool)

(assert (=> b!1149793 m!1060153))

(declare-fun m!1060155 () Bool)

(assert (=> b!1149793 m!1060155))

(assert (=> b!1149793 m!1060153))

(declare-fun m!1060157 () Bool)

(assert (=> b!1149793 m!1060157))

(assert (=> b!1149793 m!1060153))

(declare-fun m!1060159 () Bool)

(assert (=> b!1149793 m!1060159))

(assert (=> b!1149793 m!1060147))

(assert (=> b!1149793 m!1060151))

(declare-fun m!1060161 () Bool)

(assert (=> b!1149797 m!1060161))

(declare-fun m!1060163 () Bool)

(assert (=> bm!53397 m!1060163))

(assert (=> bm!53394 m!1060143))

(assert (=> b!1149795 m!1060161))

(declare-fun m!1060165 () Bool)

(assert (=> b!1149783 m!1060165))

(declare-fun m!1060167 () Bool)

(assert (=> bm!53392 m!1060167))

(declare-fun m!1060169 () Bool)

(assert (=> b!1149805 m!1060169))

(declare-fun m!1060171 () Bool)

(assert (=> b!1149785 m!1060171))

(assert (=> b!1149803 m!1060153))

(declare-fun m!1060173 () Bool)

(assert (=> b!1149803 m!1060173))

(declare-fun m!1060175 () Bool)

(assert (=> b!1149780 m!1060175))

(declare-fun m!1060177 () Bool)

(assert (=> b!1149780 m!1060177))

(declare-fun m!1060179 () Bool)

(assert (=> b!1149780 m!1060179))

(check-sat (not bm!53397) (not b!1149807) (not b!1149797) b_and!39493 (not b!1149803) (not b!1149778) (not b!1149793) (not b_lambda!19427) (not start!98716) (not b!1149805) (not b!1149798) (not bm!53392) (not b_next!24321) (not bm!53398) (not b!1149799) (not bm!53394) (not b!1149800) (not b!1149792) (not bm!53396) (not mapNonEmpty!45101) (not b!1149780) (not b!1149785) (not b!1149784) (not b!1149791) (not b!1149795) tp_is_empty!28851 (not b!1149789))
(check-sat b_and!39493 (not b_next!24321))
