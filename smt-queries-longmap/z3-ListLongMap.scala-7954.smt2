; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98566 () Bool)

(assert start!98566)

(declare-fun b_free!24171 () Bool)

(declare-fun b_next!24171 () Bool)

(assert (=> start!98566 (= b_free!24171 (not b_next!24171))))

(declare-fun tp!85223 () Bool)

(declare-fun b_and!39191 () Bool)

(assert (=> start!98566 (= tp!85223 b_and!39191)))

(declare-fun b!1142918 () Bool)

(declare-datatypes ((Unit!37498 0))(
  ( (Unit!37499) )
))
(declare-fun e!650190 () Unit!37498)

(declare-fun Unit!37500 () Unit!37498)

(assert (=> b!1142918 (= e!650190 Unit!37500)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1142919 () Bool)

(declare-fun lt!509595 () Bool)

(declare-fun e!650184 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1142919 (= e!650184 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509595) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1142920 () Bool)

(declare-fun Unit!37501 () Unit!37498)

(assert (=> b!1142920 (= e!650190 Unit!37501)))

(assert (=> b!1142920 (= lt!509595 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112399 () Bool)

(assert (=> b!1142920 (= c!112399 (and (not lt!509595) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509594 () Unit!37498)

(declare-fun e!650192 () Unit!37498)

(assert (=> b!1142920 (= lt!509594 e!650192)))

(declare-datatypes ((V!43395 0))(
  ( (V!43396 (val!14407 Int)) )
))
(declare-fun zeroValue!944 () V!43395)

(declare-datatypes ((array!74255 0))(
  ( (array!74256 (arr!35778 (Array (_ BitVec 32) (_ BitVec 64))) (size!36314 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74255)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!509588 () Unit!37498)

(declare-datatypes ((ValueCell!13641 0))(
  ( (ValueCellFull!13641 (v!17044 V!43395)) (EmptyCell!13641) )
))
(declare-datatypes ((array!74257 0))(
  ( (array!74258 (arr!35779 (Array (_ BitVec 32) ValueCell!13641)) (size!36315 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74257)

(declare-fun minValue!944 () V!43395)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!397 (array!74255 array!74257 (_ BitVec 32) (_ BitVec 32) V!43395 V!43395 (_ BitVec 64) (_ BitVec 32) Int) Unit!37498)

(assert (=> b!1142920 (= lt!509588 (lemmaListMapContainsThenArrayContainsFrom!397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112402 () Bool)

(assert (=> b!1142920 (= c!112402 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761566 () Bool)

(assert (=> b!1142920 (= res!761566 e!650184)))

(declare-fun e!650193 () Bool)

(assert (=> b!1142920 (=> (not res!761566) (not e!650193))))

(assert (=> b!1142920 e!650193))

(declare-fun lt!509582 () Unit!37498)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74255 (_ BitVec 32) (_ BitVec 32)) Unit!37498)

(assert (=> b!1142920 (= lt!509582 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24987 0))(
  ( (Nil!24984) (Cons!24983 (h!26192 (_ BitVec 64)) (t!36150 List!24987)) )
))
(declare-fun arrayNoDuplicates!0 (array!74255 (_ BitVec 32) List!24987) Bool)

(assert (=> b!1142920 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24984)))

(declare-fun lt!509589 () Unit!37498)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74255 (_ BitVec 64) (_ BitVec 32) List!24987) Unit!37498)

(assert (=> b!1142920 (= lt!509589 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24984))))

(assert (=> b!1142920 false))

(declare-fun b!1142921 () Bool)

(declare-fun res!761562 () Bool)

(declare-fun e!650195 () Bool)

(assert (=> b!1142921 (=> (not res!761562) (not e!650195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74255 (_ BitVec 32)) Bool)

(assert (=> b!1142921 (= res!761562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1142922 () Bool)

(declare-fun res!761563 () Bool)

(assert (=> b!1142922 (=> (not res!761563) (not e!650195))))

(assert (=> b!1142922 (= res!761563 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24984))))

(declare-fun mapNonEmpty!44876 () Bool)

(declare-fun mapRes!44876 () Bool)

(declare-fun tp!85224 () Bool)

(declare-fun e!650188 () Bool)

(assert (=> mapNonEmpty!44876 (= mapRes!44876 (and tp!85224 e!650188))))

(declare-fun mapKey!44876 () (_ BitVec 32))

(declare-fun mapValue!44876 () ValueCell!13641)

(declare-fun mapRest!44876 () (Array (_ BitVec 32) ValueCell!13641))

(assert (=> mapNonEmpty!44876 (= (arr!35779 _values!996) (store mapRest!44876 mapKey!44876 mapValue!44876))))

(declare-fun b!1142923 () Bool)

(declare-fun res!761555 () Bool)

(declare-fun e!650198 () Bool)

(assert (=> b!1142923 (=> (not res!761555) (not e!650198))))

(declare-fun lt!509584 () array!74255)

(assert (=> b!1142923 (= res!761555 (arrayNoDuplicates!0 lt!509584 #b00000000000000000000000000000000 Nil!24984))))

(declare-fun b!1142924 () Bool)

(declare-fun res!761567 () Bool)

(assert (=> b!1142924 (=> (not res!761567) (not e!650195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1142924 (= res!761567 (validMask!0 mask!1564))))

(declare-fun bm!51591 () Bool)

(declare-fun call!51598 () Unit!37498)

(declare-fun call!51596 () Unit!37498)

(assert (=> bm!51591 (= call!51598 call!51596)))

(declare-fun b!1142925 () Bool)

(declare-fun tp_is_empty!28701 () Bool)

(assert (=> b!1142925 (= e!650188 tp_is_empty!28701)))

(declare-fun b!1142926 () Bool)

(declare-fun e!650187 () Bool)

(assert (=> b!1142926 (= e!650187 true)))

(declare-fun lt!509578 () V!43395)

(declare-datatypes ((tuple2!18234 0))(
  ( (tuple2!18235 (_1!9128 (_ BitVec 64)) (_2!9128 V!43395)) )
))
(declare-datatypes ((List!24988 0))(
  ( (Nil!24985) (Cons!24984 (h!26193 tuple2!18234) (t!36151 List!24988)) )
))
(declare-datatypes ((ListLongMap!16203 0))(
  ( (ListLongMap!16204 (toList!8117 List!24988)) )
))
(declare-fun lt!509581 () ListLongMap!16203)

(declare-fun -!1263 (ListLongMap!16203 (_ BitVec 64)) ListLongMap!16203)

(declare-fun +!3546 (ListLongMap!16203 tuple2!18234) ListLongMap!16203)

(assert (=> b!1142926 (= (-!1263 (+!3546 lt!509581 (tuple2!18235 (select (arr!35778 _keys!1208) from!1455) lt!509578)) (select (arr!35778 _keys!1208) from!1455)) lt!509581)))

(declare-fun lt!509596 () Unit!37498)

(declare-fun addThenRemoveForNewKeyIsSame!115 (ListLongMap!16203 (_ BitVec 64) V!43395) Unit!37498)

(assert (=> b!1142926 (= lt!509596 (addThenRemoveForNewKeyIsSame!115 lt!509581 (select (arr!35778 _keys!1208) from!1455) lt!509578))))

(declare-fun lt!509592 () V!43395)

(declare-fun get!18185 (ValueCell!13641 V!43395) V!43395)

(assert (=> b!1142926 (= lt!509578 (get!18185 (select (arr!35779 _values!996) from!1455) lt!509592))))

(declare-fun lt!509587 () Unit!37498)

(assert (=> b!1142926 (= lt!509587 e!650190)))

(declare-fun c!112397 () Bool)

(declare-fun contains!6649 (ListLongMap!16203 (_ BitVec 64)) Bool)

(assert (=> b!1142926 (= c!112397 (contains!6649 lt!509581 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4597 (array!74255 array!74257 (_ BitVec 32) (_ BitVec 32) V!43395 V!43395 (_ BitVec 32) Int) ListLongMap!16203)

(assert (=> b!1142926 (= lt!509581 (getCurrentListMapNoExtraKeys!4597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142927 () Bool)

(declare-fun c!112401 () Bool)

(assert (=> b!1142927 (= c!112401 (and (not lt!509595) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650194 () Unit!37498)

(assert (=> b!1142927 (= e!650192 e!650194)))

(declare-fun bm!51592 () Bool)

(declare-fun call!51595 () Bool)

(declare-fun call!51594 () Bool)

(assert (=> bm!51592 (= call!51595 call!51594)))

(declare-fun b!1142928 () Bool)

(declare-fun res!761561 () Bool)

(assert (=> b!1142928 (=> (not res!761561) (not e!650195))))

(assert (=> b!1142928 (= res!761561 (and (= (size!36315 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36314 _keys!1208) (size!36315 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!51593 () Bool)

(declare-fun call!51599 () ListLongMap!16203)

(declare-fun lt!509580 () array!74257)

(assert (=> bm!51593 (= call!51599 (getCurrentListMapNoExtraKeys!4597 lt!509584 lt!509580 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142929 () Bool)

(declare-fun arrayContainsKey!0 (array!74255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1142929 (= e!650184 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142930 () Bool)

(declare-fun e!650197 () Bool)

(declare-fun e!650189 () Bool)

(assert (=> b!1142930 (= e!650197 e!650189)))

(declare-fun res!761564 () Bool)

(assert (=> b!1142930 (=> res!761564 e!650189)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1142930 (= res!761564 (not (= from!1455 i!673)))))

(declare-fun lt!509586 () ListLongMap!16203)

(assert (=> b!1142930 (= lt!509586 (getCurrentListMapNoExtraKeys!4597 lt!509584 lt!509580 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1142930 (= lt!509580 (array!74258 (store (arr!35779 _values!996) i!673 (ValueCellFull!13641 lt!509592)) (size!36315 _values!996)))))

(declare-fun dynLambda!2637 (Int (_ BitVec 64)) V!43395)

(assert (=> b!1142930 (= lt!509592 (dynLambda!2637 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509597 () ListLongMap!16203)

(assert (=> b!1142930 (= lt!509597 (getCurrentListMapNoExtraKeys!4597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!51597 () ListLongMap!16203)

(declare-fun bm!51594 () Bool)

(assert (=> bm!51594 (= call!51597 (getCurrentListMapNoExtraKeys!4597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142931 () Bool)

(declare-fun e!650186 () Bool)

(declare-fun e!650199 () Bool)

(assert (=> b!1142931 (= e!650186 (and e!650199 mapRes!44876))))

(declare-fun condMapEmpty!44876 () Bool)

(declare-fun mapDefault!44876 () ValueCell!13641)

(assert (=> b!1142931 (= condMapEmpty!44876 (= (arr!35779 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13641)) mapDefault!44876)))))

(declare-fun b!1142932 () Bool)

(assert (=> b!1142932 (= e!650199 tp_is_empty!28701)))

(declare-fun b!1142933 () Bool)

(declare-fun call!51601 () ListLongMap!16203)

(assert (=> b!1142933 (contains!6649 call!51601 k0!934)))

(declare-fun lt!509593 () Unit!37498)

(declare-fun lt!509590 () ListLongMap!16203)

(declare-fun addStillContains!802 (ListLongMap!16203 (_ BitVec 64) V!43395 (_ BitVec 64)) Unit!37498)

(assert (=> b!1142933 (= lt!509593 (addStillContains!802 lt!509590 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1142933 call!51594))

(assert (=> b!1142933 (= lt!509590 (+!3546 lt!509581 (tuple2!18235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509579 () Unit!37498)

(assert (=> b!1142933 (= lt!509579 call!51596)))

(assert (=> b!1142933 (= e!650192 lt!509593)))

(declare-fun b!1142934 () Bool)

(assert (=> b!1142934 (= e!650195 e!650198)))

(declare-fun res!761560 () Bool)

(assert (=> b!1142934 (=> (not res!761560) (not e!650198))))

(assert (=> b!1142934 (= res!761560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509584 mask!1564))))

(assert (=> b!1142934 (= lt!509584 (array!74256 (store (arr!35778 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36314 _keys!1208)))))

(declare-fun b!1142935 () Bool)

(declare-fun res!761557 () Bool)

(assert (=> b!1142935 (=> (not res!761557) (not e!650195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1142935 (= res!761557 (validKeyInArray!0 k0!934))))

(declare-fun b!1142936 () Bool)

(declare-fun e!650191 () Unit!37498)

(assert (=> b!1142936 (= e!650194 e!650191)))

(declare-fun c!112398 () Bool)

(assert (=> b!1142936 (= c!112398 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509595))))

(declare-fun mapIsEmpty!44876 () Bool)

(assert (=> mapIsEmpty!44876 mapRes!44876))

(declare-fun bm!51595 () Bool)

(assert (=> bm!51595 (= call!51596 (addStillContains!802 lt!509581 (ite (or c!112399 c!112401) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112399 c!112401) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1142937 () Bool)

(assert (=> b!1142937 (= e!650189 e!650187)))

(declare-fun res!761558 () Bool)

(assert (=> b!1142937 (=> res!761558 e!650187)))

(assert (=> b!1142937 (= res!761558 (not (= (select (arr!35778 _keys!1208) from!1455) k0!934)))))

(declare-fun e!650196 () Bool)

(assert (=> b!1142937 e!650196))

(declare-fun c!112400 () Bool)

(assert (=> b!1142937 (= c!112400 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509598 () Unit!37498)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!505 (array!74255 array!74257 (_ BitVec 32) (_ BitVec 32) V!43395 V!43395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37498)

(assert (=> b!1142937 (= lt!509598 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1142938 () Bool)

(assert (=> b!1142938 call!51595))

(declare-fun lt!509591 () Unit!37498)

(assert (=> b!1142938 (= lt!509591 call!51598)))

(assert (=> b!1142938 (= e!650191 lt!509591)))

(declare-fun b!1142939 () Bool)

(declare-fun Unit!37502 () Unit!37498)

(assert (=> b!1142939 (= e!650191 Unit!37502)))

(declare-fun b!1142940 () Bool)

(assert (=> b!1142940 (= e!650196 (= call!51599 (-!1263 call!51597 k0!934)))))

(declare-fun b!1142941 () Bool)

(assert (=> b!1142941 (= e!650193 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1142942 () Bool)

(assert (=> b!1142942 (= e!650198 (not e!650197))))

(declare-fun res!761554 () Bool)

(assert (=> b!1142942 (=> res!761554 e!650197)))

(assert (=> b!1142942 (= res!761554 (bvsgt from!1455 i!673))))

(assert (=> b!1142942 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509585 () Unit!37498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74255 (_ BitVec 64) (_ BitVec 32)) Unit!37498)

(assert (=> b!1142942 (= lt!509585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!51596 () Bool)

(declare-fun call!51600 () ListLongMap!16203)

(assert (=> bm!51596 (= call!51600 call!51601)))

(declare-fun bm!51597 () Bool)

(assert (=> bm!51597 (= call!51594 (contains!6649 (ite c!112399 lt!509590 call!51600) k0!934))))

(declare-fun b!1142943 () Bool)

(declare-fun lt!509583 () Unit!37498)

(assert (=> b!1142943 (= e!650194 lt!509583)))

(assert (=> b!1142943 (= lt!509583 call!51598)))

(assert (=> b!1142943 call!51595))

(declare-fun b!1142944 () Bool)

(assert (=> b!1142944 (= e!650196 (= call!51599 call!51597))))

(declare-fun b!1142945 () Bool)

(declare-fun res!761559 () Bool)

(assert (=> b!1142945 (=> (not res!761559) (not e!650195))))

(assert (=> b!1142945 (= res!761559 (= (select (arr!35778 _keys!1208) i!673) k0!934))))

(declare-fun b!1142946 () Bool)

(declare-fun res!761556 () Bool)

(assert (=> b!1142946 (=> (not res!761556) (not e!650195))))

(assert (=> b!1142946 (= res!761556 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36314 _keys!1208))))))

(declare-fun res!761565 () Bool)

(assert (=> start!98566 (=> (not res!761565) (not e!650195))))

(assert (=> start!98566 (= res!761565 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36314 _keys!1208))))))

(assert (=> start!98566 e!650195))

(assert (=> start!98566 tp_is_empty!28701))

(declare-fun array_inv!27416 (array!74255) Bool)

(assert (=> start!98566 (array_inv!27416 _keys!1208)))

(assert (=> start!98566 true))

(assert (=> start!98566 tp!85223))

(declare-fun array_inv!27417 (array!74257) Bool)

(assert (=> start!98566 (and (array_inv!27417 _values!996) e!650186)))

(declare-fun bm!51598 () Bool)

(assert (=> bm!51598 (= call!51601 (+!3546 (ite c!112399 lt!509590 lt!509581) (ite c!112399 (tuple2!18235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112401 (tuple2!18235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and start!98566 res!761565) b!1142924))

(assert (= (and b!1142924 res!761567) b!1142928))

(assert (= (and b!1142928 res!761561) b!1142921))

(assert (= (and b!1142921 res!761562) b!1142922))

(assert (= (and b!1142922 res!761563) b!1142946))

(assert (= (and b!1142946 res!761556) b!1142935))

(assert (= (and b!1142935 res!761557) b!1142945))

(assert (= (and b!1142945 res!761559) b!1142934))

(assert (= (and b!1142934 res!761560) b!1142923))

(assert (= (and b!1142923 res!761555) b!1142942))

(assert (= (and b!1142942 (not res!761554)) b!1142930))

(assert (= (and b!1142930 (not res!761564)) b!1142937))

(assert (= (and b!1142937 c!112400) b!1142940))

(assert (= (and b!1142937 (not c!112400)) b!1142944))

(assert (= (or b!1142940 b!1142944) bm!51593))

(assert (= (or b!1142940 b!1142944) bm!51594))

(assert (= (and b!1142937 (not res!761558)) b!1142926))

(assert (= (and b!1142926 c!112397) b!1142920))

(assert (= (and b!1142926 (not c!112397)) b!1142918))

(assert (= (and b!1142920 c!112399) b!1142933))

(assert (= (and b!1142920 (not c!112399)) b!1142927))

(assert (= (and b!1142927 c!112401) b!1142943))

(assert (= (and b!1142927 (not c!112401)) b!1142936))

(assert (= (and b!1142936 c!112398) b!1142938))

(assert (= (and b!1142936 (not c!112398)) b!1142939))

(assert (= (or b!1142943 b!1142938) bm!51591))

(assert (= (or b!1142943 b!1142938) bm!51596))

(assert (= (or b!1142943 b!1142938) bm!51592))

(assert (= (or b!1142933 bm!51592) bm!51597))

(assert (= (or b!1142933 bm!51591) bm!51595))

(assert (= (or b!1142933 bm!51596) bm!51598))

(assert (= (and b!1142920 c!112402) b!1142929))

(assert (= (and b!1142920 (not c!112402)) b!1142919))

(assert (= (and b!1142920 res!761566) b!1142941))

(assert (= (and b!1142931 condMapEmpty!44876) mapIsEmpty!44876))

(assert (= (and b!1142931 (not condMapEmpty!44876)) mapNonEmpty!44876))

(get-info :version)

(assert (= (and mapNonEmpty!44876 ((_ is ValueCellFull!13641) mapValue!44876)) b!1142925))

(assert (= (and b!1142931 ((_ is ValueCellFull!13641) mapDefault!44876)) b!1142932))

(assert (= start!98566 b!1142931))

(declare-fun b_lambda!19277 () Bool)

(assert (=> (not b_lambda!19277) (not b!1142930)))

(declare-fun t!36149 () Bool)

(declare-fun tb!8983 () Bool)

(assert (=> (and start!98566 (= defaultEntry!1004 defaultEntry!1004) t!36149) tb!8983))

(declare-fun result!18531 () Bool)

(assert (=> tb!8983 (= result!18531 tp_is_empty!28701)))

(assert (=> b!1142930 t!36149))

(declare-fun b_and!39193 () Bool)

(assert (= b_and!39191 (and (=> t!36149 result!18531) b_and!39193)))

(declare-fun m!1054125 () Bool)

(assert (=> b!1142923 m!1054125))

(declare-fun m!1054127 () Bool)

(assert (=> b!1142929 m!1054127))

(declare-fun m!1054129 () Bool)

(assert (=> b!1142935 m!1054129))

(declare-fun m!1054131 () Bool)

(assert (=> b!1142933 m!1054131))

(declare-fun m!1054133 () Bool)

(assert (=> b!1142933 m!1054133))

(declare-fun m!1054135 () Bool)

(assert (=> b!1142933 m!1054135))

(declare-fun m!1054137 () Bool)

(assert (=> b!1142930 m!1054137))

(declare-fun m!1054139 () Bool)

(assert (=> b!1142930 m!1054139))

(declare-fun m!1054141 () Bool)

(assert (=> b!1142930 m!1054141))

(declare-fun m!1054143 () Bool)

(assert (=> b!1142930 m!1054143))

(declare-fun m!1054145 () Bool)

(assert (=> b!1142937 m!1054145))

(declare-fun m!1054147 () Bool)

(assert (=> b!1142937 m!1054147))

(declare-fun m!1054149 () Bool)

(assert (=> bm!51593 m!1054149))

(assert (=> b!1142941 m!1054127))

(declare-fun m!1054151 () Bool)

(assert (=> b!1142945 m!1054151))

(declare-fun m!1054153 () Bool)

(assert (=> b!1142926 m!1054153))

(assert (=> b!1142926 m!1054145))

(declare-fun m!1054155 () Bool)

(assert (=> b!1142926 m!1054155))

(declare-fun m!1054157 () Bool)

(assert (=> b!1142926 m!1054157))

(assert (=> b!1142926 m!1054145))

(declare-fun m!1054159 () Bool)

(assert (=> b!1142926 m!1054159))

(assert (=> b!1142926 m!1054153))

(declare-fun m!1054161 () Bool)

(assert (=> b!1142926 m!1054161))

(declare-fun m!1054163 () Bool)

(assert (=> b!1142926 m!1054163))

(assert (=> b!1142926 m!1054157))

(declare-fun m!1054165 () Bool)

(assert (=> b!1142926 m!1054165))

(assert (=> b!1142926 m!1054145))

(declare-fun m!1054167 () Bool)

(assert (=> bm!51597 m!1054167))

(declare-fun m!1054169 () Bool)

(assert (=> b!1142942 m!1054169))

(declare-fun m!1054171 () Bool)

(assert (=> b!1142942 m!1054171))

(assert (=> bm!51594 m!1054161))

(declare-fun m!1054173 () Bool)

(assert (=> b!1142940 m!1054173))

(declare-fun m!1054175 () Bool)

(assert (=> bm!51598 m!1054175))

(declare-fun m!1054177 () Bool)

(assert (=> b!1142921 m!1054177))

(declare-fun m!1054179 () Bool)

(assert (=> b!1142924 m!1054179))

(declare-fun m!1054181 () Bool)

(assert (=> bm!51595 m!1054181))

(declare-fun m!1054183 () Bool)

(assert (=> start!98566 m!1054183))

(declare-fun m!1054185 () Bool)

(assert (=> start!98566 m!1054185))

(declare-fun m!1054187 () Bool)

(assert (=> mapNonEmpty!44876 m!1054187))

(declare-fun m!1054189 () Bool)

(assert (=> b!1142934 m!1054189))

(declare-fun m!1054191 () Bool)

(assert (=> b!1142934 m!1054191))

(declare-fun m!1054193 () Bool)

(assert (=> b!1142920 m!1054193))

(declare-fun m!1054195 () Bool)

(assert (=> b!1142920 m!1054195))

(declare-fun m!1054197 () Bool)

(assert (=> b!1142920 m!1054197))

(declare-fun m!1054199 () Bool)

(assert (=> b!1142920 m!1054199))

(declare-fun m!1054201 () Bool)

(assert (=> b!1142922 m!1054201))

(check-sat (not start!98566) (not b_lambda!19277) (not b!1142937) (not bm!51595) (not bm!51597) tp_is_empty!28701 (not b!1142921) (not bm!51594) (not b!1142930) (not b!1142922) (not b!1142935) (not b!1142933) (not b!1142941) (not b!1142929) (not bm!51593) (not b!1142923) (not b!1142942) (not mapNonEmpty!44876) (not b!1142940) (not b!1142920) (not b!1142924) (not b_next!24171) (not b!1142934) b_and!39193 (not bm!51598) (not b!1142926))
(check-sat b_and!39193 (not b_next!24171))
