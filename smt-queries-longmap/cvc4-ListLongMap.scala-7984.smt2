; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98748 () Bool)

(assert start!98748)

(declare-fun b_free!24353 () Bool)

(declare-fun b_next!24353 () Bool)

(assert (=> start!98748 (= b_free!24353 (not b_next!24353))))

(declare-fun tp!85769 () Bool)

(declare-fun b_and!39555 () Bool)

(assert (=> start!98748 (= tp!85769 b_and!39555)))

(declare-fun b!1151250 () Bool)

(declare-fun res!765616 () Bool)

(declare-fun e!654790 () Bool)

(assert (=> b!1151250 (=> (not res!765616) (not e!654790))))

(declare-datatypes ((array!74613 0))(
  ( (array!74614 (arr!35957 (Array (_ BitVec 32) (_ BitVec 64))) (size!36493 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74613)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1151250 (= res!765616 (= (select (arr!35957 _keys!1208) i!673) k!934))))

(declare-fun b!1151251 () Bool)

(declare-fun e!654786 () Bool)

(declare-fun e!654792 () Bool)

(assert (=> b!1151251 (= e!654786 e!654792)))

(declare-fun res!765617 () Bool)

(assert (=> b!1151251 (=> res!765617 e!654792)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1151251 (= res!765617 (not (= (select (arr!35957 _keys!1208) from!1455) k!934)))))

(declare-fun e!654799 () Bool)

(assert (=> b!1151251 e!654799))

(declare-fun c!114035 () Bool)

(assert (=> b!1151251 (= c!114035 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43637 0))(
  ( (V!43638 (val!14498 Int)) )
))
(declare-fun zeroValue!944 () V!43637)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37869 0))(
  ( (Unit!37870) )
))
(declare-fun lt!515403 () Unit!37869)

