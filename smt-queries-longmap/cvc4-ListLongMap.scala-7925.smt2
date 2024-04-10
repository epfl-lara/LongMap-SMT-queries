; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98394 () Bool)

(assert start!98394)

(declare-fun b_free!23999 () Bool)

(declare-fun b_next!23999 () Bool)

(assert (=> start!98394 (= b_free!23999 (not b_next!23999))))

(declare-fun tp!84708 () Bool)

(declare-fun b_and!38847 () Bool)

(assert (=> start!98394 (= tp!84708 b_and!38847)))

(declare-fun b!1135172 () Bool)

(declare-fun e!646026 () Bool)

(declare-fun e!646012 () Bool)

(assert (=> b!1135172 (= e!646026 e!646012)))

(declare-fun res!757763 () Bool)

(assert (=> b!1135172 (=> (not res!757763) (not e!646012))))

(declare-datatypes ((array!73919 0))(
  ( (array!73920 (arr!35610 (Array (_ BitVec 32) (_ BitVec 64))) (size!36146 (_ BitVec 32))) )
))
(declare-fun lt!504613 () array!73919)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73919 (_ BitVec 32)) Bool)

(assert (=> b!1135172 (= res!757763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504613 mask!1564))))

(declare-fun _keys!1208 () array!73919)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1135172 (= lt!504613 (array!73920 (store (arr!35610 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36146 _keys!1208)))))

(declare-fun b!1135173 () Bool)

(declare-fun e!646017 () Bool)

(declare-fun e!646011 () Bool)

(assert (=> b!1135173 (= e!646017 e!646011)))

(declare-fun res!757761 () Bool)

(assert (=> b!1135173 (=> res!757761 e!646011)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1135173 (= res!757761 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43165 0))(
  ( (V!43166 (val!14321 Int)) )
))
(declare-fun zeroValue!944 () V!43165)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18072 0))(
  ( (tuple2!18073 (_1!9047 (_ BitVec 64)) (_2!9047 V!43165)) )
))
(declare-datatypes ((List!24830 0))(
  ( (Nil!24827) (Cons!24826 (h!26035 tuple2!18072) (t!35821 List!24830)) )
))
(declare-datatypes ((ListLongMap!16041 0))(
  ( (ListLongMap!16042 (toList!8036 List!24830)) )
))
(declare-fun lt!504607 () ListLongMap!16041)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43165)

(declare-datatypes ((ValueCell!13555 0))(
  ( (ValueCellFull!13555 (v!16958 V!43165)) (EmptyCell!13555) )
))
(declare-datatypes ((array!73921 0))(
  ( (array!73922 (arr!35611 (Array (_ BitVec 32) ValueCell!13555)) (size!36147 (_ BitVec 32))) )
))
(declare-fun lt!504621 () array!73921)

(declare-fun getCurrentListMapNoExtraKeys!4522 (array!73919 array!73921 (_ BitVec 32) (_ BitVec 32) V!43165 V!43165 (_ BitVec 32) Int) ListLongMap!16041)

