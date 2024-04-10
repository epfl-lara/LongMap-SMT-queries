; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99526 () Bool)

(assert start!99526)

(declare-fun b_free!25105 () Bool)

(declare-fun b_next!25105 () Bool)

(assert (=> start!99526 (= b_free!25105 (not b_next!25105))))

(declare-fun tp!88029 () Bool)

(declare-fun b_and!41077 () Bool)

(assert (=> start!99526 (= tp!88029 b_and!41077)))

(declare-fun b!1177255 () Bool)

(declare-fun e!669227 () Bool)

(declare-fun tp_is_empty!29635 () Bool)

(assert (=> b!1177255 (= e!669227 tp_is_empty!29635)))

(declare-datatypes ((V!44641 0))(
  ( (V!44642 (val!14874 Int)) )
))
(declare-datatypes ((tuple2!19028 0))(
  ( (tuple2!19029 (_1!9525 (_ BitVec 64)) (_2!9525 V!44641)) )
))
(declare-fun lt!531539 () tuple2!19028)

(declare-fun b!1177256 () Bool)

(declare-fun e!669225 () Bool)

(declare-datatypes ((List!25766 0))(
  ( (Nil!25763) (Cons!25762 (h!26971 tuple2!19028) (t!37863 List!25766)) )
))
(declare-datatypes ((ListLongMap!16997 0))(
  ( (ListLongMap!16998 (toList!8514 List!25766)) )
))
(declare-fun lt!531536 () ListLongMap!16997)

(declare-fun lt!531530 () ListLongMap!16997)

(declare-fun +!3829 (ListLongMap!16997 tuple2!19028) ListLongMap!16997)

(assert (=> b!1177256 (= e!669225 (= lt!531530 (+!3829 lt!531536 lt!531539)))))

(declare-fun b!1177257 () Bool)

(declare-fun e!669230 () Bool)

(declare-fun e!669231 () Bool)

(assert (=> b!1177257 (= e!669230 (not e!669231))))

(declare-fun res!781989 () Bool)

(assert (=> b!1177257 (=> res!781989 e!669231)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177257 (= res!781989 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76077 0))(
  ( (array!76078 (arr!36688 (Array (_ BitVec 32) (_ BitVec 64))) (size!37224 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76077)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177257 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38874 0))(
  ( (Unit!38875) )
))
(declare-fun lt!531533 () Unit!38874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76077 (_ BitVec 64) (_ BitVec 32)) Unit!38874)

