; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98500 () Bool)

(assert start!98500)

(declare-fun b_free!24105 () Bool)

(declare-fun b_next!24105 () Bool)

(assert (=> start!98500 (= b_free!24105 (not b_next!24105))))

(declare-fun tp!85025 () Bool)

(declare-fun b_and!39059 () Bool)

(assert (=> start!98500 (= tp!85025 b_and!39059)))

(declare-fun b!1139981 () Bool)

(declare-fun e!648611 () Bool)

(declare-fun e!648606 () Bool)

(assert (=> b!1139981 (= e!648611 (not e!648606))))

(declare-fun res!760178 () Bool)

(assert (=> b!1139981 (=> res!760178 e!648606)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139981 (= res!760178 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!74129 0))(
  ( (array!74130 (arr!35715 (Array (_ BitVec 32) (_ BitVec 64))) (size!36251 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74129)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139981 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37373 0))(
  ( (Unit!37374) )
))
(declare-fun lt!507501 () Unit!37373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74129 (_ BitVec 64) (_ BitVec 32)) Unit!37373)

(assert (=> b!1139981 (= lt!507501 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139982 () Bool)

(declare-fun e!648614 () Bool)

(assert (=> b!1139982 (= e!648614 true)))

(declare-datatypes ((V!43307 0))(
  ( (V!43308 (val!14374 Int)) )
))
(declare-fun lt!507503 () V!43307)

(declare-datatypes ((tuple2!18174 0))(
  ( (tuple2!18175 (_1!9098 (_ BitVec 64)) (_2!9098 V!43307)) )
))
(declare-datatypes ((List!24929 0))(
  ( (Nil!24926) (Cons!24925 (h!26134 tuple2!18174) (t!36026 List!24929)) )
))
(declare-datatypes ((ListLongMap!16143 0))(
  ( (ListLongMap!16144 (toList!8087 List!24929)) )
))
(declare-fun lt!507507 () ListLongMap!16143)

(declare-fun -!1237 (ListLongMap!16143 (_ BitVec 64)) ListLongMap!16143)

(declare-fun +!3519 (ListLongMap!16143 tuple2!18174) ListLongMap!16143)

(assert (=> b!1139982 (= (-!1237 (+!3519 lt!507507 (tuple2!18175 (select (arr!35715 _keys!1208) from!1455) lt!507503)) (select (arr!35715 _keys!1208) from!1455)) lt!507507)))

(declare-fun lt!507508 () Unit!37373)

(declare-fun addThenRemoveForNewKeyIsSame!92 (ListLongMap!16143 (_ BitVec 64) V!43307) Unit!37373)

(assert (=> b!1139982 (= lt!507508 (addThenRemoveForNewKeyIsSame!92 lt!507507 (select (arr!35715 _keys!1208) from!1455) lt!507503))))

(declare-fun lt!507509 () V!43307)

(declare-datatypes ((ValueCell!13608 0))(
  ( (ValueCellFull!13608 (v!17011 V!43307)) (EmptyCell!13608) )
))
(declare-datatypes ((array!74131 0))(
  ( (array!74132 (arr!35716 (Array (_ BitVec 32) ValueCell!13608)) (size!36252 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74131)

(declare-fun get!18140 (ValueCell!13608 V!43307) V!43307)

(assert (=> b!1139982 (= lt!507503 (get!18140 (select (arr!35716 _values!996) from!1455) lt!507509))))

(declare-fun lt!507516 () Unit!37373)

(declare-fun e!648610 () Unit!37373)

(assert (=> b!1139982 (= lt!507516 e!648610)))

(declare-fun c!111804 () Bool)

(declare-fun contains!6622 (ListLongMap!16143 (_ BitVec 64)) Bool)

(assert (=> b!1139982 (= c!111804 (contains!6622 lt!507507 k0!934))))

(declare-fun zeroValue!944 () V!43307)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43307)

(declare-fun getCurrentListMapNoExtraKeys!4569 (array!74129 array!74131 (_ BitVec 32) (_ BitVec 32) V!43307 V!43307 (_ BitVec 32) Int) ListLongMap!16143)

(assert (=> b!1139982 (= lt!507507 (getCurrentListMapNoExtraKeys!4569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139983 () Bool)

(declare-fun e!648603 () Bool)

(declare-fun tp_is_empty!28635 () Bool)

(assert (=> b!1139983 (= e!648603 tp_is_empty!28635)))

(declare-fun mapIsEmpty!44777 () Bool)

(declare-fun mapRes!44777 () Bool)

(assert (=> mapIsEmpty!44777 mapRes!44777))

(declare-fun b!1139984 () Bool)

(declare-fun Unit!37375 () Unit!37373)

(assert (=> b!1139984 (= e!648610 Unit!37375)))

(declare-fun lt!507513 () Bool)

(assert (=> b!1139984 (= lt!507513 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111807 () Bool)

(assert (=> b!1139984 (= c!111807 (and (not lt!507513) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507510 () Unit!37373)

(declare-fun e!648602 () Unit!37373)

(assert (=> b!1139984 (= lt!507510 e!648602)))

(declare-fun lt!507499 () Unit!37373)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!377 (array!74129 array!74131 (_ BitVec 32) (_ BitVec 32) V!43307 V!43307 (_ BitVec 64) (_ BitVec 32) Int) Unit!37373)

(assert (=> b!1139984 (= lt!507499 (lemmaListMapContainsThenArrayContainsFrom!377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111806 () Bool)

(assert (=> b!1139984 (= c!111806 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760169 () Bool)

(declare-fun e!648601 () Bool)

(assert (=> b!1139984 (= res!760169 e!648601)))

(declare-fun e!648605 () Bool)

(assert (=> b!1139984 (=> (not res!760169) (not e!648605))))

(assert (=> b!1139984 e!648605))

(declare-fun lt!507519 () Unit!37373)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74129 (_ BitVec 32) (_ BitVec 32)) Unit!37373)

(assert (=> b!1139984 (= lt!507519 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24930 0))(
  ( (Nil!24927) (Cons!24926 (h!26135 (_ BitVec 64)) (t!36027 List!24930)) )
))
(declare-fun arrayNoDuplicates!0 (array!74129 (_ BitVec 32) List!24930) Bool)

(assert (=> b!1139984 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24927)))

(declare-fun lt!507512 () Unit!37373)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74129 (_ BitVec 64) (_ BitVec 32) List!24930) Unit!37373)

(assert (=> b!1139984 (= lt!507512 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24927))))

(assert (=> b!1139984 false))

(declare-fun bm!50799 () Bool)

(declare-fun call!50803 () Unit!37373)

(declare-fun call!50804 () Unit!37373)

(assert (=> bm!50799 (= call!50803 call!50804)))

(declare-fun b!1139985 () Bool)

(declare-fun res!760174 () Bool)

(declare-fun e!648607 () Bool)

(assert (=> b!1139985 (=> (not res!760174) (not e!648607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74129 (_ BitVec 32)) Bool)

(assert (=> b!1139985 (= res!760174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50800 () Bool)

(declare-fun c!111808 () Bool)

(declare-fun addStillContains!777 (ListLongMap!16143 (_ BitVec 64) V!43307 (_ BitVec 64)) Unit!37373)

(assert (=> bm!50800 (= call!50804 (addStillContains!777 lt!507507 (ite (or c!111807 c!111808) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111807 c!111808) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1139986 () Bool)

(assert (=> b!1139986 (= e!648601 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139988 () Bool)

(declare-fun res!760179 () Bool)

(assert (=> b!1139988 (=> (not res!760179) (not e!648607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139988 (= res!760179 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44777 () Bool)

(declare-fun tp!85026 () Bool)

(declare-fun e!648608 () Bool)

(assert (=> mapNonEmpty!44777 (= mapRes!44777 (and tp!85026 e!648608))))

(declare-fun mapRest!44777 () (Array (_ BitVec 32) ValueCell!13608))

(declare-fun mapKey!44777 () (_ BitVec 32))

(declare-fun mapValue!44777 () ValueCell!13608)

(assert (=> mapNonEmpty!44777 (= (arr!35716 _values!996) (store mapRest!44777 mapKey!44777 mapValue!44777))))

(declare-fun b!1139989 () Bool)

(declare-fun e!648615 () Unit!37373)

(declare-fun e!648609 () Unit!37373)

(assert (=> b!1139989 (= e!648615 e!648609)))

(declare-fun c!111805 () Bool)

(assert (=> b!1139989 (= c!111805 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507513))))

(declare-fun b!1139990 () Bool)

(declare-fun Unit!37376 () Unit!37373)

(assert (=> b!1139990 (= e!648609 Unit!37376)))

(declare-fun bm!50801 () Bool)

(declare-fun call!50805 () ListLongMap!16143)

(declare-fun call!50802 () ListLongMap!16143)

(assert (=> bm!50801 (= call!50805 call!50802)))

(declare-fun b!1139991 () Bool)

(declare-fun e!648613 () Bool)

(assert (=> b!1139991 (= e!648613 e!648614)))

(declare-fun res!760175 () Bool)

(assert (=> b!1139991 (=> res!760175 e!648614)))

(assert (=> b!1139991 (= res!760175 (not (= (select (arr!35715 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648604 () Bool)

(assert (=> b!1139991 e!648604))

(declare-fun c!111803 () Bool)

(assert (=> b!1139991 (= c!111803 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507500 () Unit!37373)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!484 (array!74129 array!74131 (_ BitVec 32) (_ BitVec 32) V!43307 V!43307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37373)

(assert (=> b!1139991 (= lt!507500 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!484 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139992 () Bool)

(assert (=> b!1139992 (= e!648606 e!648613)))

(declare-fun res!760173 () Bool)

(assert (=> b!1139992 (=> res!760173 e!648613)))

(assert (=> b!1139992 (= res!760173 (not (= from!1455 i!673)))))

(declare-fun lt!507505 () ListLongMap!16143)

(declare-fun lt!507511 () array!74129)

(declare-fun lt!507515 () array!74131)

(assert (=> b!1139992 (= lt!507505 (getCurrentListMapNoExtraKeys!4569 lt!507511 lt!507515 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1139992 (= lt!507515 (array!74132 (store (arr!35716 _values!996) i!673 (ValueCellFull!13608 lt!507509)) (size!36252 _values!996)))))

(declare-fun dynLambda!2618 (Int (_ BitVec 64)) V!43307)

(assert (=> b!1139992 (= lt!507509 (dynLambda!2618 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507517 () ListLongMap!16143)

(assert (=> b!1139992 (= lt!507517 (getCurrentListMapNoExtraKeys!4569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139993 () Bool)

(declare-fun call!50808 () ListLongMap!16143)

(declare-fun call!50809 () ListLongMap!16143)

(assert (=> b!1139993 (= e!648604 (= call!50808 call!50809))))

(declare-fun b!1139994 () Bool)

(assert (=> b!1139994 (= e!648604 (= call!50808 (-!1237 call!50809 k0!934)))))

(declare-fun b!1139995 () Bool)

(declare-fun Unit!37377 () Unit!37373)

(assert (=> b!1139995 (= e!648610 Unit!37377)))

(declare-fun b!1139996 () Bool)

(assert (=> b!1139996 (= e!648605 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139997 () Bool)

(declare-fun res!760181 () Bool)

(assert (=> b!1139997 (=> (not res!760181) (not e!648607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139997 (= res!760181 (validKeyInArray!0 k0!934))))

(declare-fun b!1139998 () Bool)

(declare-fun lt!507502 () Unit!37373)

(assert (=> b!1139998 (= e!648615 lt!507502)))

(assert (=> b!1139998 (= lt!507502 call!50803)))

(declare-fun call!50806 () Bool)

(assert (=> b!1139998 call!50806))

(declare-fun b!1139999 () Bool)

(declare-fun res!760171 () Bool)

(assert (=> b!1139999 (=> (not res!760171) (not e!648607))))

(assert (=> b!1139999 (= res!760171 (= (select (arr!35715 _keys!1208) i!673) k0!934))))

(declare-fun bm!50802 () Bool)

(declare-fun lt!507518 () ListLongMap!16143)

(declare-fun call!50807 () Bool)

(assert (=> bm!50802 (= call!50807 (contains!6622 (ite c!111807 lt!507518 call!50805) k0!934))))

(declare-fun bm!50803 () Bool)

(assert (=> bm!50803 (= call!50806 call!50807)))

(declare-fun bm!50804 () Bool)

(assert (=> bm!50804 (= call!50808 (getCurrentListMapNoExtraKeys!4569 lt!507511 lt!507515 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140000 () Bool)

(assert (=> b!1140000 (contains!6622 call!50802 k0!934)))

(declare-fun lt!507506 () Unit!37373)

(assert (=> b!1140000 (= lt!507506 (addStillContains!777 lt!507518 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1140000 call!50807))

(assert (=> b!1140000 (= lt!507518 (+!3519 lt!507507 (tuple2!18175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507504 () Unit!37373)

(assert (=> b!1140000 (= lt!507504 call!50804)))

(assert (=> b!1140000 (= e!648602 lt!507506)))

(declare-fun b!1140001 () Bool)

(declare-fun e!648600 () Bool)

(assert (=> b!1140001 (= e!648600 (and e!648603 mapRes!44777))))

(declare-fun condMapEmpty!44777 () Bool)

(declare-fun mapDefault!44777 () ValueCell!13608)

(assert (=> b!1140001 (= condMapEmpty!44777 (= (arr!35716 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13608)) mapDefault!44777)))))

(declare-fun b!1140002 () Bool)

(declare-fun res!760176 () Bool)

(assert (=> b!1140002 (=> (not res!760176) (not e!648607))))

(assert (=> b!1140002 (= res!760176 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36251 _keys!1208))))))

(declare-fun b!1140003 () Bool)

(declare-fun res!760172 () Bool)

(assert (=> b!1140003 (=> (not res!760172) (not e!648611))))

(assert (=> b!1140003 (= res!760172 (arrayNoDuplicates!0 lt!507511 #b00000000000000000000000000000000 Nil!24927))))

(declare-fun b!1140004 () Bool)

(declare-fun res!760170 () Bool)

(assert (=> b!1140004 (=> (not res!760170) (not e!648607))))

(assert (=> b!1140004 (= res!760170 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24927))))

(declare-fun bm!50805 () Bool)

(assert (=> bm!50805 (= call!50809 (getCurrentListMapNoExtraKeys!4569 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140005 () Bool)

(assert (=> b!1140005 (= e!648608 tp_is_empty!28635)))

(declare-fun b!1140006 () Bool)

(assert (=> b!1140006 (= e!648601 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507513) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!760168 () Bool)

(assert (=> start!98500 (=> (not res!760168) (not e!648607))))

(assert (=> start!98500 (= res!760168 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36251 _keys!1208))))))

(assert (=> start!98500 e!648607))

(assert (=> start!98500 tp_is_empty!28635))

(declare-fun array_inv!27376 (array!74129) Bool)

(assert (=> start!98500 (array_inv!27376 _keys!1208)))

(assert (=> start!98500 true))

(assert (=> start!98500 tp!85025))

(declare-fun array_inv!27377 (array!74131) Bool)

(assert (=> start!98500 (and (array_inv!27377 _values!996) e!648600)))

(declare-fun b!1139987 () Bool)

(assert (=> b!1139987 call!50806))

(declare-fun lt!507514 () Unit!37373)

(assert (=> b!1139987 (= lt!507514 call!50803)))

(assert (=> b!1139987 (= e!648609 lt!507514)))

(declare-fun b!1140007 () Bool)

(declare-fun res!760180 () Bool)

(assert (=> b!1140007 (=> (not res!760180) (not e!648607))))

(assert (=> b!1140007 (= res!760180 (and (= (size!36252 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36251 _keys!1208) (size!36252 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140008 () Bool)

(assert (=> b!1140008 (= c!111808 (and (not lt!507513) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140008 (= e!648602 e!648615)))

(declare-fun b!1140009 () Bool)

(assert (=> b!1140009 (= e!648607 e!648611)))

(declare-fun res!760177 () Bool)

(assert (=> b!1140009 (=> (not res!760177) (not e!648611))))

(assert (=> b!1140009 (= res!760177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507511 mask!1564))))

(assert (=> b!1140009 (= lt!507511 (array!74130 (store (arr!35715 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36251 _keys!1208)))))

(declare-fun bm!50806 () Bool)

(assert (=> bm!50806 (= call!50802 (+!3519 (ite c!111807 lt!507518 lt!507507) (ite c!111807 (tuple2!18175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111808 (tuple2!18175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and start!98500 res!760168) b!1139988))

(assert (= (and b!1139988 res!760179) b!1140007))

(assert (= (and b!1140007 res!760180) b!1139985))

(assert (= (and b!1139985 res!760174) b!1140004))

(assert (= (and b!1140004 res!760170) b!1140002))

(assert (= (and b!1140002 res!760176) b!1139997))

(assert (= (and b!1139997 res!760181) b!1139999))

(assert (= (and b!1139999 res!760171) b!1140009))

(assert (= (and b!1140009 res!760177) b!1140003))

(assert (= (and b!1140003 res!760172) b!1139981))

(assert (= (and b!1139981 (not res!760178)) b!1139992))

(assert (= (and b!1139992 (not res!760173)) b!1139991))

(assert (= (and b!1139991 c!111803) b!1139994))

(assert (= (and b!1139991 (not c!111803)) b!1139993))

(assert (= (or b!1139994 b!1139993) bm!50804))

(assert (= (or b!1139994 b!1139993) bm!50805))

(assert (= (and b!1139991 (not res!760175)) b!1139982))

(assert (= (and b!1139982 c!111804) b!1139984))

(assert (= (and b!1139982 (not c!111804)) b!1139995))

(assert (= (and b!1139984 c!111807) b!1140000))

(assert (= (and b!1139984 (not c!111807)) b!1140008))

(assert (= (and b!1140008 c!111808) b!1139998))

(assert (= (and b!1140008 (not c!111808)) b!1139989))

(assert (= (and b!1139989 c!111805) b!1139987))

(assert (= (and b!1139989 (not c!111805)) b!1139990))

(assert (= (or b!1139998 b!1139987) bm!50799))

(assert (= (or b!1139998 b!1139987) bm!50801))

(assert (= (or b!1139998 b!1139987) bm!50803))

(assert (= (or b!1140000 bm!50803) bm!50802))

(assert (= (or b!1140000 bm!50799) bm!50800))

(assert (= (or b!1140000 bm!50801) bm!50806))

(assert (= (and b!1139984 c!111806) b!1139986))

(assert (= (and b!1139984 (not c!111806)) b!1140006))

(assert (= (and b!1139984 res!760169) b!1139996))

(assert (= (and b!1140001 condMapEmpty!44777) mapIsEmpty!44777))

(assert (= (and b!1140001 (not condMapEmpty!44777)) mapNonEmpty!44777))

(get-info :version)

(assert (= (and mapNonEmpty!44777 ((_ is ValueCellFull!13608) mapValue!44777)) b!1140005))

(assert (= (and b!1140001 ((_ is ValueCellFull!13608) mapDefault!44777)) b!1139983))

(assert (= start!98500 b!1140001))

(declare-fun b_lambda!19211 () Bool)

(assert (=> (not b_lambda!19211) (not b!1139992)))

(declare-fun t!36025 () Bool)

(declare-fun tb!8917 () Bool)

(assert (=> (and start!98500 (= defaultEntry!1004 defaultEntry!1004) t!36025) tb!8917))

(declare-fun result!18399 () Bool)

(assert (=> tb!8917 (= result!18399 tp_is_empty!28635)))

(assert (=> b!1139992 t!36025))

(declare-fun b_and!39061 () Bool)

(assert (= b_and!39059 (and (=> t!36025 result!18399) b_and!39061)))

(declare-fun m!1051547 () Bool)

(assert (=> b!1139999 m!1051547))

(declare-fun m!1051549 () Bool)

(assert (=> b!1139997 m!1051549))

(declare-fun m!1051551 () Bool)

(assert (=> b!1139996 m!1051551))

(declare-fun m!1051553 () Bool)

(assert (=> mapNonEmpty!44777 m!1051553))

(declare-fun m!1051555 () Bool)

(assert (=> b!1139994 m!1051555))

(declare-fun m!1051557 () Bool)

(assert (=> bm!50800 m!1051557))

(declare-fun m!1051559 () Bool)

(assert (=> start!98500 m!1051559))

(declare-fun m!1051561 () Bool)

(assert (=> start!98500 m!1051561))

(declare-fun m!1051563 () Bool)

(assert (=> b!1140003 m!1051563))

(declare-fun m!1051565 () Bool)

(assert (=> b!1139991 m!1051565))

(declare-fun m!1051567 () Bool)

(assert (=> b!1139991 m!1051567))

(assert (=> b!1139986 m!1051551))

(declare-fun m!1051569 () Bool)

(assert (=> bm!50802 m!1051569))

(declare-fun m!1051571 () Bool)

(assert (=> b!1139988 m!1051571))

(declare-fun m!1051573 () Bool)

(assert (=> b!1139982 m!1051573))

(declare-fun m!1051575 () Bool)

(assert (=> b!1139982 m!1051575))

(declare-fun m!1051577 () Bool)

(assert (=> b!1139982 m!1051577))

(assert (=> b!1139982 m!1051565))

(declare-fun m!1051579 () Bool)

(assert (=> b!1139982 m!1051579))

(declare-fun m!1051581 () Bool)

(assert (=> b!1139982 m!1051581))

(assert (=> b!1139982 m!1051565))

(declare-fun m!1051583 () Bool)

(assert (=> b!1139982 m!1051583))

(assert (=> b!1139982 m!1051575))

(declare-fun m!1051585 () Bool)

(assert (=> b!1139982 m!1051585))

(assert (=> b!1139982 m!1051581))

(assert (=> b!1139982 m!1051565))

(declare-fun m!1051587 () Bool)

(assert (=> b!1139981 m!1051587))

(declare-fun m!1051589 () Bool)

(assert (=> b!1139981 m!1051589))

(declare-fun m!1051591 () Bool)

(assert (=> bm!50804 m!1051591))

(declare-fun m!1051593 () Bool)

(assert (=> b!1140000 m!1051593))

(declare-fun m!1051595 () Bool)

(assert (=> b!1140000 m!1051595))

(declare-fun m!1051597 () Bool)

(assert (=> b!1140000 m!1051597))

(declare-fun m!1051599 () Bool)

(assert (=> bm!50806 m!1051599))

(assert (=> bm!50805 m!1051573))

(declare-fun m!1051601 () Bool)

(assert (=> b!1140009 m!1051601))

(declare-fun m!1051603 () Bool)

(assert (=> b!1140009 m!1051603))

(declare-fun m!1051605 () Bool)

(assert (=> b!1139984 m!1051605))

(declare-fun m!1051607 () Bool)

(assert (=> b!1139984 m!1051607))

(declare-fun m!1051609 () Bool)

(assert (=> b!1139984 m!1051609))

(declare-fun m!1051611 () Bool)

(assert (=> b!1139984 m!1051611))

(declare-fun m!1051613 () Bool)

(assert (=> b!1139985 m!1051613))

(declare-fun m!1051615 () Bool)

(assert (=> b!1139992 m!1051615))

(declare-fun m!1051617 () Bool)

(assert (=> b!1139992 m!1051617))

(declare-fun m!1051619 () Bool)

(assert (=> b!1139992 m!1051619))

(declare-fun m!1051621 () Bool)

(assert (=> b!1139992 m!1051621))

(declare-fun m!1051623 () Bool)

(assert (=> b!1140004 m!1051623))

(check-sat (not b!1139997) (not b!1139984) (not b!1139994) (not b!1139982) (not b_lambda!19211) (not mapNonEmpty!44777) tp_is_empty!28635 (not b_next!24105) (not bm!50806) (not start!98500) (not b!1140003) (not bm!50805) (not b!1139981) (not b!1139986) (not bm!50804) (not b!1140009) (not bm!50802) (not b!1139988) (not b!1139985) (not b!1140000) (not b!1139996) (not b!1140004) (not b!1139991) (not b!1139992) b_and!39061 (not bm!50800))
(check-sat b_and!39061 (not b_next!24105))
