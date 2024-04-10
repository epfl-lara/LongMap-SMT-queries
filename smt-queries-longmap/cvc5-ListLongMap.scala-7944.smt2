; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98504 () Bool)

(assert start!98504)

(declare-fun b_free!24109 () Bool)

(declare-fun b_next!24109 () Bool)

(assert (=> start!98504 (= b_free!24109 (not b_next!24109))))

(declare-fun tp!85037 () Bool)

(declare-fun b_and!39067 () Bool)

(assert (=> start!98504 (= tp!85037 b_and!39067)))

(declare-fun b!1140159 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!507636 () Bool)

(declare-fun e!648697 () Bool)

(assert (=> b!1140159 (= e!648697 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507636) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun c!111841 () Bool)

(declare-fun call!50857 () Bool)

(declare-datatypes ((V!43313 0))(
  ( (V!43314 (val!14376 Int)) )
))
(declare-datatypes ((tuple2!18178 0))(
  ( (tuple2!18179 (_1!9100 (_ BitVec 64)) (_2!9100 V!43313)) )
))
(declare-datatypes ((List!24933 0))(
  ( (Nil!24930) (Cons!24929 (h!26138 tuple2!18178) (t!36034 List!24933)) )
))
(declare-datatypes ((ListLongMap!16147 0))(
  ( (ListLongMap!16148 (toList!8089 List!24933)) )
))
(declare-fun call!50856 () ListLongMap!16147)

(declare-fun lt!507635 () ListLongMap!16147)

(declare-fun bm!50847 () Bool)

(declare-fun contains!6624 (ListLongMap!16147 (_ BitVec 64)) Bool)

(assert (=> bm!50847 (= call!50857 (contains!6624 (ite c!111841 lt!507635 call!50856) k!934))))

(declare-datatypes ((array!74137 0))(
  ( (array!74138 (arr!35719 (Array (_ BitVec 32) (_ BitVec 64))) (size!36255 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74137)

(declare-fun b!1140160 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140160 (= e!648697 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140162 () Bool)

(declare-fun res!760256 () Bool)

(declare-fun e!648700 () Bool)

(assert (=> b!1140162 (=> (not res!760256) (not e!648700))))

(declare-datatypes ((List!24934 0))(
  ( (Nil!24931) (Cons!24930 (h!26139 (_ BitVec 64)) (t!36035 List!24934)) )
))
(declare-fun arrayNoDuplicates!0 (array!74137 (_ BitVec 32) List!24934) Bool)

(assert (=> b!1140162 (= res!760256 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24931))))

(declare-fun b!1140163 () Bool)

(declare-fun res!760257 () Bool)

(assert (=> b!1140163 (=> (not res!760257) (not e!648700))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74137 (_ BitVec 32)) Bool)

(assert (=> b!1140163 (= res!760257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140164 () Bool)

(declare-fun c!111842 () Bool)

(assert (=> b!1140164 (= c!111842 (and (not lt!507636) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37381 0))(
  ( (Unit!37382) )
))
(declare-fun e!648707 () Unit!37381)

(declare-fun e!648698 () Unit!37381)

(assert (=> b!1140164 (= e!648707 e!648698)))

(declare-fun b!1140165 () Bool)

(declare-fun e!648705 () Unit!37381)

(declare-fun Unit!37383 () Unit!37381)

(assert (=> b!1140165 (= e!648705 Unit!37383)))

(declare-fun bm!50848 () Bool)

(declare-fun call!50853 () ListLongMap!16147)

(assert (=> bm!50848 (= call!50856 call!50853)))

(declare-fun b!1140166 () Bool)

(declare-fun res!760259 () Bool)

(assert (=> b!1140166 (=> (not res!760259) (not e!648700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140166 (= res!760259 (validMask!0 mask!1564))))

(declare-fun b!1140167 () Bool)

(declare-fun e!648702 () Bool)

(declare-fun e!648708 () Bool)

(assert (=> b!1140167 (= e!648702 (not e!648708))))

(declare-fun res!760264 () Bool)

(assert (=> b!1140167 (=> res!760264 e!648708)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140167 (= res!760264 (bvsgt from!1455 i!673))))

(assert (=> b!1140167 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!507633 () Unit!37381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74137 (_ BitVec 64) (_ BitVec 32)) Unit!37381)

(assert (=> b!1140167 (= lt!507633 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1140168 () Bool)

(declare-fun lt!507630 () Unit!37381)

(assert (=> b!1140168 (= e!648698 lt!507630)))

(declare-fun call!50855 () Unit!37381)

(assert (=> b!1140168 (= lt!507630 call!50855)))

(declare-fun call!50854 () Bool)

(assert (=> b!1140168 call!50854))

(declare-fun bm!50849 () Bool)

(declare-fun call!50852 () Unit!37381)

(assert (=> bm!50849 (= call!50855 call!50852)))

(declare-fun b!1140169 () Bool)

(declare-fun res!760254 () Bool)

(assert (=> b!1140169 (=> (not res!760254) (not e!648702))))

(declare-fun lt!507631 () array!74137)

(assert (=> b!1140169 (= res!760254 (arrayNoDuplicates!0 lt!507631 #b00000000000000000000000000000000 Nil!24931))))

(declare-fun zeroValue!944 () V!43313)

(declare-fun bm!50850 () Bool)

(declare-fun lt!507645 () ListLongMap!16147)

(declare-fun minValue!944 () V!43313)

(declare-fun addStillContains!778 (ListLongMap!16147 (_ BitVec 64) V!43313 (_ BitVec 64)) Unit!37381)

(assert (=> bm!50850 (= call!50852 (addStillContains!778 lt!507645 (ite (or c!111841 c!111842) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111841 c!111842) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1140170 () Bool)

(declare-fun res!760261 () Bool)

(assert (=> b!1140170 (=> (not res!760261) (not e!648700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140170 (= res!760261 (validKeyInArray!0 k!934))))

(declare-fun b!1140171 () Bool)

(assert (=> b!1140171 call!50854))

(declare-fun lt!507637 () Unit!37381)

(assert (=> b!1140171 (= lt!507637 call!50855)))

(declare-fun e!648696 () Unit!37381)

(assert (=> b!1140171 (= e!648696 lt!507637)))

(declare-fun b!1140172 () Bool)

(declare-fun e!648709 () Bool)

(declare-fun e!648703 () Bool)

(assert (=> b!1140172 (= e!648709 e!648703)))

(declare-fun res!760253 () Bool)

(assert (=> b!1140172 (=> res!760253 e!648703)))

(assert (=> b!1140172 (= res!760253 (not (= (select (arr!35719 _keys!1208) from!1455) k!934)))))

(declare-fun e!648699 () Bool)

(assert (=> b!1140172 e!648699))

(declare-fun c!111843 () Bool)

(assert (=> b!1140172 (= c!111843 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13610 0))(
  ( (ValueCellFull!13610 (v!17013 V!43313)) (EmptyCell!13610) )
))
(declare-datatypes ((array!74139 0))(
  ( (array!74140 (arr!35720 (Array (_ BitVec 32) ValueCell!13610)) (size!36256 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74139)

(declare-fun lt!507639 () Unit!37381)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!485 (array!74137 array!74139 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37381)

(assert (=> b!1140172 (= lt!507639 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44783 () Bool)

(declare-fun mapRes!44783 () Bool)

(declare-fun tp!85038 () Bool)

(declare-fun e!648704 () Bool)

(assert (=> mapNonEmpty!44783 (= mapRes!44783 (and tp!85038 e!648704))))

(declare-fun mapValue!44783 () ValueCell!13610)

(declare-fun mapKey!44783 () (_ BitVec 32))

(declare-fun mapRest!44783 () (Array (_ BitVec 32) ValueCell!13610))

(assert (=> mapNonEmpty!44783 (= (arr!35720 _values!996) (store mapRest!44783 mapKey!44783 mapValue!44783))))

(declare-fun b!1140173 () Bool)

(declare-fun call!50850 () ListLongMap!16147)

(declare-fun call!50851 () ListLongMap!16147)

(declare-fun -!1239 (ListLongMap!16147 (_ BitVec 64)) ListLongMap!16147)

(assert (=> b!1140173 (= e!648699 (= call!50851 (-!1239 call!50850 k!934)))))

(declare-fun b!1140174 () Bool)

(assert (=> b!1140174 (= e!648698 e!648696)))

(declare-fun c!111840 () Bool)

(assert (=> b!1140174 (= c!111840 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507636))))

(declare-fun b!1140161 () Bool)

(declare-fun +!3521 (ListLongMap!16147 tuple2!18178) ListLongMap!16147)

(assert (=> b!1140161 (contains!6624 (+!3521 lt!507635 (tuple2!18179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!507634 () Unit!37381)

(assert (=> b!1140161 (= lt!507634 (addStillContains!778 lt!507635 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1140161 call!50857))

(assert (=> b!1140161 (= lt!507635 call!50853)))

(declare-fun lt!507641 () Unit!37381)

(assert (=> b!1140161 (= lt!507641 call!50852)))

(assert (=> b!1140161 (= e!648707 lt!507634)))

(declare-fun res!760255 () Bool)

(assert (=> start!98504 (=> (not res!760255) (not e!648700))))

(assert (=> start!98504 (= res!760255 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36255 _keys!1208))))))

(assert (=> start!98504 e!648700))

(declare-fun tp_is_empty!28639 () Bool)

(assert (=> start!98504 tp_is_empty!28639))

(declare-fun array_inv!27380 (array!74137) Bool)

(assert (=> start!98504 (array_inv!27380 _keys!1208)))

(assert (=> start!98504 true))

(assert (=> start!98504 tp!85037))

(declare-fun e!648706 () Bool)

(declare-fun array_inv!27381 (array!74139) Bool)

(assert (=> start!98504 (and (array_inv!27381 _values!996) e!648706)))

(declare-fun b!1140175 () Bool)

(assert (=> b!1140175 (= e!648704 tp_is_empty!28639)))

(declare-fun bm!50851 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4571 (array!74137 array!74139 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 32) Int) ListLongMap!16147)

(assert (=> bm!50851 (= call!50850 (getCurrentListMapNoExtraKeys!4571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50852 () Bool)

(assert (=> bm!50852 (= call!50853 (+!3521 lt!507645 (ite (or c!111841 c!111842) (tuple2!18179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1140176 () Bool)

(declare-fun Unit!37384 () Unit!37381)

(assert (=> b!1140176 (= e!648696 Unit!37384)))

(declare-fun bm!50853 () Bool)

(assert (=> bm!50853 (= call!50854 call!50857)))

(declare-fun b!1140177 () Bool)

(declare-fun res!760258 () Bool)

(assert (=> b!1140177 (=> (not res!760258) (not e!648700))))

(assert (=> b!1140177 (= res!760258 (= (select (arr!35719 _keys!1208) i!673) k!934))))

(declare-fun b!1140178 () Bool)

(declare-fun res!760262 () Bool)

(assert (=> b!1140178 (=> (not res!760262) (not e!648700))))

(assert (=> b!1140178 (= res!760262 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36255 _keys!1208))))))

(declare-fun mapIsEmpty!44783 () Bool)

(assert (=> mapIsEmpty!44783 mapRes!44783))

(declare-fun b!1140179 () Bool)

(declare-fun e!648701 () Bool)

(assert (=> b!1140179 (= e!648706 (and e!648701 mapRes!44783))))

(declare-fun condMapEmpty!44783 () Bool)

(declare-fun mapDefault!44783 () ValueCell!13610)

