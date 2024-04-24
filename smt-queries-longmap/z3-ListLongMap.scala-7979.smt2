; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98950 () Bool)

(assert start!98950)

(declare-fun b_free!24319 () Bool)

(declare-fun b_next!24319 () Bool)

(assert (=> start!98950 (= b_free!24319 (not b_next!24319))))

(declare-fun tp!85668 () Bool)

(declare-fun b_and!39489 () Bool)

(assert (=> start!98950 (= tp!85668 b_and!39489)))

(declare-fun b!1150975 () Bool)

(declare-datatypes ((Unit!37774 0))(
  ( (Unit!37775) )
))
(declare-fun e!654765 () Unit!37774)

(declare-fun lt!514758 () Unit!37774)

(assert (=> b!1150975 (= e!654765 lt!514758)))

(declare-fun call!53439 () Unit!37774)

(assert (=> b!1150975 (= lt!514758 call!53439)))

(declare-fun call!53437 () Bool)

(assert (=> b!1150975 call!53437))

(declare-fun mapNonEmpty!45098 () Bool)

(declare-fun mapRes!45098 () Bool)

(declare-fun tp!85667 () Bool)

(declare-fun e!654756 () Bool)

(assert (=> mapNonEmpty!45098 (= mapRes!45098 (and tp!85667 e!654756))))

(declare-fun mapKey!45098 () (_ BitVec 32))

(declare-datatypes ((V!43593 0))(
  ( (V!43594 (val!14481 Int)) )
))
(declare-datatypes ((ValueCell!13715 0))(
  ( (ValueCellFull!13715 (v!17114 V!43593)) (EmptyCell!13715) )
))
(declare-fun mapValue!45098 () ValueCell!13715)

