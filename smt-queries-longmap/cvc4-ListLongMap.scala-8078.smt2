; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99338 () Bool)

(assert start!99338)

(declare-fun b_free!24917 () Bool)

(declare-fun b_next!24917 () Bool)

(assert (=> start!99338 (= b_free!24917 (not b_next!24917))))

(declare-fun tp!87464 () Bool)

(declare-fun b_and!40701 () Bool)

(assert (=> start!99338 (= tp!87464 b_and!40701)))

(declare-fun b!1171243 () Bool)

(declare-fun e!665731 () Bool)

(declare-fun e!665724 () Bool)

(assert (=> b!1171243 (= e!665731 e!665724)))

(declare-fun res!777437 () Bool)

(assert (=> b!1171243 (=> res!777437 e!665724)))

(declare-datatypes ((array!75713 0))(
  ( (array!75714 (arr!36506 (Array (_ BitVec 32) (_ BitVec 64))) (size!37042 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75713)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171243 (= res!777437 (not (= (select (arr!36506 _keys!1208) from!1455) k!934)))))

(declare-fun b!1171244 () Bool)

(declare-fun res!777442 () Bool)

(declare-fun e!665721 () Bool)

(assert (=> b!1171244 (=> (not res!777442) (not e!665721))))

(declare-datatypes ((List!25616 0))(
  ( (Nil!25613) (Cons!25612 (h!26821 (_ BitVec 64)) (t!37525 List!25616)) )
))
(declare-fun arrayNoDuplicates!0 (array!75713 (_ BitVec 32) List!25616) Bool)

(assert (=> b!1171244 (= res!777442 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25613))))

(declare-fun b!1171245 () Bool)

(declare-fun res!777450 () Bool)

(assert (=> b!1171245 (=> (not res!777450) (not e!665721))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75713 (_ BitVec 32)) Bool)

(assert (=> b!1171245 (= res!777450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171246 () Bool)

(declare-fun res!777449 () Bool)

(declare-fun e!665730 () Bool)

(assert (=> b!1171246 (=> (not res!777449) (not e!665730))))

(declare-fun lt!527589 () array!75713)

(assert (=> b!1171246 (= res!777449 (arrayNoDuplicates!0 lt!527589 #b00000000000000000000000000000000 Nil!25613))))

(declare-fun b!1171248 () Bool)

(assert (=> b!1171248 (= e!665721 e!665730)))

(declare-fun res!777439 () Bool)

(assert (=> b!1171248 (=> (not res!777439) (not e!665730))))

(assert (=> b!1171248 (= res!777439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527589 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171248 (= lt!527589 (array!75714 (store (arr!36506 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37042 _keys!1208)))))

(declare-fun b!1171249 () Bool)

(declare-fun e!665719 () Bool)

(declare-fun e!665728 () Bool)

(assert (=> b!1171249 (= e!665719 e!665728)))

(declare-fun res!777441 () Bool)

(assert (=> b!1171249 (=> res!777441 e!665728)))

(assert (=> b!1171249 (= res!777441 (not (= (select (arr!36506 _keys!1208) from!1455) k!934)))))

(assert (=> b!1171249 e!665731))

(declare-fun res!777445 () Bool)

(assert (=> b!1171249 (=> (not res!777445) (not e!665731))))

(declare-datatypes ((V!44389 0))(
  ( (V!44390 (val!14780 Int)) )
))
(declare-fun lt!527594 () V!44389)

(declare-datatypes ((tuple2!18880 0))(
  ( (tuple2!18881 (_1!9451 (_ BitVec 64)) (_2!9451 V!44389)) )
))
(declare-datatypes ((List!25617 0))(
  ( (Nil!25614) (Cons!25613 (h!26822 tuple2!18880) (t!37526 List!25617)) )
))
(declare-datatypes ((ListLongMap!16849 0))(
  ( (ListLongMap!16850 (toList!8440 List!25617)) )
))
(declare-fun lt!527592 () ListLongMap!16849)

(declare-datatypes ((ValueCell!14014 0))(
  ( (ValueCellFull!14014 (v!17418 V!44389)) (EmptyCell!14014) )
))
(declare-datatypes ((array!75715 0))(
  ( (array!75716 (arr!36507 (Array (_ BitVec 32) ValueCell!14014)) (size!37043 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75715)

(declare-fun lt!527593 () ListLongMap!16849)

(declare-fun +!3767 (ListLongMap!16849 tuple2!18880) ListLongMap!16849)

(declare-fun get!18619 (ValueCell!14014 V!44389) V!44389)

(assert (=> b!1171249 (= res!777445 (= lt!527593 (+!3767 lt!527592 (tuple2!18881 (select (arr!36506 _keys!1208) from!1455) (get!18619 (select (arr!36507 _values!996) from!1455) lt!527594)))))))

(declare-fun b!1171250 () Bool)

(declare-fun e!665723 () Bool)

(assert (=> b!1171250 (= e!665728 e!665723)))

(declare-fun res!777452 () Bool)

(assert (=> b!1171250 (=> res!777452 e!665723)))

(assert (=> b!1171250 (= res!777452 (or (bvsge (size!37042 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37042 _keys!1208)) (bvsge from!1455 (size!37042 _keys!1208))))))

(assert (=> b!1171250 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25613)))

(declare-datatypes ((Unit!38634 0))(
  ( (Unit!38635) )
))
(declare-fun lt!527591 () Unit!38634)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75713 (_ BitVec 32) (_ BitVec 32)) Unit!38634)

(assert (=> b!1171250 (= lt!527591 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171250 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527599 () Unit!38634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75713 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38634)

(assert (=> b!1171250 (= lt!527599 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171251 () Bool)

(declare-fun e!665720 () Bool)

(assert (=> b!1171251 (= e!665720 e!665719)))

(declare-fun res!777446 () Bool)

(assert (=> b!1171251 (=> res!777446 e!665719)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171251 (= res!777446 (not (validKeyInArray!0 (select (arr!36506 _keys!1208) from!1455))))))

(declare-fun lt!527597 () ListLongMap!16849)

(assert (=> b!1171251 (= lt!527597 lt!527592)))

(declare-fun lt!527595 () ListLongMap!16849)

(declare-fun -!1510 (ListLongMap!16849 (_ BitVec 64)) ListLongMap!16849)

(assert (=> b!1171251 (= lt!527592 (-!1510 lt!527595 k!934))))

(declare-fun zeroValue!944 () V!44389)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!527598 () array!75715)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44389)

(declare-fun getCurrentListMapNoExtraKeys!4904 (array!75713 array!75715 (_ BitVec 32) (_ BitVec 32) V!44389 V!44389 (_ BitVec 32) Int) ListLongMap!16849)

(assert (=> b!1171251 (= lt!527597 (getCurrentListMapNoExtraKeys!4904 lt!527589 lt!527598 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171251 (= lt!527595 (getCurrentListMapNoExtraKeys!4904 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527600 () Unit!38634)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!737 (array!75713 array!75715 (_ BitVec 32) (_ BitVec 32) V!44389 V!44389 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38634)

(assert (=> b!1171251 (= lt!527600 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!737 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171252 () Bool)

(declare-fun e!665726 () Bool)

(declare-fun tp_is_empty!29447 () Bool)

(assert (=> b!1171252 (= e!665726 tp_is_empty!29447)))

(declare-fun b!1171253 () Bool)

(declare-fun e!665729 () Bool)

(declare-fun e!665725 () Bool)

(declare-fun mapRes!45998 () Bool)

(assert (=> b!1171253 (= e!665729 (and e!665725 mapRes!45998))))

(declare-fun condMapEmpty!45998 () Bool)

(declare-fun mapDefault!45998 () ValueCell!14014)

