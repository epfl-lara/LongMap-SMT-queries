; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101764 () Bool)

(assert start!101764)

(declare-fun b_free!26453 () Bool)

(declare-fun b_next!26453 () Bool)

(assert (=> start!101764 (= b_free!26453 (not b_next!26453))))

(declare-fun tp!92404 () Bool)

(declare-fun b_and!44167 () Bool)

(assert (=> start!101764 (= tp!92404 b_and!44167)))

(declare-fun b!1225505 () Bool)

(declare-fun e!696043 () Bool)

(declare-fun e!696045 () Bool)

(assert (=> b!1225505 (= e!696043 e!696045)))

(declare-fun res!814416 () Bool)

(assert (=> b!1225505 (=> res!814416 e!696045)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225505 (= res!814416 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46669 0))(
  ( (V!46670 (val!15635 Int)) )
))
(declare-fun zeroValue!944 () V!46669)

(declare-datatypes ((array!79093 0))(
  ( (array!79094 (arr!38173 (Array (_ BitVec 32) (_ BitVec 64))) (size!38709 (_ BitVec 32))) )
))
(declare-fun lt!558469 () array!79093)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46669)

(declare-datatypes ((tuple2!20152 0))(
  ( (tuple2!20153 (_1!10087 (_ BitVec 64)) (_2!10087 V!46669)) )
))
(declare-datatypes ((List!26953 0))(
  ( (Nil!26950) (Cons!26949 (h!28158 tuple2!20152) (t!40386 List!26953)) )
))
(declare-datatypes ((ListLongMap!18121 0))(
  ( (ListLongMap!18122 (toList!9076 List!26953)) )
))
(declare-fun lt!558470 () ListLongMap!18121)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14869 0))(
  ( (ValueCellFull!14869 (v!18297 V!46669)) (EmptyCell!14869) )
))
(declare-datatypes ((array!79095 0))(
  ( (array!79096 (arr!38174 (Array (_ BitVec 32) ValueCell!14869)) (size!38710 (_ BitVec 32))) )
))
(declare-fun lt!558468 () array!79095)

(declare-fun getCurrentListMapNoExtraKeys!5495 (array!79093 array!79095 (_ BitVec 32) (_ BitVec 32) V!46669 V!46669 (_ BitVec 32) Int) ListLongMap!18121)