(declare-datatypes ((array!74591 0))(
  ( (array!74592 (arr!35940 (Array (_ BitVec 32) ValueCell!13715)) (size!36477 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74591)

(declare-fun mapRest!45098 () (Array (_ BitVec 32) ValueCell!13715))

(assert (=> mapNonEmpty!45098 (= (arr!35940 _values!996) (store mapRest!45098 mapKey!45098 mapValue!45098))))

(declare-fun b!1150976 () Bool)

(declare-fun c!114129 () Bool)

(declare-fun lt!514744 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1150976 (= c!114129 (and (not lt!514744) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654764 () Unit!37774)

(assert (=> b!1150976 (= e!654764 e!654765)))

(declare-fun b!1150977 () Bool)

(declare-fun tp_is_empty!28849 () Bool)

(assert (=> b!1150977 (= e!654756 tp_is_empty!28849)))

(declare-fun b!1150978 () Bool)

(declare-fun res!765357 () Bool)

(declare-fun e!654754 () Bool)

(assert (=> b!1150978 (=> (not res!765357) (not e!654754))))

(declare-datatypes ((array!74593 0))(
  ( (array!74594 (arr!35941 (Array (_ BitVec 32) (_ BitVec 64))) (size!36478 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74593)

(declare-datatypes ((List!25142 0))(
  ( (Nil!25139) (Cons!25138 (h!26356 (_ BitVec 64)) (t!36445 List!25142)) )
))
(declare-fun arrayNoDuplicates!0 (array!74593 (_ BitVec 32) List!25142) Bool)

(assert (=> b!1150978 (= res!765357 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25139))))

(declare-fun mapIsEmpty!45098 () Bool)

(assert (=> mapIsEmpty!45098 mapRes!45098))

(declare-fun b!1150979 () Bool)

(declare-fun e!654753 () Unit!37774)

(declare-fun Unit!37776 () Unit!37774)

(assert (=> b!1150979 (= e!654753 Unit!37776)))

(declare-fun b!1150980 () Bool)

(declare-datatypes ((tuple2!18388 0))(
  ( (tuple2!18389 (_1!9205 (_ BitVec 64)) (_2!9205 V!43593)) )
))
(declare-datatypes ((List!25143 0))(
  ( (Nil!25140) (Cons!25139 (h!26357 tuple2!18388) (t!36446 List!25143)) )
))
(declare-datatypes ((ListLongMap!16365 0))(
  ( (ListLongMap!16366 (toList!8198 List!25143)) )
))
(declare-fun lt!514759 () ListLongMap!16365)

(declare-fun minValue!944 () V!43593)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6734 (ListLongMap!16365 (_ BitVec 64)) Bool)

(declare-fun +!3637 (ListLongMap!16365 tuple2!18388) ListLongMap!16365)

(assert (=> b!1150980 (contains!6734 (+!3637 lt!514759 (tuple2!18389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!514748 () Unit!37774)

(declare-fun call!53435 () Unit!37774)

(assert (=> b!1150980 (= lt!514748 call!53435)))

(declare-fun call!53442 () Bool)

(assert (=> b!1150980 call!53442))

(declare-fun call!53436 () ListLongMap!16365)

(assert (=> b!1150980 (= lt!514759 call!53436)))

(declare-fun zeroValue!944 () V!43593)

(declare-fun lt!514747 () Unit!37774)

(declare-fun lt!514749 () ListLongMap!16365)

(declare-fun addStillContains!861 (ListLongMap!16365 (_ BitVec 64) V!43593 (_ BitVec 64)) Unit!37774)

(assert (=> b!1150980 (= lt!514747 (addStillContains!861 lt!514749 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1150980 (= e!654764 lt!514748)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!53438 () ListLongMap!16365)

(declare-fun bm!53432 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4698 (array!74593 array!74591 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 32) Int) ListLongMap!16365)

(assert (=> bm!53432 (= call!53438 (getCurrentListMapNoExtraKeys!4698 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150981 () Bool)

(declare-fun e!654759 () Bool)

(assert (=> b!1150981 (= e!654754 e!654759)))

(declare-fun res!765363 () Bool)

(assert (=> b!1150981 (=> (not res!765363) (not e!654759))))

(declare-fun lt!514765 () array!74593)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74593 (_ BitVec 32)) Bool)

(assert (=> b!1150981 (= res!765363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514765 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150981 (= lt!514765 (array!74594 (store (arr!35941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36478 _keys!1208)))))

(declare-fun b!1150982 () Bool)

(declare-fun res!765355 () Bool)

(assert (=> b!1150982 (=> (not res!765355) (not e!654754))))

(assert (=> b!1150982 (= res!765355 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36478 _keys!1208))))))

(declare-fun b!1150983 () Bool)

(declare-fun e!654758 () Bool)

(declare-fun e!654750 () Bool)

(assert (=> b!1150983 (= e!654758 e!654750)))

(declare-fun res!765366 () Bool)

(assert (=> b!1150983 (=> res!765366 e!654750)))

(assert (=> b!1150983 (= res!765366 (not (= (select (arr!35941 _keys!1208) from!1455) k0!934)))))

(declare-fun e!654763 () Bool)

(assert (=> b!1150983 e!654763))

(declare-fun c!114128 () Bool)

(assert (=> b!1150983 (= c!114128 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514763 () Unit!37774)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!564 (array!74593 array!74591 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37774)

(assert (=> b!1150983 (= lt!514763 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!564 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150984 () Bool)

(declare-fun res!765358 () Bool)

(assert (=> b!1150984 (=> (not res!765358) (not e!654754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150984 (= res!765358 (validMask!0 mask!1564))))

(declare-fun b!1150985 () Bool)

(declare-fun res!765364 () Bool)

(assert (=> b!1150985 (=> (not res!765364) (not e!654759))))

(assert (=> b!1150985 (= res!765364 (arrayNoDuplicates!0 lt!514765 #b00000000000000000000000000000000 Nil!25139))))

(declare-fun b!1150986 () Bool)

(assert (=> b!1150986 (= e!654750 true)))

(declare-fun e!654752 () Bool)

(assert (=> b!1150986 e!654752))

(declare-fun res!765353 () Bool)

(assert (=> b!1150986 (=> (not res!765353) (not e!654752))))

(declare-fun lt!514751 () ListLongMap!16365)

(assert (=> b!1150986 (= res!765353 (= lt!514751 lt!514749))))

(declare-fun lt!514762 () ListLongMap!16365)

(declare-fun -!1320 (ListLongMap!16365 (_ BitVec 64)) ListLongMap!16365)

(assert (=> b!1150986 (= lt!514751 (-!1320 lt!514762 k0!934))))

(declare-fun lt!514760 () V!43593)

(assert (=> b!1150986 (= (-!1320 (+!3637 lt!514749 (tuple2!18389 (select (arr!35941 _keys!1208) from!1455) lt!514760)) (select (arr!35941 _keys!1208) from!1455)) lt!514749)))

(declare-fun lt!514752 () Unit!37774)

(declare-fun addThenRemoveForNewKeyIsSame!168 (ListLongMap!16365 (_ BitVec 64) V!43593) Unit!37774)

(assert (=> b!1150986 (= lt!514752 (addThenRemoveForNewKeyIsSame!168 lt!514749 (select (arr!35941 _keys!1208) from!1455) lt!514760))))

(declare-fun lt!514753 () V!43593)

(declare-fun get!18319 (ValueCell!13715 V!43593) V!43593)

(assert (=> b!1150986 (= lt!514760 (get!18319 (select (arr!35940 _values!996) from!1455) lt!514753))))

(declare-fun lt!514756 () Unit!37774)

(declare-fun e!654757 () Unit!37774)

(assert (=> b!1150986 (= lt!514756 e!654757)))

(declare-fun c!114132 () Bool)

(assert (=> b!1150986 (= c!114132 (contains!6734 lt!514749 k0!934))))

(assert (=> b!1150986 (= lt!514749 (getCurrentListMapNoExtraKeys!4698 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!514757 () array!74591)

(declare-fun b!1150987 () Bool)

(assert (=> b!1150987 (= e!654752 (= lt!514751 (getCurrentListMapNoExtraKeys!4698 lt!514765 lt!514757 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53433 () Bool)

(declare-fun call!53441 () ListLongMap!16365)

(assert (=> bm!53433 (= call!53441 (getCurrentListMapNoExtraKeys!4698 lt!514765 lt!514757 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150988 () Bool)

(declare-fun res!765356 () Bool)

(assert (=> b!1150988 (=> (not res!765356) (not e!654754))))

(assert (=> b!1150988 (= res!765356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150989 () Bool)

(declare-fun Unit!37777 () Unit!37774)

(assert (=> b!1150989 (= e!654757 Unit!37777)))

(declare-fun b!1150990 () Bool)

(declare-fun e!654755 () Bool)

(assert (=> b!1150990 (= e!654759 (not e!654755))))

(declare-fun res!765359 () Bool)

(assert (=> b!1150990 (=> res!765359 e!654755)))

(assert (=> b!1150990 (= res!765359 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150990 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514764 () Unit!37774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74593 (_ BitVec 64) (_ BitVec 32)) Unit!37774)

(assert (=> b!1150990 (= lt!514764 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1150991 () Bool)

(assert (=> b!1150991 call!53437))

(declare-fun lt!514746 () Unit!37774)

(assert (=> b!1150991 (= lt!514746 call!53439)))

(assert (=> b!1150991 (= e!654753 lt!514746)))

(declare-fun b!1150992 () Bool)

(declare-fun e!654761 () Bool)

(assert (=> b!1150992 (= e!654761 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514744) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!53434 () Bool)

(declare-fun c!114130 () Bool)

(assert (=> bm!53434 (= call!53436 (+!3637 lt!514749 (ite (or c!114130 c!114129) (tuple2!18389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1150993 () Bool)

(assert (=> b!1150993 (= e!654761 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150994 () Bool)

(assert (=> b!1150994 (= e!654763 (= call!53441 (-!1320 call!53438 k0!934)))))

(declare-fun bm!53435 () Bool)

(assert (=> bm!53435 (= call!53439 call!53435)))

(declare-fun b!1150995 () Bool)

(assert (=> b!1150995 (= e!654763 (= call!53441 call!53438))))

(declare-fun b!1150996 () Bool)

(declare-fun Unit!37778 () Unit!37774)

(assert (=> b!1150996 (= e!654757 Unit!37778)))

(assert (=> b!1150996 (= lt!514744 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150996 (= c!114130 (and (not lt!514744) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514745 () Unit!37774)

(assert (=> b!1150996 (= lt!514745 e!654764)))

(declare-fun lt!514761 () Unit!37774)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!456 (array!74593 array!74591 (_ BitVec 32) (_ BitVec 32) V!43593 V!43593 (_ BitVec 64) (_ BitVec 32) Int) Unit!37774)

(assert (=> b!1150996 (= lt!514761 (lemmaListMapContainsThenArrayContainsFrom!456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114131 () Bool)

(assert (=> b!1150996 (= c!114131 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765354 () Bool)

(assert (=> b!1150996 (= res!765354 e!654761)))

(declare-fun e!654766 () Bool)

(assert (=> b!1150996 (=> (not res!765354) (not e!654766))))

(assert (=> b!1150996 e!654766))

(declare-fun lt!514750 () Unit!37774)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74593 (_ BitVec 32) (_ BitVec 32)) Unit!37774)

(assert (=> b!1150996 (= lt!514750 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150996 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25139)))

(declare-fun lt!514754 () Unit!37774)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74593 (_ BitVec 64) (_ BitVec 32) List!25142) Unit!37774)

(assert (=> b!1150996 (= lt!514754 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25139))))

(assert (=> b!1150996 false))

(declare-fun res!765361 () Bool)

(assert (=> start!98950 (=> (not res!765361) (not e!654754))))

(assert (=> start!98950 (= res!765361 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36478 _keys!1208))))))

(assert (=> start!98950 e!654754))

(assert (=> start!98950 tp_is_empty!28849))

(declare-fun array_inv!27580 (array!74593) Bool)

(assert (=> start!98950 (array_inv!27580 _keys!1208)))

(assert (=> start!98950 true))

(assert (=> start!98950 tp!85668))

(declare-fun e!654762 () Bool)

(declare-fun array_inv!27581 (array!74591) Bool)

(assert (=> start!98950 (and (array_inv!27581 _values!996) e!654762)))

(declare-fun bm!53436 () Bool)

(assert (=> bm!53436 (= call!53435 (addStillContains!861 (ite c!114130 lt!514759 lt!514749) (ite c!114130 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114129 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114130 minValue!944 (ite c!114129 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1150997 () Bool)

(assert (=> b!1150997 (= e!654765 e!654753)))

(declare-fun c!114127 () Bool)

(assert (=> b!1150997 (= c!114127 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514744))))

(declare-fun bm!53437 () Bool)

(assert (=> bm!53437 (= call!53437 call!53442)))

(declare-fun b!1150998 () Bool)

(assert (=> b!1150998 (= e!654766 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150999 () Bool)

(declare-fun res!765360 () Bool)

(assert (=> b!1150999 (=> (not res!765360) (not e!654754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150999 (= res!765360 (validKeyInArray!0 k0!934))))

(declare-fun bm!53438 () Bool)

(declare-fun call!53440 () ListLongMap!16365)

(assert (=> bm!53438 (= call!53440 call!53436)))

(declare-fun b!1151000 () Bool)

(declare-fun res!765352 () Bool)

(assert (=> b!1151000 (=> (not res!765352) (not e!654754))))

(assert (=> b!1151000 (= res!765352 (= (select (arr!35941 _keys!1208) i!673) k0!934))))

(declare-fun b!1151001 () Bool)

(declare-fun e!654760 () Bool)

(assert (=> b!1151001 (= e!654760 tp_is_empty!28849)))

(declare-fun bm!53439 () Bool)

(assert (=> bm!53439 (= call!53442 (contains!6734 (ite c!114130 lt!514759 call!53440) k0!934))))

(declare-fun b!1151002 () Bool)

(assert (=> b!1151002 (= e!654762 (and e!654760 mapRes!45098))))

(declare-fun condMapEmpty!45098 () Bool)

(declare-fun mapDefault!45098 () ValueCell!13715)

(assert (=> b!1151002 (= condMapEmpty!45098 (= (arr!35940 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13715)) mapDefault!45098)))))

(declare-fun b!1151003 () Bool)

(declare-fun res!765365 () Bool)

(assert (=> b!1151003 (=> (not res!765365) (not e!654754))))

(assert (=> b!1151003 (= res!765365 (and (= (size!36477 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36478 _keys!1208) (size!36477 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151004 () Bool)

(assert (=> b!1151004 (= e!654755 e!654758)))

(declare-fun res!765362 () Bool)

(assert (=> b!1151004 (=> res!765362 e!654758)))

(assert (=> b!1151004 (= res!765362 (not (= from!1455 i!673)))))

(declare-fun lt!514755 () ListLongMap!16365)

(assert (=> b!1151004 (= lt!514755 (getCurrentListMapNoExtraKeys!4698 lt!514765 lt!514757 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1151004 (= lt!514757 (array!74592 (store (arr!35940 _values!996) i!673 (ValueCellFull!13715 lt!514753)) (size!36477 _values!996)))))

(declare-fun dynLambda!2721 (Int (_ BitVec 64)) V!43593)

(assert (=> b!1151004 (= lt!514753 (dynLambda!2721 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1151004 (= lt!514762 (getCurrentListMapNoExtraKeys!4698 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98950 res!765361) b!1150984))

(assert (= (and b!1150984 res!765358) b!1151003))

(assert (= (and b!1151003 res!765365) b!1150988))

(assert (= (and b!1150988 res!765356) b!1150978))

(assert (= (and b!1150978 res!765357) b!1150982))

(assert (= (and b!1150982 res!765355) b!1150999))

(assert (= (and b!1150999 res!765360) b!1151000))

(assert (= (and b!1151000 res!765352) b!1150981))

(assert (= (and b!1150981 res!765363) b!1150985))

(assert (= (and b!1150985 res!765364) b!1150990))

(assert (= (and b!1150990 (not res!765359)) b!1151004))

(assert (= (and b!1151004 (not res!765362)) b!1150983))

(assert (= (and b!1150983 c!114128) b!1150994))

(assert (= (and b!1150983 (not c!114128)) b!1150995))

(assert (= (or b!1150994 b!1150995) bm!53432))

(assert (= (or b!1150994 b!1150995) bm!53433))

(assert (= (and b!1150983 (not res!765366)) b!1150986))

(assert (= (and b!1150986 c!114132) b!1150996))

(assert (= (and b!1150986 (not c!114132)) b!1150989))

(assert (= (and b!1150996 c!114130) b!1150980))

(assert (= (and b!1150996 (not c!114130)) b!1150976))

(assert (= (and b!1150976 c!114129) b!1150975))

(assert (= (and b!1150976 (not c!114129)) b!1150997))

(assert (= (and b!1150997 c!114127) b!1150991))

(assert (= (and b!1150997 (not c!114127)) b!1150979))

(assert (= (or b!1150975 b!1150991) bm!53435))

(assert (= (or b!1150975 b!1150991) bm!53438))

(assert (= (or b!1150975 b!1150991) bm!53437))

(assert (= (or b!1150980 bm!53437) bm!53439))

(assert (= (or b!1150980 bm!53435) bm!53436))

(assert (= (or b!1150980 bm!53438) bm!53434))

(assert (= (and b!1150996 c!114131) b!1150993))

(assert (= (and b!1150996 (not c!114131)) b!1150992))

(assert (= (and b!1150996 res!765354) b!1150998))

(assert (= (and b!1150986 res!765353) b!1150987))

(assert (= (and b!1151002 condMapEmpty!45098) mapIsEmpty!45098))

(assert (= (and b!1151002 (not condMapEmpty!45098)) mapNonEmpty!45098))

(get-info :version)

(assert (= (and mapNonEmpty!45098 ((_ is ValueCellFull!13715) mapValue!45098)) b!1150977))

(assert (= (and b!1151002 ((_ is ValueCellFull!13715) mapDefault!45098)) b!1151001))

(assert (= start!98950 b!1151002))

(declare-fun b_lambda!19419 () Bool)

(assert (=> (not b_lambda!19419) (not b!1151004)))

(declare-fun t!36444 () Bool)

(declare-fun tb!9123 () Bool)

(assert (=> (and start!98950 (= defaultEntry!1004 defaultEntry!1004) t!36444) tb!9123))

(declare-fun result!18819 () Bool)

(assert (=> tb!9123 (= result!18819 tp_is_empty!28849)))

(assert (=> b!1151004 t!36444))

(declare-fun b_and!39491 () Bool)

(assert (= b_and!39489 (and (=> t!36444 result!18819) b_and!39491)))

(declare-fun m!1061593 () Bool)

(assert (=> bm!53434 m!1061593))

(declare-fun m!1061595 () Bool)

(assert (=> b!1150993 m!1061595))

(declare-fun m!1061597 () Bool)

(assert (=> b!1150990 m!1061597))

(declare-fun m!1061599 () Bool)

(assert (=> b!1150990 m!1061599))

(declare-fun m!1061601 () Bool)

(assert (=> b!1151000 m!1061601))

(declare-fun m!1061603 () Bool)

(assert (=> b!1151004 m!1061603))

(declare-fun m!1061605 () Bool)

(assert (=> b!1151004 m!1061605))

(declare-fun m!1061607 () Bool)

(assert (=> b!1151004 m!1061607))

(declare-fun m!1061609 () Bool)

(assert (=> b!1151004 m!1061609))

(declare-fun m!1061611 () Bool)

(assert (=> b!1150994 m!1061611))

(declare-fun m!1061613 () Bool)

(assert (=> bm!53432 m!1061613))

(declare-fun m!1061615 () Bool)

(assert (=> b!1150987 m!1061615))

(declare-fun m!1061617 () Bool)

(assert (=> b!1150983 m!1061617))

(declare-fun m!1061619 () Bool)

(assert (=> b!1150983 m!1061619))

(declare-fun m!1061621 () Bool)

(assert (=> b!1150999 m!1061621))

(assert (=> b!1150986 m!1061613))

(declare-fun m!1061623 () Bool)

(assert (=> b!1150986 m!1061623))

(declare-fun m!1061625 () Bool)

(assert (=> b!1150986 m!1061625))

(assert (=> b!1150986 m!1061617))

(declare-fun m!1061627 () Bool)

(assert (=> b!1150986 m!1061627))

(assert (=> b!1150986 m!1061623))

(declare-fun m!1061629 () Bool)

(assert (=> b!1150986 m!1061629))

(declare-fun m!1061631 () Bool)

(assert (=> b!1150986 m!1061631))

(assert (=> b!1150986 m!1061617))

(declare-fun m!1061633 () Bool)

(assert (=> b!1150986 m!1061633))

(assert (=> b!1150986 m!1061617))

(assert (=> b!1150986 m!1061625))

(declare-fun m!1061635 () Bool)

(assert (=> b!1150986 m!1061635))

(declare-fun m!1061637 () Bool)

(assert (=> b!1150981 m!1061637))

(declare-fun m!1061639 () Bool)

(assert (=> b!1150981 m!1061639))

(assert (=> b!1150998 m!1061595))

(declare-fun m!1061641 () Bool)

(assert (=> start!98950 m!1061641))

(declare-fun m!1061643 () Bool)

(assert (=> start!98950 m!1061643))

(declare-fun m!1061645 () Bool)

(assert (=> b!1150996 m!1061645))

(declare-fun m!1061647 () Bool)

(assert (=> b!1150996 m!1061647))

(declare-fun m!1061649 () Bool)

(assert (=> b!1150996 m!1061649))

(declare-fun m!1061651 () Bool)

(assert (=> b!1150996 m!1061651))

(declare-fun m!1061653 () Bool)

(assert (=> b!1150985 m!1061653))

(declare-fun m!1061655 () Bool)

(assert (=> b!1150984 m!1061655))

(declare-fun m!1061657 () Bool)

(assert (=> bm!53439 m!1061657))

(declare-fun m!1061659 () Bool)

(assert (=> bm!53436 m!1061659))

(declare-fun m!1061661 () Bool)

(assert (=> b!1150980 m!1061661))

(assert (=> b!1150980 m!1061661))

(declare-fun m!1061663 () Bool)

(assert (=> b!1150980 m!1061663))

(declare-fun m!1061665 () Bool)

(assert (=> b!1150980 m!1061665))

(declare-fun m!1061667 () Bool)

(assert (=> mapNonEmpty!45098 m!1061667))

(assert (=> bm!53433 m!1061615))

(declare-fun m!1061669 () Bool)

(assert (=> b!1150988 m!1061669))

(declare-fun m!1061671 () Bool)

(assert (=> b!1150978 m!1061671))

(check-sat (not b!1150980) (not b!1150981) (not b_lambda!19419) (not b!1150990) (not b!1150996) b_and!39491 (not b!1150985) (not b!1150983) tp_is_empty!28849 (not start!98950) (not bm!53432) (not b!1150994) (not b!1150978) (not b!1150986) (not b!1151004) (not bm!53433) (not bm!53436) (not b!1150988) (not mapNonEmpty!45098) (not b!1150999) (not b!1150998) (not b_next!24319) (not bm!53439) (not bm!53434) (not b!1150993) (not b!1150984) (not b!1150987))
(check-sat b_and!39491 (not b_next!24319))