(assert (=> b!1177257 (= lt!531533 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177258 () Bool)

(declare-fun e!669235 () Bool)

(declare-fun e!669234 () Bool)

(assert (=> b!1177258 (= e!669235 e!669234)))

(declare-fun res!781988 () Bool)

(assert (=> b!1177258 (=> res!781988 e!669234)))

(assert (=> b!1177258 (= res!781988 (not (= (select (arr!36688 _keys!1208) from!1455) k!934)))))

(declare-fun b!1177259 () Bool)

(declare-fun e!669233 () Bool)

(assert (=> b!1177259 (= e!669233 true)))

(assert (=> b!1177259 e!669225))

(declare-fun res!781980 () Bool)

(assert (=> b!1177259 (=> (not res!781980) (not e!669225))))

(assert (=> b!1177259 (= res!781980 (not (= (select (arr!36688 _keys!1208) from!1455) k!934)))))

(declare-fun lt!531538 () Unit!38874)

(declare-fun e!669232 () Unit!38874)

(assert (=> b!1177259 (= lt!531538 e!669232)))

(declare-fun c!116781 () Bool)

(assert (=> b!1177259 (= c!116781 (= (select (arr!36688 _keys!1208) from!1455) k!934))))

(assert (=> b!1177259 e!669235))

(declare-fun res!781990 () Bool)

(assert (=> b!1177259 (=> (not res!781990) (not e!669235))))

(declare-fun lt!531541 () ListLongMap!16997)

(declare-fun lt!531540 () ListLongMap!16997)

(assert (=> b!1177259 (= res!781990 (= lt!531540 (+!3829 lt!531541 lt!531539)))))

(declare-fun lt!531535 () V!44641)

(declare-datatypes ((ValueCell!14108 0))(
  ( (ValueCellFull!14108 (v!17512 V!44641)) (EmptyCell!14108) )
))
(declare-datatypes ((array!76079 0))(
  ( (array!76080 (arr!36689 (Array (_ BitVec 32) ValueCell!14108)) (size!37225 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76079)

(declare-fun get!18745 (ValueCell!14108 V!44641) V!44641)

(assert (=> b!1177259 (= lt!531539 (tuple2!19029 (select (arr!36688 _keys!1208) from!1455) (get!18745 (select (arr!36689 _values!996) from!1455) lt!531535)))))

(declare-fun b!1177260 () Bool)

(declare-fun res!781982 () Bool)

(declare-fun e!669228 () Bool)

(assert (=> b!1177260 (=> (not res!781982) (not e!669228))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1177260 (= res!781982 (and (= (size!37225 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37224 _keys!1208) (size!37225 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177261 () Bool)

(declare-fun e!669224 () Bool)

(assert (=> b!1177261 (= e!669224 e!669233)))

(declare-fun res!781993 () Bool)

(assert (=> b!1177261 (=> res!781993 e!669233)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177261 (= res!781993 (not (validKeyInArray!0 (select (arr!36688 _keys!1208) from!1455))))))

(declare-fun lt!531531 () ListLongMap!16997)

(assert (=> b!1177261 (= lt!531531 lt!531541)))

(declare-fun -!1563 (ListLongMap!16997 (_ BitVec 64)) ListLongMap!16997)

(assert (=> b!1177261 (= lt!531541 (-!1563 lt!531536 k!934))))

(declare-fun zeroValue!944 () V!44641)

(declare-fun lt!531529 () array!76079)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531537 () array!76077)

(declare-fun minValue!944 () V!44641)

(declare-fun getCurrentListMapNoExtraKeys!4971 (array!76077 array!76079 (_ BitVec 32) (_ BitVec 32) V!44641 V!44641 (_ BitVec 32) Int) ListLongMap!16997)

(assert (=> b!1177261 (= lt!531531 (getCurrentListMapNoExtraKeys!4971 lt!531537 lt!531529 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177261 (= lt!531536 (getCurrentListMapNoExtraKeys!4971 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531543 () Unit!38874)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!790 (array!76077 array!76079 (_ BitVec 32) (_ BitVec 32) V!44641 V!44641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38874)

(assert (=> b!1177261 (= lt!531543 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177262 () Bool)

(declare-fun res!781991 () Bool)

(assert (=> b!1177262 (=> (not res!781991) (not e!669228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177262 (= res!781991 (validMask!0 mask!1564))))

(declare-fun b!1177263 () Bool)

(declare-fun res!781985 () Bool)

(assert (=> b!1177263 (=> (not res!781985) (not e!669228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76077 (_ BitVec 32)) Bool)

(assert (=> b!1177263 (= res!781985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46280 () Bool)

(declare-fun mapRes!46280 () Bool)

(assert (=> mapIsEmpty!46280 mapRes!46280))

(declare-fun b!1177264 () Bool)

(declare-fun e!669223 () Bool)

(assert (=> b!1177264 (= e!669223 tp_is_empty!29635)))

(declare-fun b!1177265 () Bool)

(declare-fun Unit!38876 () Unit!38874)

(assert (=> b!1177265 (= e!669232 Unit!38876)))

(declare-fun b!1177266 () Bool)

(declare-fun res!781979 () Bool)

(assert (=> b!1177266 (=> (not res!781979) (not e!669228))))

(assert (=> b!1177266 (= res!781979 (validKeyInArray!0 k!934))))

(declare-fun b!1177268 () Bool)

(declare-fun e!669226 () Bool)

(assert (=> b!1177268 (= e!669226 (and e!669223 mapRes!46280))))

(declare-fun condMapEmpty!46280 () Bool)

(declare-fun mapDefault!46280 () ValueCell!14108)