(assert (=> b!1135173 (= lt!504607 (getCurrentListMapNoExtraKeys!4522 lt!504613 lt!504621 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73921)

(declare-fun dynLambda!2585 (Int (_ BitVec 64)) V!43165)

(assert (=> b!1135173 (= lt!504621 (array!73922 (store (arr!35611 _values!996) i!673 (ValueCellFull!13555 (dynLambda!2585 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36147 _values!996)))))

(declare-fun lt!504617 () ListLongMap!16041)

(assert (=> b!1135173 (= lt!504617 (getCurrentListMapNoExtraKeys!4522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49527 () Bool)

(declare-fun call!49530 () ListLongMap!16041)

(declare-fun call!49533 () ListLongMap!16041)

(assert (=> bm!49527 (= call!49530 call!49533)))

(declare-fun b!1135174 () Bool)

(declare-fun e!646018 () Bool)

(declare-fun e!646016 () Bool)

(assert (=> b!1135174 (= e!646018 e!646016)))

(declare-fun res!757775 () Bool)

(assert (=> b!1135174 (=> res!757775 e!646016)))

(assert (=> b!1135174 (= res!757775 (or (bvsge (size!36146 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36146 _keys!1208)) (bvsge from!1455 (size!36146 _keys!1208))))))

(declare-datatypes ((List!24831 0))(
  ( (Nil!24828) (Cons!24827 (h!26036 (_ BitVec 64)) (t!35822 List!24831)) )
))
(declare-fun arrayNoDuplicates!0 (array!73919 (_ BitVec 32) List!24831) Bool)

(assert (=> b!1135174 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24828)))

(declare-datatypes ((Unit!37189 0))(
  ( (Unit!37190) )
))
(declare-fun lt!504615 () Unit!37189)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73919 (_ BitVec 32) (_ BitVec 32)) Unit!37189)

(assert (=> b!1135174 (= lt!504615 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!646022 () Bool)

(assert (=> b!1135174 e!646022))

(declare-fun res!757769 () Bool)

(assert (=> b!1135174 (=> (not res!757769) (not e!646022))))

(declare-fun e!646019 () Bool)

(assert (=> b!1135174 (= res!757769 e!646019)))

(declare-fun c!110898 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1135174 (= c!110898 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504619 () Unit!37189)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!342 (array!73919 array!73921 (_ BitVec 32) (_ BitVec 32) V!43165 V!43165 (_ BitVec 64) (_ BitVec 32) Int) Unit!37189)

(assert (=> b!1135174 (= lt!504619 (lemmaListMapContainsThenArrayContainsFrom!342 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504618 () Unit!37189)

(declare-fun e!646024 () Unit!37189)

(assert (=> b!1135174 (= lt!504618 e!646024)))

(declare-fun c!110897 () Bool)

(declare-fun lt!504608 () Bool)

(assert (=> b!1135174 (= c!110897 (and (not lt!504608) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1135174 (= lt!504608 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!44618 () Bool)

(declare-fun mapRes!44618 () Bool)

(declare-fun tp!84707 () Bool)

(declare-fun e!646023 () Bool)

(assert (=> mapNonEmpty!44618 (= mapRes!44618 (and tp!84707 e!646023))))

(declare-fun mapRest!44618 () (Array (_ BitVec 32) ValueCell!13555))

(declare-fun mapValue!44618 () ValueCell!13555)

(declare-fun mapKey!44618 () (_ BitVec 32))

(assert (=> mapNonEmpty!44618 (= (arr!35611 _values!996) (store mapRest!44618 mapKey!44618 mapValue!44618))))

(declare-fun b!1135175 () Bool)

(declare-fun call!49532 () Bool)

(assert (=> b!1135175 call!49532))

(declare-fun lt!504612 () Unit!37189)

(declare-fun call!49531 () Unit!37189)

(assert (=> b!1135175 (= lt!504612 call!49531)))

(declare-fun e!646014 () Unit!37189)

(assert (=> b!1135175 (= e!646014 lt!504612)))

(declare-fun b!1135176 () Bool)

(declare-fun res!757760 () Bool)

(assert (=> b!1135176 (=> (not res!757760) (not e!646026))))

(assert (=> b!1135176 (= res!757760 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24828))))

(declare-fun b!1135177 () Bool)

(declare-fun e!646010 () Bool)

(declare-fun tp_is_empty!28529 () Bool)

(assert (=> b!1135177 (= e!646010 tp_is_empty!28529)))

(declare-fun b!1135178 () Bool)

(declare-fun e!646015 () Bool)

(assert (=> b!1135178 (= e!646015 e!646018)))

(declare-fun res!757773 () Bool)

(assert (=> b!1135178 (=> res!757773 e!646018)))

(declare-fun lt!504616 () ListLongMap!16041)

(declare-fun contains!6566 (ListLongMap!16041 (_ BitVec 64)) Bool)

(assert (=> b!1135178 (= res!757773 (not (contains!6566 lt!504616 k!934)))))

(assert (=> b!1135178 (= lt!504616 (getCurrentListMapNoExtraKeys!4522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!110895 () Bool)

(declare-fun bm!49528 () Bool)

(declare-fun +!3473 (ListLongMap!16041 tuple2!18072) ListLongMap!16041)

(assert (=> bm!49528 (= call!49533 (+!3473 lt!504616 (ite (or c!110897 c!110895) (tuple2!18073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18073 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1135179 () Bool)

(declare-fun res!757771 () Bool)

(assert (=> b!1135179 (=> (not res!757771) (not e!646026))))

(assert (=> b!1135179 (= res!757771 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36146 _keys!1208))))))

(declare-fun b!1135180 () Bool)

(assert (=> b!1135180 (= e!646011 e!646015)))

(declare-fun res!757767 () Bool)

(assert (=> b!1135180 (=> res!757767 e!646015)))

(assert (=> b!1135180 (= res!757767 (not (= (select (arr!35610 _keys!1208) from!1455) k!934)))))

(declare-fun e!646020 () Bool)

(assert (=> b!1135180 e!646020))

(declare-fun c!110896 () Bool)

(assert (=> b!1135180 (= c!110896 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504609 () Unit!37189)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!450 (array!73919 array!73921 (_ BitVec 32) (_ BitVec 32) V!43165 V!43165 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37189)

(assert (=> b!1135180 (= lt!504609 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!450 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1135181 () Bool)

(declare-fun e!646013 () Bool)

(assert (=> b!1135181 (= e!646013 (and e!646010 mapRes!44618))))

(declare-fun condMapEmpty!44618 () Bool)

(declare-fun mapDefault!44618 () ValueCell!13555)

