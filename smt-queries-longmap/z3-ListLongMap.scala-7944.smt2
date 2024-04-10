; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98506 () Bool)

(assert start!98506)

(declare-fun b_free!24111 () Bool)

(declare-fun b_next!24111 () Bool)

(assert (=> start!98506 (= b_free!24111 (not b_next!24111))))

(declare-fun tp!85044 () Bool)

(declare-fun b_and!39071 () Bool)

(assert (=> start!98506 (= tp!85044 b_and!39071)))

(declare-datatypes ((V!43315 0))(
  ( (V!43316 (val!14377 Int)) )
))
(declare-fun zeroValue!944 () V!43315)

(declare-datatypes ((tuple2!18180 0))(
  ( (tuple2!18181 (_1!9101 (_ BitVec 64)) (_2!9101 V!43315)) )
))
(declare-datatypes ((List!24935 0))(
  ( (Nil!24932) (Cons!24931 (h!26140 tuple2!18180) (t!36038 List!24935)) )
))
(declare-datatypes ((ListLongMap!16149 0))(
  ( (ListLongMap!16150 (toList!8090 List!24935)) )
))
(declare-fun lt!507702 () ListLongMap!16149)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!111860 () Bool)

(declare-datatypes ((Unit!37385 0))(
  ( (Unit!37386) )
))
(declare-fun call!50878 () Unit!37385)

(declare-fun minValue!944 () V!43315)

(declare-fun c!111857 () Bool)

(declare-fun bm!50871 () Bool)

(declare-fun addStillContains!779 (ListLongMap!16149 (_ BitVec 64) V!43315 (_ BitVec 64)) Unit!37385)

