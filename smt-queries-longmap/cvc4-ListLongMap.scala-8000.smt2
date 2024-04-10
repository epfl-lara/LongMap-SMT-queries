; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98844 () Bool)

(assert start!98844)

(declare-fun b_free!24449 () Bool)

(declare-fun b_next!24449 () Bool)

(assert (=> start!98844 (= b_free!24449 (not b_next!24449))))

(declare-fun tp!86058 () Bool)

(declare-fun b_and!39747 () Bool)

(assert (=> start!98844 (= tp!86058 b_and!39747)))

(declare-fun res!767775 () Bool)

(declare-fun e!657242 () Bool)

(assert (=> start!98844 (=> (not res!767775) (not e!657242))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74805 0))(
  ( (array!74806 (arr!36053 (Array (_ BitVec 32) (_ BitVec 64))) (size!36589 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74805)

(assert (=> start!98844 (= res!767775 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36589 _keys!1208))))))

(assert (=> start!98844 e!657242))

(declare-fun tp_is_empty!28979 () Bool)

(assert (=> start!98844 tp_is_empty!28979))

(declare-fun array_inv!27594 (array!74805) Bool)

(assert (=> start!98844 (array_inv!27594 _keys!1208)))

(assert (=> start!98844 true))

(assert (=> start!98844 tp!86058))

