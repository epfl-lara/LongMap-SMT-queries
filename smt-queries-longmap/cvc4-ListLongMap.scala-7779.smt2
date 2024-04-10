; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97422 () Bool)

(assert start!97422)

(declare-fun b_free!23393 () Bool)

(declare-fun b_next!23393 () Bool)

(assert (=> start!97422 (= b_free!23393 (not b_next!23393))))

(declare-fun tp!82478 () Bool)

(declare-fun b_and!37623 () Bool)

(assert (=> start!97422 (= tp!82478 b_and!37623)))

(declare-fun b!1111231 () Bool)

(declare-fun res!741557 () Bool)

(declare-fun e!633670 () Bool)

(assert (=> b!1111231 (=> (not res!741557) (not e!633670))))

(declare-datatypes ((array!72223 0))(
  ( (array!72224 (arr!34764 (Array (_ BitVec 32) (_ BitVec 64))) (size!35300 (_ BitVec 32))) )
))
(declare-fun lt!496307 () array!72223)

(declare-datatypes ((List!24251 0))(
  ( (Nil!24248) (Cons!24247 (h!25456 (_ BitVec 64)) (t!34690 List!24251)) )
))
(declare-fun arrayNoDuplicates!0 (array!72223 (_ BitVec 32) List!24251) Bool)

(assert (=> b!1111231 (= res!741557 (arrayNoDuplicates!0 lt!496307 #b00000000000000000000000000000000 Nil!24248))))

(declare-fun b!1111232 () Bool)

(declare-fun e!633674 () Bool)

(assert (=> b!1111232 (= e!633674 e!633670)))

(declare-fun res!741551 () Bool)

(assert (=> b!1111232 (=> (not res!741551) (not e!633670))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72223 (_ BitVec 32)) Bool)

(assert (=> b!1111232 (= res!741551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496307 mask!1564))))

(declare-fun _keys!1208 () array!72223)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111232 (= lt!496307 (array!72224 (store (arr!34764 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35300 _keys!1208)))))

(declare-datatypes ((V!41997 0))(
  ( (V!41998 (val!13883 Int)) )
))
(declare-fun zeroValue!944 () V!41997)

(declare-datatypes ((tuple2!17568 0))(
  ( (tuple2!17569 (_1!8795 (_ BitVec 64)) (_2!8795 V!41997)) )
))
(declare-datatypes ((List!24252 0))(
  ( (Nil!24249) (Cons!24248 (h!25457 tuple2!17568) (t!34691 List!24252)) )
))
(declare-datatypes ((ListLongMap!15537 0))(
  ( (ListLongMap!15538 (toList!7784 List!24252)) )
))
(declare-fun call!46875 () ListLongMap!15537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41997)

(declare-datatypes ((ValueCell!13117 0))(
  ( (ValueCellFull!13117 (v!16516 V!41997)) (EmptyCell!13117) )
))
(declare-datatypes ((array!72225 0))(
  ( (array!72226 (arr!34765 (Array (_ BitVec 32) ValueCell!13117)) (size!35301 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72225)

(declare-fun bm!46872 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4276 (array!72223 array!72225 (_ BitVec 32) (_ BitVec 32) V!41997 V!41997 (_ BitVec 32) Int) ListLongMap!15537)

(assert (=> bm!46872 (= call!46875 (getCurrentListMapNoExtraKeys!4276 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111233 () Bool)

(declare-fun res!741553 () Bool)

(assert (=> b!1111233 (=> (not res!741553) (not e!633674))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111233 (= res!741553 (validKeyInArray!0 k!934))))

(declare-fun res!741558 () Bool)

(assert (=> start!97422 (=> (not res!741558) (not e!633674))))

(assert (=> start!97422 (= res!741558 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35300 _keys!1208))))))

(assert (=> start!97422 e!633674))

(declare-fun tp_is_empty!27653 () Bool)

(assert (=> start!97422 tp_is_empty!27653))

(declare-fun array_inv!26742 (array!72223) Bool)

(assert (=> start!97422 (array_inv!26742 _keys!1208)))

(assert (=> start!97422 true))

(assert (=> start!97422 tp!82478))

(declare-fun e!633673 () Bool)

(declare-fun array_inv!26743 (array!72225) Bool)

(assert (=> start!97422 (and (array_inv!26743 _values!996) e!633673)))

(declare-fun b!1111234 () Bool)

(declare-fun e!633669 () Bool)

(assert (=> b!1111234 (= e!633670 (not e!633669))))

(declare-fun res!741556 () Bool)

(assert (=> b!1111234 (=> res!741556 e!633669)))

(assert (=> b!1111234 (= res!741556 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35300 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111234 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36468 0))(
  ( (Unit!36469) )
))
(declare-fun lt!496305 () Unit!36468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72223 (_ BitVec 64) (_ BitVec 32)) Unit!36468)

(assert (=> b!1111234 (= lt!496305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!46873 () Bool)

(declare-fun call!46876 () ListLongMap!15537)

(declare-fun dynLambda!2404 (Int (_ BitVec 64)) V!41997)

(assert (=> bm!46873 (= call!46876 (getCurrentListMapNoExtraKeys!4276 lt!496307 (array!72226 (store (arr!34765 _values!996) i!673 (ValueCellFull!13117 (dynLambda!2404 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35301 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111235 () Bool)

(declare-fun res!741552 () Bool)

(assert (=> b!1111235 (=> (not res!741552) (not e!633674))))

(assert (=> b!1111235 (= res!741552 (and (= (size!35301 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35300 _keys!1208) (size!35301 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111236 () Bool)

(declare-fun e!633672 () Bool)

(declare-fun -!1053 (ListLongMap!15537 (_ BitVec 64)) ListLongMap!15537)

(assert (=> b!1111236 (= e!633672 (= call!46876 (-!1053 call!46875 k!934)))))

(declare-fun b!1111237 () Bool)

(assert (=> b!1111237 (= e!633672 (= call!46876 call!46875))))

(declare-fun mapIsEmpty!43297 () Bool)

(declare-fun mapRes!43297 () Bool)

(assert (=> mapIsEmpty!43297 mapRes!43297))

(declare-fun b!1111238 () Bool)

(assert (=> b!1111238 (= e!633669 true)))

(assert (=> b!1111238 e!633672))

(declare-fun c!109287 () Bool)

(assert (=> b!1111238 (= c!109287 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496306 () Unit!36468)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!301 (array!72223 array!72225 (_ BitVec 32) (_ BitVec 32) V!41997 V!41997 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36468)

(assert (=> b!1111238 (= lt!496306 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111239 () Bool)

(declare-fun res!741554 () Bool)

(assert (=> b!1111239 (=> (not res!741554) (not e!633674))))

(assert (=> b!1111239 (= res!741554 (= (select (arr!34764 _keys!1208) i!673) k!934))))

(declare-fun b!1111240 () Bool)

(declare-fun res!741549 () Bool)

(assert (=> b!1111240 (=> (not res!741549) (not e!633674))))

(assert (=> b!1111240 (= res!741549 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35300 _keys!1208))))))

(declare-fun b!1111241 () Bool)

(declare-fun e!633668 () Bool)

(assert (=> b!1111241 (= e!633673 (and e!633668 mapRes!43297))))

(declare-fun condMapEmpty!43297 () Bool)

(declare-fun mapDefault!43297 () ValueCell!13117)