(assert (=> bm!50871 (= call!50878 (addStillContains!779 lt!507702 (ite (or c!111857 c!111860) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111857 c!111860) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1140248 () Bool)

(declare-fun res!760307 () Bool)

(declare-fun e!648752 () Bool)

(assert (=> b!1140248 (=> (not res!760307) (not e!648752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140248 (= res!760307 (validKeyInArray!0 k0!934))))

(declare-fun b!1140249 () Bool)

(declare-fun e!648747 () Unit!37385)

(declare-fun lt!507701 () Unit!37385)

(assert (=> b!1140249 (= e!648747 lt!507701)))

(declare-fun call!50876 () Unit!37385)

(assert (=> b!1140249 (= lt!507701 call!50876)))

(declare-fun call!50874 () Bool)

(assert (=> b!1140249 call!50874))

(declare-fun b!1140250 () Bool)

(declare-fun e!648759 () Bool)

(assert (=> b!1140250 (= e!648759 true)))

(declare-datatypes ((array!74141 0))(
  ( (array!74142 (arr!35721 (Array (_ BitVec 32) (_ BitVec 64))) (size!36257 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74141)

(declare-fun lt!507705 () V!43315)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun -!1240 (ListLongMap!16149 (_ BitVec 64)) ListLongMap!16149)

(declare-fun +!3522 (ListLongMap!16149 tuple2!18180) ListLongMap!16149)

(assert (=> b!1140250 (= (-!1240 (+!3522 lt!507702 (tuple2!18181 (select (arr!35721 _keys!1208) from!1455) lt!507705)) (select (arr!35721 _keys!1208) from!1455)) lt!507702)))

(declare-fun lt!507698 () Unit!37385)

(declare-fun addThenRemoveForNewKeyIsSame!94 (ListLongMap!16149 (_ BitVec 64) V!43315) Unit!37385)

(assert (=> b!1140250 (= lt!507698 (addThenRemoveForNewKeyIsSame!94 lt!507702 (select (arr!35721 _keys!1208) from!1455) lt!507705))))

(declare-fun lt!507707 () V!43315)

(declare-datatypes ((ValueCell!13611 0))(
  ( (ValueCellFull!13611 (v!17014 V!43315)) (EmptyCell!13611) )
))
(declare-datatypes ((array!74143 0))(
  ( (array!74144 (arr!35722 (Array (_ BitVec 32) ValueCell!13611)) (size!36258 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74143)

(declare-fun get!18144 (ValueCell!13611 V!43315) V!43315)

(assert (=> b!1140250 (= lt!507705 (get!18144 (select (arr!35722 _values!996) from!1455) lt!507707))))

(declare-fun lt!507690 () Unit!37385)

(declare-fun e!648751 () Unit!37385)

(assert (=> b!1140250 (= lt!507690 e!648751)))

(declare-fun c!111858 () Bool)

(declare-fun contains!6625 (ListLongMap!16149 (_ BitVec 64)) Bool)

(assert (=> b!1140250 (= c!111858 (contains!6625 lt!507702 k0!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4572 (array!74141 array!74143 (_ BitVec 32) (_ BitVec 32) V!43315 V!43315 (_ BitVec 32) Int) ListLongMap!16149)

(assert (=> b!1140250 (= lt!507702 (getCurrentListMapNoExtraKeys!4572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140251 () Bool)

(declare-fun e!648757 () Bool)

(assert (=> b!1140251 (= e!648752 e!648757)))

(declare-fun res!760302 () Bool)

(assert (=> b!1140251 (=> (not res!760302) (not e!648757))))

(declare-fun lt!507703 () array!74141)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74141 (_ BitVec 32)) Bool)

(assert (=> b!1140251 (= res!760302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507703 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140251 (= lt!507703 (array!74142 (store (arr!35721 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36257 _keys!1208)))))

(declare-fun b!1140252 () Bool)

(assert (=> b!1140252 call!50874))

(declare-fun lt!507695 () Unit!37385)

(assert (=> b!1140252 (= lt!507695 call!50876)))

(declare-fun e!648755 () Unit!37385)

(assert (=> b!1140252 (= e!648755 lt!507695)))

(declare-fun e!648744 () Bool)

(declare-fun lt!507696 () Bool)

(declare-fun b!1140253 () Bool)

(assert (=> b!1140253 (= e!648744 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507696) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140254 () Bool)

(declare-fun e!648756 () Bool)

(declare-fun e!648745 () Bool)

(declare-fun mapRes!44786 () Bool)

(assert (=> b!1140254 (= e!648756 (and e!648745 mapRes!44786))))

(declare-fun condMapEmpty!44786 () Bool)

(declare-fun mapDefault!44786 () ValueCell!13611)

(assert (=> b!1140254 (= condMapEmpty!44786 (= (arr!35722 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13611)) mapDefault!44786)))))

(declare-fun b!1140255 () Bool)

(declare-fun arrayContainsKey!0 (array!74141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140255 (= e!648744 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140256 () Bool)

(declare-fun e!648746 () Bool)

(assert (=> b!1140256 (= e!648757 (not e!648746))))

(declare-fun res!760303 () Bool)

(assert (=> b!1140256 (=> res!760303 e!648746)))

(assert (=> b!1140256 (= res!760303 (bvsgt from!1455 i!673))))

(assert (=> b!1140256 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507697 () Unit!37385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74141 (_ BitVec 64) (_ BitVec 32)) Unit!37385)

(assert (=> b!1140256 (= lt!507697 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun lt!507693 () array!74143)

(declare-fun bm!50872 () Bool)

(declare-fun call!50875 () ListLongMap!16149)

(declare-fun c!111862 () Bool)

(assert (=> bm!50872 (= call!50875 (getCurrentListMapNoExtraKeys!4572 (ite c!111862 _keys!1208 lt!507703) (ite c!111862 _values!996 lt!507693) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140257 () Bool)

(declare-fun res!760299 () Bool)

(assert (=> b!1140257 (=> (not res!760299) (not e!648752))))

(assert (=> b!1140257 (= res!760299 (= (select (arr!35721 _keys!1208) i!673) k0!934))))

(declare-fun b!1140258 () Bool)

(declare-fun e!648758 () Bool)

(assert (=> b!1140258 (= e!648758 e!648759)))

(declare-fun res!760298 () Bool)

(assert (=> b!1140258 (=> res!760298 e!648759)))

(assert (=> b!1140258 (= res!760298 (not (= (select (arr!35721 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648754 () Bool)

(assert (=> b!1140258 e!648754))

(assert (=> b!1140258 (= c!111862 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507691 () Unit!37385)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!486 (array!74141 array!74143 (_ BitVec 32) (_ BitVec 32) V!43315 V!43315 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37385)

(assert (=> b!1140258 (= lt!507691 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!486 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140259 () Bool)

(declare-fun call!50880 () ListLongMap!16149)

(assert (=> b!1140259 (= e!648754 (= call!50880 (-!1240 call!50875 k0!934)))))

(declare-fun bm!50874 () Bool)

(declare-fun call!50879 () ListLongMap!16149)

(declare-fun call!50877 () ListLongMap!16149)

(assert (=> bm!50874 (= call!50879 call!50877)))

(declare-fun mapNonEmpty!44786 () Bool)

(declare-fun tp!85043 () Bool)

(declare-fun e!648750 () Bool)

(assert (=> mapNonEmpty!44786 (= mapRes!44786 (and tp!85043 e!648750))))

(declare-fun mapValue!44786 () ValueCell!13611)

(declare-fun mapKey!44786 () (_ BitVec 32))

(declare-fun mapRest!44786 () (Array (_ BitVec 32) ValueCell!13611))

(assert (=> mapNonEmpty!44786 (= (arr!35722 _values!996) (store mapRest!44786 mapKey!44786 mapValue!44786))))

(declare-fun bm!50875 () Bool)

(assert (=> bm!50875 (= call!50877 (+!3522 lt!507702 (ite (or c!111857 c!111860) (tuple2!18181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!50876 () Bool)

(assert (=> bm!50876 (= call!50876 call!50878)))

(declare-fun b!1140260 () Bool)

(declare-fun res!760300 () Bool)

(assert (=> b!1140260 (=> (not res!760300) (not e!648752))))

(declare-datatypes ((List!24936 0))(
  ( (Nil!24933) (Cons!24932 (h!26141 (_ BitVec 64)) (t!36039 List!24936)) )
))
(declare-fun arrayNoDuplicates!0 (array!74141 (_ BitVec 32) List!24936) Bool)

(assert (=> b!1140260 (= res!760300 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24933))))

(declare-fun b!1140261 () Bool)

(declare-fun lt!507699 () ListLongMap!16149)

(assert (=> b!1140261 (contains!6625 (+!3522 lt!507699 (tuple2!18181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!507688 () Unit!37385)

(assert (=> b!1140261 (= lt!507688 (addStillContains!779 lt!507699 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50881 () Bool)

(assert (=> b!1140261 call!50881))

(assert (=> b!1140261 (= lt!507699 call!50877)))

(declare-fun lt!507706 () Unit!37385)

(assert (=> b!1140261 (= lt!507706 call!50878)))

(declare-fun e!648749 () Unit!37385)

(assert (=> b!1140261 (= e!648749 lt!507688)))

(declare-fun e!648753 () Bool)

(declare-fun b!1140262 () Bool)

(assert (=> b!1140262 (= e!648753 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140263 () Bool)

(declare-fun tp_is_empty!28641 () Bool)

(assert (=> b!1140263 (= e!648745 tp_is_empty!28641)))

(declare-fun b!1140264 () Bool)

(declare-fun Unit!37387 () Unit!37385)

(assert (=> b!1140264 (= e!648751 Unit!37387)))

(assert (=> b!1140264 (= lt!507696 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140264 (= c!111857 (and (not lt!507696) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507708 () Unit!37385)

(assert (=> b!1140264 (= lt!507708 e!648749)))

(declare-fun lt!507689 () Unit!37385)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!379 (array!74141 array!74143 (_ BitVec 32) (_ BitVec 32) V!43315 V!43315 (_ BitVec 64) (_ BitVec 32) Int) Unit!37385)

(assert (=> b!1140264 (= lt!507689 (lemmaListMapContainsThenArrayContainsFrom!379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111861 () Bool)

(assert (=> b!1140264 (= c!111861 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760304 () Bool)

(assert (=> b!1140264 (= res!760304 e!648744)))

(assert (=> b!1140264 (=> (not res!760304) (not e!648753))))

(assert (=> b!1140264 e!648753))

(declare-fun lt!507692 () Unit!37385)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74141 (_ BitVec 32) (_ BitVec 32)) Unit!37385)

(assert (=> b!1140264 (= lt!507692 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140264 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24933)))

(declare-fun lt!507694 () Unit!37385)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74141 (_ BitVec 64) (_ BitVec 32) List!24936) Unit!37385)

(assert (=> b!1140264 (= lt!507694 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24933))))

(assert (=> b!1140264 false))

(declare-fun b!1140265 () Bool)

(assert (=> b!1140265 (= c!111860 (and (not lt!507696) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140265 (= e!648749 e!648747)))

(declare-fun b!1140266 () Bool)

(assert (=> b!1140266 (= e!648747 e!648755)))

(declare-fun c!111859 () Bool)

(assert (=> b!1140266 (= c!111859 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507696))))

(declare-fun b!1140267 () Bool)

(declare-fun res!760297 () Bool)

(assert (=> b!1140267 (=> (not res!760297) (not e!648752))))

(assert (=> b!1140267 (= res!760297 (and (= (size!36258 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36257 _keys!1208) (size!36258 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140268 () Bool)

(declare-fun Unit!37388 () Unit!37385)

(assert (=> b!1140268 (= e!648751 Unit!37388)))

(declare-fun bm!50877 () Bool)

(assert (=> bm!50877 (= call!50874 call!50881)))

(declare-fun b!1140269 () Bool)

(declare-fun Unit!37389 () Unit!37385)

(assert (=> b!1140269 (= e!648755 Unit!37389)))

(declare-fun b!1140270 () Bool)

(assert (=> b!1140270 (= e!648754 (= call!50875 call!50880))))

(declare-fun b!1140271 () Bool)

(declare-fun res!760294 () Bool)

(assert (=> b!1140271 (=> (not res!760294) (not e!648757))))

(assert (=> b!1140271 (= res!760294 (arrayNoDuplicates!0 lt!507703 #b00000000000000000000000000000000 Nil!24933))))

(declare-fun b!1140272 () Bool)

(declare-fun res!760296 () Bool)

(assert (=> b!1140272 (=> (not res!760296) (not e!648752))))

(assert (=> b!1140272 (= res!760296 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36257 _keys!1208))))))

(declare-fun bm!50873 () Bool)

(assert (=> bm!50873 (= call!50880 (getCurrentListMapNoExtraKeys!4572 (ite c!111862 lt!507703 _keys!1208) (ite c!111862 lt!507693 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!760301 () Bool)

(assert (=> start!98506 (=> (not res!760301) (not e!648752))))

(assert (=> start!98506 (= res!760301 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36257 _keys!1208))))))

(assert (=> start!98506 e!648752))

(assert (=> start!98506 tp_is_empty!28641))

(declare-fun array_inv!27382 (array!74141) Bool)

(assert (=> start!98506 (array_inv!27382 _keys!1208)))

(assert (=> start!98506 true))

(assert (=> start!98506 tp!85044))

(declare-fun array_inv!27383 (array!74143) Bool)

(assert (=> start!98506 (and (array_inv!27383 _values!996) e!648756)))

(declare-fun mapIsEmpty!44786 () Bool)

(assert (=> mapIsEmpty!44786 mapRes!44786))

(declare-fun b!1140273 () Bool)

(assert (=> b!1140273 (= e!648746 e!648758)))

(declare-fun res!760305 () Bool)

(assert (=> b!1140273 (=> res!760305 e!648758)))

(assert (=> b!1140273 (= res!760305 (not (= from!1455 i!673)))))

(declare-fun lt!507700 () ListLongMap!16149)

(assert (=> b!1140273 (= lt!507700 (getCurrentListMapNoExtraKeys!4572 lt!507703 lt!507693 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1140273 (= lt!507693 (array!74144 (store (arr!35722 _values!996) i!673 (ValueCellFull!13611 lt!507707)) (size!36258 _values!996)))))

(declare-fun dynLambda!2620 (Int (_ BitVec 64)) V!43315)

(assert (=> b!1140273 (= lt!507707 (dynLambda!2620 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507704 () ListLongMap!16149)

(assert (=> b!1140273 (= lt!507704 (getCurrentListMapNoExtraKeys!4572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140274 () Bool)

(declare-fun res!760306 () Bool)

(assert (=> b!1140274 (=> (not res!760306) (not e!648752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140274 (= res!760306 (validMask!0 mask!1564))))

(declare-fun b!1140275 () Bool)

(assert (=> b!1140275 (= e!648750 tp_is_empty!28641)))

(declare-fun b!1140276 () Bool)

(declare-fun res!760295 () Bool)

(assert (=> b!1140276 (=> (not res!760295) (not e!648752))))

(assert (=> b!1140276 (= res!760295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50878 () Bool)

(assert (=> bm!50878 (= call!50881 (contains!6625 (ite c!111857 lt!507699 call!50879) k0!934))))

(assert (= (and start!98506 res!760301) b!1140274))

(assert (= (and b!1140274 res!760306) b!1140267))

(assert (= (and b!1140267 res!760297) b!1140276))

(assert (= (and b!1140276 res!760295) b!1140260))

(assert (= (and b!1140260 res!760300) b!1140272))

(assert (= (and b!1140272 res!760296) b!1140248))

(assert (= (and b!1140248 res!760307) b!1140257))

(assert (= (and b!1140257 res!760299) b!1140251))

(assert (= (and b!1140251 res!760302) b!1140271))

(assert (= (and b!1140271 res!760294) b!1140256))

(assert (= (and b!1140256 (not res!760303)) b!1140273))

(assert (= (and b!1140273 (not res!760305)) b!1140258))

(assert (= (and b!1140258 c!111862) b!1140259))

(assert (= (and b!1140258 (not c!111862)) b!1140270))

(assert (= (or b!1140259 b!1140270) bm!50872))

(assert (= (or b!1140259 b!1140270) bm!50873))

(assert (= (and b!1140258 (not res!760298)) b!1140250))

(assert (= (and b!1140250 c!111858) b!1140264))

(assert (= (and b!1140250 (not c!111858)) b!1140268))

(assert (= (and b!1140264 c!111857) b!1140261))

(assert (= (and b!1140264 (not c!111857)) b!1140265))

(assert (= (and b!1140265 c!111860) b!1140249))

(assert (= (and b!1140265 (not c!111860)) b!1140266))

(assert (= (and b!1140266 c!111859) b!1140252))

(assert (= (and b!1140266 (not c!111859)) b!1140269))

(assert (= (or b!1140249 b!1140252) bm!50876))

(assert (= (or b!1140249 b!1140252) bm!50874))

(assert (= (or b!1140249 b!1140252) bm!50877))

(assert (= (or b!1140261 bm!50877) bm!50878))

(assert (= (or b!1140261 bm!50876) bm!50871))

(assert (= (or b!1140261 bm!50874) bm!50875))

(assert (= (and b!1140264 c!111861) b!1140255))

(assert (= (and b!1140264 (not c!111861)) b!1140253))

(assert (= (and b!1140264 res!760304) b!1140262))

(assert (= (and b!1140254 condMapEmpty!44786) mapIsEmpty!44786))

(assert (= (and b!1140254 (not condMapEmpty!44786)) mapNonEmpty!44786))

(get-info :version)

(assert (= (and mapNonEmpty!44786 ((_ is ValueCellFull!13611) mapValue!44786)) b!1140275))

(assert (= (and b!1140254 ((_ is ValueCellFull!13611) mapDefault!44786)) b!1140263))

(assert (= start!98506 b!1140254))

(declare-fun b_lambda!19217 () Bool)

(assert (=> (not b_lambda!19217) (not b!1140273)))

(declare-fun t!36037 () Bool)

(declare-fun tb!8923 () Bool)

(assert (=> (and start!98506 (= defaultEntry!1004 defaultEntry!1004) t!36037) tb!8923))

(declare-fun result!18411 () Bool)

(assert (=> tb!8923 (= result!18411 tp_is_empty!28641)))

(assert (=> b!1140273 t!36037))

(declare-fun b_and!39073 () Bool)

(assert (= b_and!39071 (and (=> t!36037 result!18411) b_and!39073)))

(declare-fun m!1051781 () Bool)

(assert (=> b!1140255 m!1051781))

(declare-fun m!1051783 () Bool)

(assert (=> b!1140251 m!1051783))

(declare-fun m!1051785 () Bool)

(assert (=> b!1140251 m!1051785))

(declare-fun m!1051787 () Bool)

(assert (=> b!1140257 m!1051787))

(declare-fun m!1051789 () Bool)

(assert (=> b!1140274 m!1051789))

(declare-fun m!1051791 () Bool)

(assert (=> b!1140256 m!1051791))

(declare-fun m!1051793 () Bool)

(assert (=> b!1140256 m!1051793))

(declare-fun m!1051795 () Bool)

(assert (=> bm!50878 m!1051795))

(declare-fun m!1051797 () Bool)

(assert (=> bm!50872 m!1051797))

(declare-fun m!1051799 () Bool)

(assert (=> start!98506 m!1051799))

(declare-fun m!1051801 () Bool)

(assert (=> start!98506 m!1051801))

(declare-fun m!1051803 () Bool)

(assert (=> b!1140250 m!1051803))

(declare-fun m!1051805 () Bool)

(assert (=> b!1140250 m!1051805))

(declare-fun m!1051807 () Bool)

(assert (=> b!1140250 m!1051807))

(assert (=> b!1140250 m!1051803))

(declare-fun m!1051809 () Bool)

(assert (=> b!1140250 m!1051809))

(declare-fun m!1051811 () Bool)

(assert (=> b!1140250 m!1051811))

(declare-fun m!1051813 () Bool)

(assert (=> b!1140250 m!1051813))

(assert (=> b!1140250 m!1051809))

(assert (=> b!1140250 m!1051811))

(declare-fun m!1051815 () Bool)

(assert (=> b!1140250 m!1051815))

(declare-fun m!1051817 () Bool)

(assert (=> b!1140250 m!1051817))

(assert (=> b!1140250 m!1051811))

(declare-fun m!1051819 () Bool)

(assert (=> b!1140276 m!1051819))

(declare-fun m!1051821 () Bool)

(assert (=> b!1140248 m!1051821))

(assert (=> b!1140258 m!1051811))

(declare-fun m!1051823 () Bool)

(assert (=> b!1140258 m!1051823))

(declare-fun m!1051825 () Bool)

(assert (=> bm!50871 m!1051825))

(declare-fun m!1051827 () Bool)

(assert (=> b!1140273 m!1051827))

(declare-fun m!1051829 () Bool)

(assert (=> b!1140273 m!1051829))

(declare-fun m!1051831 () Bool)

(assert (=> b!1140273 m!1051831))

(declare-fun m!1051833 () Bool)

(assert (=> b!1140273 m!1051833))

(declare-fun m!1051835 () Bool)

(assert (=> b!1140260 m!1051835))

(declare-fun m!1051837 () Bool)

(assert (=> b!1140259 m!1051837))

(declare-fun m!1051839 () Bool)

(assert (=> b!1140264 m!1051839))

(declare-fun m!1051841 () Bool)

(assert (=> b!1140264 m!1051841))

(declare-fun m!1051843 () Bool)

(assert (=> b!1140264 m!1051843))

(declare-fun m!1051845 () Bool)

(assert (=> b!1140264 m!1051845))

(declare-fun m!1051847 () Bool)

(assert (=> b!1140271 m!1051847))

(assert (=> b!1140262 m!1051781))

(declare-fun m!1051849 () Bool)

(assert (=> b!1140261 m!1051849))

(assert (=> b!1140261 m!1051849))

(declare-fun m!1051851 () Bool)

(assert (=> b!1140261 m!1051851))

(declare-fun m!1051853 () Bool)

(assert (=> b!1140261 m!1051853))

(declare-fun m!1051855 () Bool)

(assert (=> bm!50875 m!1051855))

(declare-fun m!1051857 () Bool)

(assert (=> bm!50873 m!1051857))

(declare-fun m!1051859 () Bool)

(assert (=> mapNonEmpty!44786 m!1051859))

(check-sat (not b!1140261) (not bm!50873) (not b!1140251) (not b_lambda!19217) (not b!1140256) (not b!1140274) (not b!1140250) (not b!1140259) (not bm!50878) (not b!1140271) (not b!1140255) tp_is_empty!28641 (not bm!50875) (not b!1140262) (not bm!50871) (not start!98506) (not b!1140264) (not b!1140260) (not b!1140276) (not b!1140273) (not mapNonEmpty!44786) (not b!1140258) (not b_next!24111) (not bm!50872) b_and!39073 (not b!1140248))
(check-sat b_and!39073 (not b_next!24111))