(assert (=> b!1225505 (= lt!558470 (getCurrentListMapNoExtraKeys!5495 lt!558469 lt!558468 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!79095)

(declare-fun lt!558475 () V!46669)

(assert (=> b!1225505 (= lt!558468 (array!79096 (store (arr!38174 _values!996) i!673 (ValueCellFull!14869 lt!558475)) (size!38710 _values!996)))))

(declare-fun dynLambda!3367 (Int (_ BitVec 64)) V!46669)

(assert (=> b!1225505 (= lt!558475 (dynLambda!3367 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!79093)

(declare-fun lt!558462 () ListLongMap!18121)

(assert (=> b!1225505 (= lt!558462 (getCurrentListMapNoExtraKeys!5495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225506 () Bool)

(declare-fun res!814404 () Bool)

(declare-fun e!696046 () Bool)

(assert (=> b!1225506 (=> (not res!814404) (not e!696046))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1225506 (= res!814404 (= (select (arr!38173 _keys!1208) i!673) k!934))))

(declare-fun b!1225507 () Bool)

(declare-fun res!814403 () Bool)

(assert (=> b!1225507 (=> (not res!814403) (not e!696046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79093 (_ BitVec 32)) Bool)

(assert (=> b!1225507 (= res!814403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225508 () Bool)

(declare-fun e!696050 () Bool)

(declare-fun -!1975 (ListLongMap!18121 (_ BitVec 64)) ListLongMap!18121)

(assert (=> b!1225508 (= e!696050 (= lt!558470 (-!1975 lt!558462 k!934)))))

(declare-fun lt!558476 () ListLongMap!18121)

(declare-fun lt!558473 () ListLongMap!18121)

(assert (=> b!1225508 (= (-!1975 lt!558476 k!934) lt!558473)))

(declare-fun lt!558474 () ListLongMap!18121)

(declare-fun lt!558460 () V!46669)

(declare-datatypes ((Unit!40617 0))(
  ( (Unit!40618) )
))
(declare-fun lt!558471 () Unit!40617)

(declare-fun addRemoveCommutativeForDiffKeys!217 (ListLongMap!18121 (_ BitVec 64) V!46669 (_ BitVec 64)) Unit!40617)

(assert (=> b!1225508 (= lt!558471 (addRemoveCommutativeForDiffKeys!217 lt!558474 (select (arr!38173 _keys!1208) from!1455) lt!558460 k!934))))

(declare-fun lt!558459 () ListLongMap!18121)

(declare-fun lt!558466 () ListLongMap!18121)

(assert (=> b!1225508 (and (= lt!558462 lt!558476) (= lt!558459 lt!558466))))

(declare-fun lt!558472 () tuple2!20152)

(declare-fun +!4130 (ListLongMap!18121 tuple2!20152) ListLongMap!18121)

(assert (=> b!1225508 (= lt!558476 (+!4130 lt!558474 lt!558472))))

(assert (=> b!1225508 (not (= (select (arr!38173 _keys!1208) from!1455) k!934))))

(declare-fun lt!558461 () Unit!40617)

(declare-fun e!696041 () Unit!40617)

(assert (=> b!1225508 (= lt!558461 e!696041)))

(declare-fun c!120500 () Bool)

(assert (=> b!1225508 (= c!120500 (= (select (arr!38173 _keys!1208) from!1455) k!934))))

(declare-fun e!696048 () Bool)

(assert (=> b!1225508 e!696048))

(declare-fun res!814415 () Bool)

(assert (=> b!1225508 (=> (not res!814415) (not e!696048))))

(assert (=> b!1225508 (= res!814415 (= lt!558470 lt!558473))))

(assert (=> b!1225508 (= lt!558473 (+!4130 lt!558459 lt!558472))))

(assert (=> b!1225508 (= lt!558472 (tuple2!20153 (select (arr!38173 _keys!1208) from!1455) lt!558460))))

(declare-fun get!19500 (ValueCell!14869 V!46669) V!46669)

(assert (=> b!1225508 (= lt!558460 (get!19500 (select (arr!38174 _values!996) from!1455) lt!558475))))

(declare-fun mapNonEmpty!48634 () Bool)

(declare-fun mapRes!48634 () Bool)

(declare-fun tp!92405 () Bool)

(declare-fun e!696049 () Bool)

(assert (=> mapNonEmpty!48634 (= mapRes!48634 (and tp!92405 e!696049))))

(declare-fun mapKey!48634 () (_ BitVec 32))

(declare-fun mapRest!48634 () (Array (_ BitVec 32) ValueCell!14869))

(declare-fun mapValue!48634 () ValueCell!14869)

(assert (=> mapNonEmpty!48634 (= (arr!38174 _values!996) (store mapRest!48634 mapKey!48634 mapValue!48634))))

(declare-fun b!1225510 () Bool)

(assert (=> b!1225510 (= e!696045 e!696050)))

(declare-fun res!814407 () Bool)

(assert (=> b!1225510 (=> res!814407 e!696050)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225510 (= res!814407 (not (validKeyInArray!0 (select (arr!38173 _keys!1208) from!1455))))))

(assert (=> b!1225510 (= lt!558466 lt!558459)))

(assert (=> b!1225510 (= lt!558459 (-!1975 lt!558474 k!934))))

(assert (=> b!1225510 (= lt!558466 (getCurrentListMapNoExtraKeys!5495 lt!558469 lt!558468 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225510 (= lt!558474 (getCurrentListMapNoExtraKeys!5495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558464 () Unit!40617)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1181 (array!79093 array!79095 (_ BitVec 32) (_ BitVec 32) V!46669 V!46669 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40617)

(assert (=> b!1225510 (= lt!558464 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1181 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225511 () Bool)

(declare-fun Unit!40619 () Unit!40617)

(assert (=> b!1225511 (= e!696041 Unit!40619)))

(declare-fun lt!558467 () Unit!40617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79093 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40617)

(assert (=> b!1225511 (= lt!558467 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225511 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558465 () Unit!40617)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79093 (_ BitVec 32) (_ BitVec 32)) Unit!40617)

(assert (=> b!1225511 (= lt!558465 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26954 0))(
  ( (Nil!26951) (Cons!26950 (h!28159 (_ BitVec 64)) (t!40387 List!26954)) )
))
(declare-fun arrayNoDuplicates!0 (array!79093 (_ BitVec 32) List!26954) Bool)

(assert (=> b!1225511 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26951)))

(declare-fun lt!558458 () Unit!40617)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79093 (_ BitVec 64) (_ BitVec 32) List!26954) Unit!40617)

(assert (=> b!1225511 (= lt!558458 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26951))))

(assert (=> b!1225511 false))

(declare-fun b!1225512 () Bool)

(declare-fun res!814417 () Bool)

(declare-fun e!696051 () Bool)

(assert (=> b!1225512 (=> (not res!814417) (not e!696051))))

(assert (=> b!1225512 (= res!814417 (arrayNoDuplicates!0 lt!558469 #b00000000000000000000000000000000 Nil!26951))))

(declare-fun b!1225513 () Bool)

(assert (=> b!1225513 (= e!696046 e!696051)))

(declare-fun res!814409 () Bool)

(assert (=> b!1225513 (=> (not res!814409) (not e!696051))))

(assert (=> b!1225513 (= res!814409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558469 mask!1564))))

(assert (=> b!1225513 (= lt!558469 (array!79094 (store (arr!38173 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38709 _keys!1208)))))

(declare-fun b!1225514 () Bool)

(declare-fun e!696047 () Bool)

(declare-fun e!696042 () Bool)

(assert (=> b!1225514 (= e!696047 (and e!696042 mapRes!48634))))

(declare-fun condMapEmpty!48634 () Bool)

(declare-fun mapDefault!48634 () ValueCell!14869)