(declare-datatypes ((ValueCell!13732 0))(
  ( (ValueCellFull!13732 (v!17135 V!43637)) (EmptyCell!13732) )
))
(declare-datatypes ((array!74615 0))(
  ( (array!74616 (arr!35958 (Array (_ BitVec 32) ValueCell!13732)) (size!36494 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74615)

(declare-fun minValue!944 () V!43637)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!571 (array!74613 array!74615 (_ BitVec 32) (_ BitVec 32) V!43637 V!43637 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37869)

(assert (=> b!1151251 (= lt!515403 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!571 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151252 () Bool)

(assert (=> b!1151252 (= e!654792 true)))

(declare-fun e!654796 () Bool)

(assert (=> b!1151252 e!654796))

(declare-fun res!765615 () Bool)

(assert (=> b!1151252 (=> (not res!765615) (not e!654796))))

(declare-datatypes ((tuple2!18406 0))(
  ( (tuple2!18407 (_1!9214 (_ BitVec 64)) (_2!9214 V!43637)) )
))
(declare-datatypes ((List!25154 0))(
  ( (Nil!25151) (Cons!25150 (h!26359 tuple2!18406) (t!36499 List!25154)) )
))
(declare-datatypes ((ListLongMap!16375 0))(
  ( (ListLongMap!16376 (toList!8203 List!25154)) )
))
(declare-fun lt!515402 () ListLongMap!16375)

(declare-fun lt!515393 () ListLongMap!16375)

(assert (=> b!1151252 (= res!765615 (= lt!515402 lt!515393))))

(declare-fun lt!515399 () ListLongMap!16375)

(declare-fun -!1334 (ListLongMap!16375 (_ BitVec 64)) ListLongMap!16375)

(assert (=> b!1151252 (= lt!515402 (-!1334 lt!515399 k!934))))

(declare-fun lt!515388 () V!43637)

(declare-fun +!3621 (ListLongMap!16375 tuple2!18406) ListLongMap!16375)

(assert (=> b!1151252 (= (-!1334 (+!3621 lt!515393 (tuple2!18407 (select (arr!35957 _keys!1208) from!1455) lt!515388)) (select (arr!35957 _keys!1208) from!1455)) lt!515393)))

(declare-fun lt!515387 () Unit!37869)

(declare-fun addThenRemoveForNewKeyIsSame!177 (ListLongMap!16375 (_ BitVec 64) V!43637) Unit!37869)

(assert (=> b!1151252 (= lt!515387 (addThenRemoveForNewKeyIsSame!177 lt!515393 (select (arr!35957 _keys!1208) from!1455) lt!515388))))

(declare-fun lt!515394 () V!43637)

(declare-fun get!18307 (ValueCell!13732 V!43637) V!43637)

(assert (=> b!1151252 (= lt!515388 (get!18307 (select (arr!35958 _values!996) from!1455) lt!515394))))

(declare-fun lt!515382 () Unit!37869)

(declare-fun e!654798 () Unit!37869)

(assert (=> b!1151252 (= lt!515382 e!654798)))

(declare-fun c!114037 () Bool)

(declare-fun contains!6722 (ListLongMap!16375 (_ BitVec 64)) Bool)

(assert (=> b!1151252 (= c!114037 (contains!6722 lt!515393 k!934))))

(declare-fun getCurrentListMapNoExtraKeys!4675 (array!74613 array!74615 (_ BitVec 32) (_ BitVec 32) V!43637 V!43637 (_ BitVec 32) Int) ListLongMap!16375)

(assert (=> b!1151252 (= lt!515393 (getCurrentListMapNoExtraKeys!4675 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151253 () Bool)

(declare-fun res!765618 () Bool)

(assert (=> b!1151253 (=> (not res!765618) (not e!654790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151253 (= res!765618 (validMask!0 mask!1564))))

(declare-fun b!1151254 () Bool)

(declare-fun res!765614 () Bool)

(declare-fun e!654787 () Bool)

(assert (=> b!1151254 (=> (not res!765614) (not e!654787))))

(declare-fun lt!515400 () array!74613)

(declare-datatypes ((List!25155 0))(
  ( (Nil!25152) (Cons!25151 (h!26360 (_ BitVec 64)) (t!36500 List!25155)) )
))
(declare-fun arrayNoDuplicates!0 (array!74613 (_ BitVec 32) List!25155) Bool)

(assert (=> b!1151254 (= res!765614 (arrayNoDuplicates!0 lt!515400 #b00000000000000000000000000000000 Nil!25152))))

(declare-fun b!1151255 () Bool)

(declare-fun call!53785 () ListLongMap!16375)

(declare-fun call!53781 () ListLongMap!16375)

(assert (=> b!1151255 (= e!654799 (= call!53785 (-!1334 call!53781 k!934)))))

(declare-fun b!1151256 () Bool)

(declare-fun res!765613 () Bool)

(assert (=> b!1151256 (=> (not res!765613) (not e!654790))))

(assert (=> b!1151256 (= res!765613 (and (= (size!36494 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36493 _keys!1208) (size!36494 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45149 () Bool)

(declare-fun mapRes!45149 () Bool)

(declare-fun tp!85770 () Bool)

(declare-fun e!654785 () Bool)

(assert (=> mapNonEmpty!45149 (= mapRes!45149 (and tp!85770 e!654785))))

(declare-fun mapRest!45149 () (Array (_ BitVec 32) ValueCell!13732))

(declare-fun mapKey!45149 () (_ BitVec 32))

(declare-fun mapValue!45149 () ValueCell!13732)

(assert (=> mapNonEmpty!45149 (= (arr!35958 _values!996) (store mapRest!45149 mapKey!45149 mapValue!45149))))

(declare-fun b!1151257 () Bool)

(declare-fun e!654801 () Unit!37869)

(declare-fun Unit!37871 () Unit!37869)

(assert (=> b!1151257 (= e!654801 Unit!37871)))

(declare-fun b!1151258 () Bool)

(declare-fun e!654794 () Bool)

(declare-fun tp_is_empty!28883 () Bool)

(assert (=> b!1151258 (= e!654794 tp_is_empty!28883)))

(declare-fun b!1151259 () Bool)

(declare-fun res!765612 () Bool)

(assert (=> b!1151259 (=> (not res!765612) (not e!654790))))

(assert (=> b!1151259 (= res!765612 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36493 _keys!1208))))))

(declare-fun b!1151260 () Bool)

(declare-fun Unit!37872 () Unit!37869)

(assert (=> b!1151260 (= e!654798 Unit!37872)))

(declare-fun lt!515397 () Bool)

(assert (=> b!1151260 (= lt!515397 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114038 () Bool)

(assert (=> b!1151260 (= c!114038 (and (not lt!515397) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515383 () Unit!37869)

(declare-fun e!654791 () Unit!37869)

(assert (=> b!1151260 (= lt!515383 e!654791)))

(declare-fun lt!515384 () Unit!37869)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!463 (array!74613 array!74615 (_ BitVec 32) (_ BitVec 32) V!43637 V!43637 (_ BitVec 64) (_ BitVec 32) Int) Unit!37869)

(assert (=> b!1151260 (= lt!515384 (lemmaListMapContainsThenArrayContainsFrom!463 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114036 () Bool)

(assert (=> b!1151260 (= c!114036 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765619 () Bool)

(declare-fun e!654800 () Bool)

(assert (=> b!1151260 (= res!765619 e!654800)))

(declare-fun e!654789 () Bool)

(assert (=> b!1151260 (=> (not res!765619) (not e!654789))))

(assert (=> b!1151260 e!654789))

(declare-fun lt!515391 () Unit!37869)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74613 (_ BitVec 32) (_ BitVec 32)) Unit!37869)

(assert (=> b!1151260 (= lt!515391 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151260 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25152)))

(declare-fun lt!515389 () Unit!37869)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74613 (_ BitVec 64) (_ BitVec 32) List!25155) Unit!37869)

(assert (=> b!1151260 (= lt!515389 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25152))))

(assert (=> b!1151260 false))

(declare-fun b!1151261 () Bool)

(assert (=> b!1151261 (= e!654785 tp_is_empty!28883)))

(declare-fun b!1151262 () Bool)

(declare-fun Unit!37873 () Unit!37869)

(assert (=> b!1151262 (= e!654798 Unit!37873)))

(declare-fun b!1151263 () Bool)

(assert (=> b!1151263 (= e!654790 e!654787)))

(declare-fun res!765620 () Bool)

(assert (=> b!1151263 (=> (not res!765620) (not e!654787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74613 (_ BitVec 32)) Bool)

(assert (=> b!1151263 (= res!765620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515400 mask!1564))))

(assert (=> b!1151263 (= lt!515400 (array!74614 (store (arr!35957 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36493 _keys!1208)))))

(declare-fun b!1151264 () Bool)

(assert (=> b!1151264 (= e!654799 (= call!53785 call!53781))))

(declare-fun b!1151265 () Bool)

(declare-fun e!654797 () Unit!37869)

(declare-fun lt!515386 () Unit!37869)

(assert (=> b!1151265 (= e!654797 lt!515386)))

(declare-fun call!53784 () Unit!37869)

(assert (=> b!1151265 (= lt!515386 call!53784)))

(declare-fun call!53778 () Bool)

(assert (=> b!1151265 call!53778))

(declare-fun b!1151266 () Bool)

(declare-fun e!654788 () Bool)

(assert (=> b!1151266 (= e!654788 e!654786)))

(declare-fun res!765610 () Bool)

(assert (=> b!1151266 (=> res!765610 e!654786)))

(assert (=> b!1151266 (= res!765610 (not (= from!1455 i!673)))))

(declare-fun lt!515396 () ListLongMap!16375)

(declare-fun lt!515401 () array!74615)

(assert (=> b!1151266 (= lt!515396 (getCurrentListMapNoExtraKeys!4675 lt!515400 lt!515401 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1151266 (= lt!515401 (array!74616 (store (arr!35958 _values!996) i!673 (ValueCellFull!13732 lt!515394)) (size!36494 _values!996)))))

(declare-fun dynLambda!2698 (Int (_ BitVec 64)) V!43637)

(assert (=> b!1151266 (= lt!515394 (dynLambda!2698 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1151266 (= lt!515399 (getCurrentListMapNoExtraKeys!4675 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45149 () Bool)

(assert (=> mapIsEmpty!45149 mapRes!45149))

(declare-fun bm!53775 () Bool)

(declare-fun call!53779 () Bool)

(assert (=> bm!53775 (= call!53778 call!53779)))

(declare-fun b!1151267 () Bool)

(declare-fun res!765609 () Bool)

(assert (=> b!1151267 (=> (not res!765609) (not e!654790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151267 (= res!765609 (validKeyInArray!0 k!934))))

(declare-fun bm!53776 () Bool)

(assert (=> bm!53776 (= call!53785 (getCurrentListMapNoExtraKeys!4675 lt!515400 lt!515401 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151268 () Bool)

(declare-fun e!654795 () Bool)

(assert (=> b!1151268 (= e!654795 (and e!654794 mapRes!45149))))

(declare-fun condMapEmpty!45149 () Bool)

(declare-fun mapDefault!45149 () ValueCell!13732)

