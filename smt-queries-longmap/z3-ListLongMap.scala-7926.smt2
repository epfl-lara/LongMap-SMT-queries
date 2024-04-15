; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98390 () Bool)

(assert start!98390)

(declare-fun b_free!24001 () Bool)

(declare-fun b_next!24001 () Bool)

(assert (=> start!98390 (= b_free!24001 (not b_next!24001))))

(declare-fun tp!84714 () Bool)

(declare-fun b_and!38829 () Bool)

(assert (=> start!98390 (= tp!84714 b_and!38829)))

(declare-fun bm!49528 () Bool)

(declare-datatypes ((V!43169 0))(
  ( (V!43170 (val!14322 Int)) )
))
(declare-datatypes ((tuple2!18160 0))(
  ( (tuple2!18161 (_1!9091 (_ BitVec 64)) (_2!9091 V!43169)) )
))
(declare-datatypes ((List!24906 0))(
  ( (Nil!24903) (Cons!24902 (h!26111 tuple2!18160) (t!35890 List!24906)) )
))
(declare-datatypes ((ListLongMap!16129 0))(
  ( (ListLongMap!16130 (toList!8080 List!24906)) )
))
(declare-fun call!49535 () ListLongMap!16129)

(declare-fun call!49531 () ListLongMap!16129)

(assert (=> bm!49528 (= call!49535 call!49531)))

(declare-fun b!1135143 () Bool)

(declare-fun e!645991 () Bool)

(declare-fun tp_is_empty!28531 () Bool)

(assert (=> b!1135143 (= e!645991 tp_is_empty!28531)))

(declare-fun zeroValue!944 () V!43169)

(declare-fun bm!49529 () Bool)

(declare-fun lt!504476 () ListLongMap!16129)

(declare-fun c!110885 () Bool)

(declare-fun c!110884 () Bool)

(declare-fun lt!504468 () ListLongMap!16129)

(declare-fun minValue!944 () V!43169)

(declare-fun +!3513 (ListLongMap!16129 tuple2!18160) ListLongMap!16129)