(declare-datatypes ((V!43765 0))(
  ( (V!43766 (val!14546 Int)) )
))
(declare-datatypes ((ValueCell!13780 0))(
  ( (ValueCellFull!13780 (v!17183 V!43765)) (EmptyCell!13780) )
))
(declare-datatypes ((array!74807 0))(
  ( (array!74808 (arr!36054 (Array (_ BitVec 32) ValueCell!13780)) (size!36590 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74807)

(declare-fun e!657243 () Bool)

(declare-fun array_inv!27595 (array!74807) Bool)

(assert (=> start!98844 (and (array_inv!27595 _values!996) e!657243)))

(declare-fun b!1155666 () Bool)

(declare-datatypes ((Unit!38059 0))(
  ( (Unit!38060) )
))
(declare-fun e!657246 () Unit!38059)

(declare-fun e!657239 () Unit!38059)

(assert (=> b!1155666 (= e!657246 e!657239)))

(declare-fun c!114899 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!518568 () Bool)

(assert (=> b!1155666 (= c!114899 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518568))))

(declare-fun b!1155667 () Bool)

(declare-fun res!767776 () Bool)

(assert (=> b!1155667 (=> (not res!767776) (not e!657242))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155667 (= res!767776 (validKeyInArray!0 k!934))))

(declare-fun zeroValue!944 () V!43765)

(declare-datatypes ((tuple2!18500 0))(
  ( (tuple2!18501 (_1!9261 (_ BitVec 64)) (_2!9261 V!43765)) )
))
(declare-datatypes ((List!25243 0))(
  ( (Nil!25240) (Cons!25239 (h!26448 tuple2!18500) (t!36684 List!25243)) )
))
(declare-datatypes ((ListLongMap!16469 0))(
  ( (ListLongMap!16470 (toList!8250 List!25243)) )
))
(declare-fun lt!518554 () ListLongMap!16469)

(declare-fun bm!54927 () Bool)

(declare-fun c!114901 () Bool)

(declare-fun c!114904 () Bool)

(declare-fun call!54930 () ListLongMap!16469)

(declare-fun minValue!944 () V!43765)

(declare-fun +!3663 (ListLongMap!16469 tuple2!18500) ListLongMap!16469)

(assert (=> bm!54927 (= call!54930 (+!3663 lt!518554 (ite (or c!114904 c!114901) (tuple2!18501 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1155668 () Bool)

(declare-fun res!767780 () Bool)

(declare-fun e!657248 () Bool)

(assert (=> b!1155668 (=> (not res!767780) (not e!657248))))

(declare-fun lt!518552 () array!74805)

(declare-datatypes ((List!25244 0))(
  ( (Nil!25241) (Cons!25240 (h!26449 (_ BitVec 64)) (t!36685 List!25244)) )
))
(declare-fun arrayNoDuplicates!0 (array!74805 (_ BitVec 32) List!25244) Bool)

(assert (=> b!1155668 (= res!767780 (arrayNoDuplicates!0 lt!518552 #b00000000000000000000000000000000 Nil!25241))))

(declare-fun b!1155669 () Bool)

(declare-fun e!657236 () Bool)

(declare-fun e!657234 () Bool)

(assert (=> b!1155669 (= e!657236 e!657234)))

(declare-fun res!767781 () Bool)

(assert (=> b!1155669 (=> res!767781 e!657234)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155669 (= res!767781 (not (= from!1455 i!673)))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518565 () array!74807)

(declare-fun lt!518567 () ListLongMap!16469)

(declare-fun getCurrentListMapNoExtraKeys!4719 (array!74805 array!74807 (_ BitVec 32) (_ BitVec 32) V!43765 V!43765 (_ BitVec 32) Int) ListLongMap!16469)

(assert (=> b!1155669 (= lt!518567 (getCurrentListMapNoExtraKeys!4719 lt!518552 lt!518565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518559 () V!43765)

(assert (=> b!1155669 (= lt!518565 (array!74808 (store (arr!36054 _values!996) i!673 (ValueCellFull!13780 lt!518559)) (size!36590 _values!996)))))

(declare-fun dynLambda!2728 (Int (_ BitVec 64)) V!43765)

(assert (=> b!1155669 (= lt!518559 (dynLambda!2728 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518550 () ListLongMap!16469)

(assert (=> b!1155669 (= lt!518550 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155670 () Bool)

(declare-fun e!657233 () Bool)

(declare-fun arrayContainsKey!0 (array!74805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155670 (= e!657233 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155671 () Bool)

(declare-fun res!767771 () Bool)

(assert (=> b!1155671 (=> (not res!767771) (not e!657242))))

(assert (=> b!1155671 (= res!767771 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36589 _keys!1208))))))

(declare-fun b!1155672 () Bool)

(declare-fun e!657249 () Unit!38059)

(declare-fun Unit!38061 () Unit!38059)

(assert (=> b!1155672 (= e!657249 Unit!38061)))

(declare-fun e!657244 () Bool)

(declare-fun b!1155673 () Bool)

(assert (=> b!1155673 (= e!657244 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155674 () Bool)

(assert (=> b!1155674 (= e!657242 e!657248)))

(declare-fun res!767777 () Bool)

(assert (=> b!1155674 (=> (not res!767777) (not e!657248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74805 (_ BitVec 32)) Bool)

(assert (=> b!1155674 (= res!767777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518552 mask!1564))))

(assert (=> b!1155674 (= lt!518552 (array!74806 (store (arr!36053 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36589 _keys!1208)))))

(declare-fun bm!54928 () Bool)

(declare-fun call!54935 () ListLongMap!16469)

(assert (=> bm!54928 (= call!54935 (getCurrentListMapNoExtraKeys!4719 lt!518552 lt!518565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155675 () Bool)

(declare-fun Unit!38062 () Unit!38059)

(assert (=> b!1155675 (= e!657239 Unit!38062)))

(declare-fun mapNonEmpty!45293 () Bool)

(declare-fun mapRes!45293 () Bool)

(declare-fun tp!86057 () Bool)

(declare-fun e!657235 () Bool)

(assert (=> mapNonEmpty!45293 (= mapRes!45293 (and tp!86057 e!657235))))

(declare-fun mapRest!45293 () (Array (_ BitVec 32) ValueCell!13780))

(declare-fun mapKey!45293 () (_ BitVec 32))

(declare-fun mapValue!45293 () ValueCell!13780)

(assert (=> mapNonEmpty!45293 (= (arr!36054 _values!996) (store mapRest!45293 mapKey!45293 mapValue!45293))))

(declare-fun b!1155676 () Bool)

(declare-fun res!767779 () Bool)

(assert (=> b!1155676 (=> (not res!767779) (not e!657242))))

(assert (=> b!1155676 (= res!767779 (and (= (size!36590 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36589 _keys!1208) (size!36590 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1155677 () Bool)

(declare-fun lt!518564 () ListLongMap!16469)

(declare-fun contains!6763 (ListLongMap!16469 (_ BitVec 64)) Bool)

(assert (=> b!1155677 (contains!6763 (+!3663 lt!518564 (tuple2!18501 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!518569 () Unit!38059)

(declare-fun addStillContains!907 (ListLongMap!16469 (_ BitVec 64) V!43765 (_ BitVec 64)) Unit!38059)

(assert (=> b!1155677 (= lt!518569 (addStillContains!907 lt!518564 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!54934 () Bool)

(assert (=> b!1155677 call!54934))

(assert (=> b!1155677 (= lt!518564 call!54930)))

(declare-fun lt!518563 () Unit!38059)

(declare-fun call!54937 () Unit!38059)

(assert (=> b!1155677 (= lt!518563 call!54937)))

(declare-fun e!657238 () Unit!38059)

(assert (=> b!1155677 (= e!657238 lt!518569)))

(declare-fun b!1155678 () Bool)

(declare-fun e!657247 () Bool)

(assert (=> b!1155678 (= e!657234 e!657247)))

(declare-fun res!767778 () Bool)

(assert (=> b!1155678 (=> res!767778 e!657247)))

(assert (=> b!1155678 (= res!767778 (not (= (select (arr!36053 _keys!1208) from!1455) k!934)))))

(declare-fun e!657240 () Bool)

(assert (=> b!1155678 e!657240))

(declare-fun c!114903 () Bool)

(assert (=> b!1155678 (= c!114903 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518562 () Unit!38059)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!600 (array!74805 array!74807 (_ BitVec 32) (_ BitVec 32) V!43765 V!43765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38059)

(assert (=> b!1155678 (= lt!518562 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!600 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155679 () Bool)

(declare-fun call!54933 () ListLongMap!16469)

(assert (=> b!1155679 (= e!657240 (= call!54935 call!54933))))

(declare-fun b!1155680 () Bool)

(declare-fun call!54936 () Bool)

(assert (=> b!1155680 call!54936))

(declare-fun lt!518557 () Unit!38059)

(declare-fun call!54932 () Unit!38059)

(assert (=> b!1155680 (= lt!518557 call!54932)))

(assert (=> b!1155680 (= e!657239 lt!518557)))

(declare-fun bm!54929 () Bool)

(assert (=> bm!54929 (= call!54933 (getCurrentListMapNoExtraKeys!4719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155681 () Bool)

(declare-fun e!657241 () Bool)

(assert (=> b!1155681 (= e!657243 (and e!657241 mapRes!45293))))

(declare-fun condMapEmpty!45293 () Bool)

(declare-fun mapDefault!45293 () ValueCell!13780)