(assert (=> bm!49529 (= call!49531 (+!3513 (ite c!110884 lt!504476 lt!504468) (ite c!110884 (tuple2!18161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110885 (tuple2!18161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1135144 () Bool)

(declare-fun res!757757 () Bool)

(declare-fun e!645997 () Bool)

(assert (=> b!1135144 (=> (not res!757757) (not e!645997))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73846 0))(
  ( (array!73847 (arr!35574 (Array (_ BitVec 32) (_ BitVec 64))) (size!36112 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73846)

(assert (=> b!1135144 (= res!757757 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36112 _keys!1208))))))

(declare-fun call!49537 () ListLongMap!16129)

(declare-fun call!49536 () ListLongMap!16129)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1135145 () Bool)

(declare-fun e!645984 () Bool)

(declare-fun -!1179 (ListLongMap!16129 (_ BitVec 64)) ListLongMap!16129)

(assert (=> b!1135145 (= e!645984 (= call!49536 (-!1179 call!49537 k0!934)))))

(declare-fun b!1135146 () Bool)

(declare-fun res!757747 () Bool)

(assert (=> b!1135146 (=> (not res!757747) (not e!645997))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73846 (_ BitVec 32)) Bool)

(assert (=> b!1135146 (= res!757747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1135147 () Bool)

(declare-fun call!49538 () Bool)

(assert (=> b!1135147 call!49538))

(declare-datatypes ((Unit!37033 0))(
  ( (Unit!37034) )
))
(declare-fun lt!504472 () Unit!37033)

(declare-fun call!49533 () Unit!37033)

(assert (=> b!1135147 (= lt!504472 call!49533)))

(declare-fun e!645985 () Unit!37033)

(assert (=> b!1135147 (= e!645985 lt!504472)))

(declare-fun b!1135148 () Bool)

(declare-fun e!645988 () Unit!37033)

(declare-fun Unit!37035 () Unit!37033)

(assert (=> b!1135148 (= e!645988 Unit!37035)))

(declare-fun b!1135149 () Bool)

(declare-fun e!645987 () Bool)

(declare-fun e!645989 () Bool)

(assert (=> b!1135149 (= e!645987 e!645989)))

(declare-fun res!757759 () Bool)

(assert (=> b!1135149 (=> res!757759 e!645989)))

(declare-fun contains!6544 (ListLongMap!16129 (_ BitVec 64)) Bool)

(assert (=> b!1135149 (= res!757759 (not (contains!6544 lt!504468 k0!934)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13556 0))(
  ( (ValueCellFull!13556 (v!16958 V!43169)) (EmptyCell!13556) )
))
(declare-datatypes ((array!73848 0))(
  ( (array!73849 (arr!35575 (Array (_ BitVec 32) ValueCell!13556)) (size!36113 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73848)

(declare-fun getCurrentListMapNoExtraKeys!4578 (array!73846 array!73848 (_ BitVec 32) (_ BitVec 32) V!43169 V!43169 (_ BitVec 32) Int) ListLongMap!16129)

(assert (=> b!1135149 (= lt!504468 (getCurrentListMapNoExtraKeys!4578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135150 () Bool)

(declare-fun res!757754 () Bool)

(assert (=> b!1135150 (=> (not res!757754) (not e!645997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1135150 (= res!757754 (validKeyInArray!0 k0!934))))

(declare-fun b!1135152 () Bool)

(declare-fun e!645992 () Bool)

(declare-fun lt!504473 () Bool)

(assert (=> b!1135152 (= e!645992 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504473) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!49530 () Bool)

(declare-fun call!49532 () Unit!37033)

(declare-fun addStillContains!730 (ListLongMap!16129 (_ BitVec 64) V!43169 (_ BitVec 64)) Unit!37033)

(assert (=> bm!49530 (= call!49532 (addStillContains!730 (ite c!110884 lt!504476 lt!504468) (ite c!110884 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110885 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110884 minValue!944 (ite c!110885 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1135153 () Bool)

(declare-fun arrayContainsKey!0 (array!73846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1135153 (= e!645992 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1135154 () Bool)

(declare-fun e!645983 () Bool)

(declare-fun e!645999 () Bool)

(assert (=> b!1135154 (= e!645983 (not e!645999))))

(declare-fun res!757749 () Bool)

(assert (=> b!1135154 (=> res!757749 e!645999)))

(assert (=> b!1135154 (= res!757749 (bvsgt from!1455 i!673))))

(assert (=> b!1135154 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504466 () Unit!37033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73846 (_ BitVec 64) (_ BitVec 32)) Unit!37033)

(assert (=> b!1135154 (= lt!504466 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1135155 () Bool)

(declare-fun e!645998 () Bool)

(assert (=> b!1135155 (= e!645998 true)))

(declare-fun lt!504470 () Bool)

(declare-datatypes ((List!24907 0))(
  ( (Nil!24904) (Cons!24903 (h!26112 (_ BitVec 64)) (t!35891 List!24907)) )
))
(declare-fun contains!6545 (List!24907 (_ BitVec 64)) Bool)

(assert (=> b!1135155 (= lt!504470 (contains!6545 Nil!24904 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49531 () Bool)

(assert (=> bm!49531 (= call!49537 (getCurrentListMapNoExtraKeys!4578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135156 () Bool)

(assert (=> b!1135156 (= e!645989 e!645998)))

(declare-fun res!757760 () Bool)

(assert (=> b!1135156 (=> res!757760 e!645998)))

(assert (=> b!1135156 (= res!757760 (or (bvsge (size!36112 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36112 _keys!1208)) (bvsge from!1455 (size!36112 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!73846 (_ BitVec 32) List!24907) Bool)

(assert (=> b!1135156 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24904)))

(declare-fun lt!504478 () Unit!37033)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73846 (_ BitVec 32) (_ BitVec 32)) Unit!37033)

(assert (=> b!1135156 (= lt!504478 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!645994 () Bool)

(assert (=> b!1135156 e!645994))

(declare-fun res!757758 () Bool)

(assert (=> b!1135156 (=> (not res!757758) (not e!645994))))

(assert (=> b!1135156 (= res!757758 e!645992)))

(declare-fun c!110887 () Bool)

(assert (=> b!1135156 (= c!110887 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504475 () Unit!37033)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!343 (array!73846 array!73848 (_ BitVec 32) (_ BitVec 32) V!43169 V!43169 (_ BitVec 64) (_ BitVec 32) Int) Unit!37033)

(assert (=> b!1135156 (= lt!504475 (lemmaListMapContainsThenArrayContainsFrom!343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504469 () Unit!37033)

(declare-fun e!645996 () Unit!37033)

(assert (=> b!1135156 (= lt!504469 e!645996)))

(assert (=> b!1135156 (= c!110884 (and (not lt!504473) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135156 (= lt!504473 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!504479 () array!73848)

(declare-fun lt!504465 () array!73846)

(declare-fun bm!49532 () Bool)

(assert (=> bm!49532 (= call!49536 (getCurrentListMapNoExtraKeys!4578 lt!504465 lt!504479 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135157 () Bool)

(declare-fun e!645990 () Bool)

(declare-fun mapRes!44621 () Bool)

(assert (=> b!1135157 (= e!645990 (and e!645991 mapRes!44621))))

(declare-fun condMapEmpty!44621 () Bool)

(declare-fun mapDefault!44621 () ValueCell!13556)

(assert (=> b!1135157 (= condMapEmpty!44621 (= (arr!35575 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13556)) mapDefault!44621)))))

(declare-fun b!1135158 () Bool)

(declare-fun res!757752 () Bool)

(assert (=> b!1135158 (=> (not res!757752) (not e!645997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1135158 (= res!757752 (validMask!0 mask!1564))))

(declare-fun b!1135159 () Bool)

(declare-fun e!645995 () Bool)

(assert (=> b!1135159 (= e!645999 e!645995)))

(declare-fun res!757750 () Bool)

(assert (=> b!1135159 (=> res!757750 e!645995)))

(assert (=> b!1135159 (= res!757750 (not (= from!1455 i!673)))))

(declare-fun lt!504471 () ListLongMap!16129)

(assert (=> b!1135159 (= lt!504471 (getCurrentListMapNoExtraKeys!4578 lt!504465 lt!504479 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2572 (Int (_ BitVec 64)) V!43169)

(assert (=> b!1135159 (= lt!504479 (array!73849 (store (arr!35575 _values!996) i!673 (ValueCellFull!13556 (dynLambda!2572 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36113 _values!996)))))

(declare-fun lt!504474 () ListLongMap!16129)

(assert (=> b!1135159 (= lt!504474 (getCurrentListMapNoExtraKeys!4578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1135160 () Bool)

(declare-fun res!757762 () Bool)

(assert (=> b!1135160 (=> res!757762 e!645998)))

(assert (=> b!1135160 (= res!757762 (contains!6545 Nil!24904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1135161 () Bool)

(declare-fun res!757748 () Bool)

(assert (=> b!1135161 (=> (not res!757748) (not e!645997))))

(assert (=> b!1135161 (= res!757748 (and (= (size!36113 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36112 _keys!1208) (size!36113 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1135162 () Bool)

(declare-fun res!757746 () Bool)

(assert (=> b!1135162 (=> (not res!757746) (not e!645997))))

(assert (=> b!1135162 (= res!757746 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24904))))

(declare-fun b!1135163 () Bool)

(assert (=> b!1135163 (= e!645996 e!645985)))

(assert (=> b!1135163 (= c!110885 (and (not lt!504473) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44621 () Bool)

(declare-fun tp!84713 () Bool)

(declare-fun e!645986 () Bool)

(assert (=> mapNonEmpty!44621 (= mapRes!44621 (and tp!84713 e!645986))))

(declare-fun mapRest!44621 () (Array (_ BitVec 32) ValueCell!13556))

(declare-fun mapValue!44621 () ValueCell!13556)

(declare-fun mapKey!44621 () (_ BitVec 32))

(assert (=> mapNonEmpty!44621 (= (arr!35575 _values!996) (store mapRest!44621 mapKey!44621 mapValue!44621))))

(declare-fun b!1135164 () Bool)

(assert (=> b!1135164 (= e!645986 tp_is_empty!28531)))

(declare-fun bm!49533 () Bool)

(declare-fun call!49534 () Bool)

(assert (=> bm!49533 (= call!49534 (contains!6544 (ite c!110884 lt!504476 call!49535) k0!934))))

(declare-fun b!1135165 () Bool)

(declare-fun lt!504464 () Unit!37033)

(assert (=> b!1135165 (= e!645996 lt!504464)))

(declare-fun lt!504477 () Unit!37033)

(assert (=> b!1135165 (= lt!504477 (addStillContains!730 lt!504468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1135165 (= lt!504476 (+!3513 lt!504468 (tuple2!18161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1135165 call!49534))

(assert (=> b!1135165 (= lt!504464 call!49532)))

(assert (=> b!1135165 (contains!6544 call!49531 k0!934)))

(declare-fun b!1135166 () Bool)

(assert (=> b!1135166 (= e!645984 (= call!49536 call!49537))))

(declare-fun bm!49534 () Bool)

(assert (=> bm!49534 (= call!49533 call!49532)))

(declare-fun mapIsEmpty!44621 () Bool)

(assert (=> mapIsEmpty!44621 mapRes!44621))

(declare-fun b!1135167 () Bool)

(declare-fun c!110888 () Bool)

(assert (=> b!1135167 (= c!110888 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504473))))

(assert (=> b!1135167 (= e!645985 e!645988)))

(declare-fun b!1135168 () Bool)

(assert (=> b!1135168 (= e!645994 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49535 () Bool)

(assert (=> bm!49535 (= call!49538 call!49534)))

(declare-fun b!1135169 () Bool)

(declare-fun lt!504467 () Unit!37033)

(assert (=> b!1135169 (= e!645988 lt!504467)))

(assert (=> b!1135169 (= lt!504467 call!49533)))

(assert (=> b!1135169 call!49538))

(declare-fun b!1135170 () Bool)

(assert (=> b!1135170 (= e!645995 e!645987)))

(declare-fun res!757763 () Bool)

(assert (=> b!1135170 (=> res!757763 e!645987)))

(assert (=> b!1135170 (= res!757763 (not (= (select (arr!35574 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1135170 e!645984))

(declare-fun c!110886 () Bool)

(assert (=> b!1135170 (= c!110886 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504480 () Unit!37033)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!462 (array!73846 array!73848 (_ BitVec 32) (_ BitVec 32) V!43169 V!43169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37033)

(assert (=> b!1135170 (= lt!504480 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135171 () Bool)

(declare-fun res!757751 () Bool)

(assert (=> b!1135171 (=> (not res!757751) (not e!645983))))

(assert (=> b!1135171 (= res!757751 (arrayNoDuplicates!0 lt!504465 #b00000000000000000000000000000000 Nil!24904))))

(declare-fun b!1135172 () Bool)

(declare-fun res!757753 () Bool)

(assert (=> b!1135172 (=> (not res!757753) (not e!645997))))

(assert (=> b!1135172 (= res!757753 (= (select (arr!35574 _keys!1208) i!673) k0!934))))

(declare-fun b!1135173 () Bool)

(declare-fun res!757755 () Bool)

(assert (=> b!1135173 (=> res!757755 e!645998)))

(declare-fun noDuplicate!1609 (List!24907) Bool)

(assert (=> b!1135173 (= res!757755 (not (noDuplicate!1609 Nil!24904)))))

(declare-fun b!1135151 () Bool)

(assert (=> b!1135151 (= e!645997 e!645983)))

(declare-fun res!757761 () Bool)

(assert (=> b!1135151 (=> (not res!757761) (not e!645983))))

(assert (=> b!1135151 (= res!757761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504465 mask!1564))))

(assert (=> b!1135151 (= lt!504465 (array!73847 (store (arr!35574 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36112 _keys!1208)))))

(declare-fun res!757756 () Bool)

(assert (=> start!98390 (=> (not res!757756) (not e!645997))))

(assert (=> start!98390 (= res!757756 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36112 _keys!1208))))))

(assert (=> start!98390 e!645997))

(assert (=> start!98390 tp_is_empty!28531))

(declare-fun array_inv!27352 (array!73846) Bool)

(assert (=> start!98390 (array_inv!27352 _keys!1208)))

(assert (=> start!98390 true))

(assert (=> start!98390 tp!84714))

(declare-fun array_inv!27353 (array!73848) Bool)

(assert (=> start!98390 (and (array_inv!27353 _values!996) e!645990)))

(assert (= (and start!98390 res!757756) b!1135158))

(assert (= (and b!1135158 res!757752) b!1135161))

(assert (= (and b!1135161 res!757748) b!1135146))

(assert (= (and b!1135146 res!757747) b!1135162))

(assert (= (and b!1135162 res!757746) b!1135144))

(assert (= (and b!1135144 res!757757) b!1135150))

(assert (= (and b!1135150 res!757754) b!1135172))

(assert (= (and b!1135172 res!757753) b!1135151))

(assert (= (and b!1135151 res!757761) b!1135171))

(assert (= (and b!1135171 res!757751) b!1135154))

(assert (= (and b!1135154 (not res!757749)) b!1135159))

(assert (= (and b!1135159 (not res!757750)) b!1135170))

(assert (= (and b!1135170 c!110886) b!1135145))

(assert (= (and b!1135170 (not c!110886)) b!1135166))

(assert (= (or b!1135145 b!1135166) bm!49531))

(assert (= (or b!1135145 b!1135166) bm!49532))

(assert (= (and b!1135170 (not res!757763)) b!1135149))

(assert (= (and b!1135149 (not res!757759)) b!1135156))

(assert (= (and b!1135156 c!110884) b!1135165))

(assert (= (and b!1135156 (not c!110884)) b!1135163))

(assert (= (and b!1135163 c!110885) b!1135147))

(assert (= (and b!1135163 (not c!110885)) b!1135167))

(assert (= (and b!1135167 c!110888) b!1135169))

(assert (= (and b!1135167 (not c!110888)) b!1135148))

(assert (= (or b!1135147 b!1135169) bm!49534))

(assert (= (or b!1135147 b!1135169) bm!49528))

(assert (= (or b!1135147 b!1135169) bm!49535))

(assert (= (or b!1135165 bm!49535) bm!49533))

(assert (= (or b!1135165 bm!49534) bm!49530))

(assert (= (or b!1135165 bm!49528) bm!49529))

(assert (= (and b!1135156 c!110887) b!1135153))

(assert (= (and b!1135156 (not c!110887)) b!1135152))

(assert (= (and b!1135156 res!757758) b!1135168))

(assert (= (and b!1135156 (not res!757760)) b!1135173))

(assert (= (and b!1135173 (not res!757755)) b!1135160))

(assert (= (and b!1135160 (not res!757762)) b!1135155))

(assert (= (and b!1135157 condMapEmpty!44621) mapIsEmpty!44621))

(assert (= (and b!1135157 (not condMapEmpty!44621)) mapNonEmpty!44621))

(get-info :version)

(assert (= (and mapNonEmpty!44621 ((_ is ValueCellFull!13556) mapValue!44621)) b!1135164))

(assert (= (and b!1135157 ((_ is ValueCellFull!13556) mapDefault!44621)) b!1135143))

(assert (= start!98390 b!1135157))

(declare-fun b_lambda!19089 () Bool)

(assert (=> (not b_lambda!19089) (not b!1135159)))

(declare-fun t!35889 () Bool)

(declare-fun tb!8805 () Bool)

(assert (=> (and start!98390 (= defaultEntry!1004 defaultEntry!1004) t!35889) tb!8805))

(declare-fun result!18183 () Bool)

(assert (=> tb!8805 (= result!18183 tp_is_empty!28531)))

(assert (=> b!1135159 t!35889))

(declare-fun b_and!38831 () Bool)

(assert (= b_and!38829 (and (=> t!35889 result!18183) b_and!38831)))

(declare-fun m!1047271 () Bool)

(assert (=> b!1135149 m!1047271))

(declare-fun m!1047273 () Bool)

(assert (=> b!1135149 m!1047273))

(declare-fun m!1047275 () Bool)

(assert (=> b!1135145 m!1047275))

(declare-fun m!1047277 () Bool)

(assert (=> mapNonEmpty!44621 m!1047277))

(declare-fun m!1047279 () Bool)

(assert (=> start!98390 m!1047279))

(declare-fun m!1047281 () Bool)

(assert (=> start!98390 m!1047281))

(declare-fun m!1047283 () Bool)

(assert (=> bm!49533 m!1047283))

(declare-fun m!1047285 () Bool)

(assert (=> b!1135146 m!1047285))

(declare-fun m!1047287 () Bool)

(assert (=> b!1135172 m!1047287))

(declare-fun m!1047289 () Bool)

(assert (=> bm!49529 m!1047289))

(declare-fun m!1047291 () Bool)

(assert (=> b!1135170 m!1047291))

(declare-fun m!1047293 () Bool)

(assert (=> b!1135170 m!1047293))

(declare-fun m!1047295 () Bool)

(assert (=> b!1135159 m!1047295))

(declare-fun m!1047297 () Bool)

(assert (=> b!1135159 m!1047297))

(declare-fun m!1047299 () Bool)

(assert (=> b!1135159 m!1047299))

(declare-fun m!1047301 () Bool)

(assert (=> b!1135159 m!1047301))

(declare-fun m!1047303 () Bool)

(assert (=> b!1135154 m!1047303))

(declare-fun m!1047305 () Bool)

(assert (=> b!1135154 m!1047305))

(declare-fun m!1047307 () Bool)

(assert (=> b!1135160 m!1047307))

(declare-fun m!1047309 () Bool)

(assert (=> b!1135168 m!1047309))

(declare-fun m!1047311 () Bool)

(assert (=> b!1135150 m!1047311))

(declare-fun m!1047313 () Bool)

(assert (=> b!1135155 m!1047313))

(declare-fun m!1047315 () Bool)

(assert (=> bm!49530 m!1047315))

(declare-fun m!1047317 () Bool)

(assert (=> b!1135156 m!1047317))

(declare-fun m!1047319 () Bool)

(assert (=> b!1135156 m!1047319))

(declare-fun m!1047321 () Bool)

(assert (=> b!1135156 m!1047321))

(assert (=> bm!49531 m!1047273))

(declare-fun m!1047323 () Bool)

(assert (=> b!1135165 m!1047323))

(declare-fun m!1047325 () Bool)

(assert (=> b!1135165 m!1047325))

(declare-fun m!1047327 () Bool)

(assert (=> b!1135165 m!1047327))

(declare-fun m!1047329 () Bool)

(assert (=> b!1135151 m!1047329))

(declare-fun m!1047331 () Bool)

(assert (=> b!1135151 m!1047331))

(declare-fun m!1047333 () Bool)

(assert (=> b!1135171 m!1047333))

(declare-fun m!1047335 () Bool)

(assert (=> b!1135162 m!1047335))

(declare-fun m!1047337 () Bool)

(assert (=> bm!49532 m!1047337))

(declare-fun m!1047339 () Bool)

(assert (=> b!1135158 m!1047339))

(declare-fun m!1047341 () Bool)

(assert (=> b!1135173 m!1047341))

(assert (=> b!1135153 m!1047309))

(check-sat (not b!1135170) (not start!98390) (not bm!49532) (not bm!49531) (not b!1135156) (not b!1135173) (not b!1135146) (not b!1135145) (not b!1135154) (not b_next!24001) (not b!1135159) (not b!1135162) (not b!1135165) (not bm!49533) (not bm!49529) (not b!1135155) (not b!1135160) (not b!1135151) b_and!38831 (not bm!49530) (not b!1135149) tp_is_empty!28531 (not b_lambda!19089) (not b!1135158) (not b!1135168) (not b!1135150) (not mapNonEmpty!44621) (not b!1135171) (not b!1135153))
(check-sat b_and!38831 (not b_next!24001))
