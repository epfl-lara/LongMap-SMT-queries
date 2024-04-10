; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101656 () Bool)

(assert start!101656)

(declare-fun b_free!26377 () Bool)

(declare-fun b_next!26377 () Bool)

(assert (=> start!101656 (= b_free!26377 (not b_next!26377))))

(declare-fun tp!92173 () Bool)

(declare-fun b_and!43997 () Bool)

(assert (=> start!101656 (= tp!92173 b_and!43997)))

(declare-fun b!1222914 () Bool)

(declare-fun res!812555 () Bool)

(declare-fun e!694516 () Bool)

(assert (=> b!1222914 (=> (not res!812555) (not e!694516))))

(declare-datatypes ((array!78945 0))(
  ( (array!78946 (arr!38100 (Array (_ BitVec 32) (_ BitVec 64))) (size!38636 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78945)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78945 (_ BitVec 32)) Bool)

(assert (=> b!1222914 (= res!812555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222915 () Bool)

(declare-fun res!812557 () Bool)

(assert (=> b!1222915 (=> (not res!812557) (not e!694516))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222915 (= res!812557 (validKeyInArray!0 k!934))))

(declare-fun b!1222916 () Bool)

(declare-fun res!812549 () Bool)

(assert (=> b!1222916 (=> (not res!812549) (not e!694516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222916 (= res!812549 (validMask!0 mask!1564))))

(declare-fun b!1222917 () Bool)

(declare-fun e!694523 () Bool)

(declare-fun e!694518 () Bool)

(assert (=> b!1222917 (= e!694523 e!694518)))

(declare-fun res!812545 () Bool)

(assert (=> b!1222917 (=> res!812545 e!694518)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1222917 (= res!812545 (not (validKeyInArray!0 (select (arr!38100 _keys!1208) from!1455))))))

(declare-datatypes ((V!46569 0))(
  ( (V!46570 (val!15597 Int)) )
))
(declare-datatypes ((tuple2!20094 0))(
  ( (tuple2!20095 (_1!10058 (_ BitVec 64)) (_2!10058 V!46569)) )
))
(declare-datatypes ((List!26894 0))(
  ( (Nil!26891) (Cons!26890 (h!28099 tuple2!20094) (t!40251 List!26894)) )
))
(declare-datatypes ((ListLongMap!18063 0))(
  ( (ListLongMap!18064 (toList!9047 List!26894)) )
))
(declare-fun lt!556494 () ListLongMap!18063)

(declare-fun lt!556503 () ListLongMap!18063)

(assert (=> b!1222917 (= lt!556494 lt!556503)))

(declare-fun lt!556499 () ListLongMap!18063)

(declare-fun -!1950 (ListLongMap!18063 (_ BitVec 64)) ListLongMap!18063)

(assert (=> b!1222917 (= lt!556503 (-!1950 lt!556499 k!934))))

(declare-fun zeroValue!944 () V!46569)

(declare-datatypes ((ValueCell!14831 0))(
  ( (ValueCellFull!14831 (v!18258 V!46569)) (EmptyCell!14831) )
))
(declare-datatypes ((array!78947 0))(
  ( (array!78948 (arr!38101 (Array (_ BitVec 32) ValueCell!14831)) (size!38637 (_ BitVec 32))) )
))
(declare-fun lt!556497 () array!78947)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!46569)

(declare-fun lt!556498 () array!78945)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5469 (array!78945 array!78947 (_ BitVec 32) (_ BitVec 32) V!46569 V!46569 (_ BitVec 32) Int) ListLongMap!18063)

(assert (=> b!1222917 (= lt!556494 (getCurrentListMapNoExtraKeys!5469 lt!556498 lt!556497 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78947)

(assert (=> b!1222917 (= lt!556499 (getCurrentListMapNoExtraKeys!5469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40511 0))(
  ( (Unit!40512) )
))
(declare-fun lt!556500 () Unit!40511)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1157 (array!78945 array!78947 (_ BitVec 32) (_ BitVec 32) V!46569 V!46569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40511)

(assert (=> b!1222917 (= lt!556500 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222918 () Bool)

(declare-fun e!694525 () Unit!40511)

(declare-fun Unit!40513 () Unit!40511)

(assert (=> b!1222918 (= e!694525 Unit!40513)))

(declare-fun b!1222919 () Bool)

(declare-fun e!694517 () Bool)

(declare-fun e!694520 () Bool)

(assert (=> b!1222919 (= e!694517 (not e!694520))))

(declare-fun res!812553 () Bool)

(assert (=> b!1222919 (=> res!812553 e!694520)))

(assert (=> b!1222919 (= res!812553 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222919 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!556493 () Unit!40511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78945 (_ BitVec 64) (_ BitVec 32)) Unit!40511)

(assert (=> b!1222919 (= lt!556493 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222920 () Bool)

(assert (=> b!1222920 (= e!694520 e!694523)))

(declare-fun res!812546 () Bool)

(assert (=> b!1222920 (=> res!812546 e!694523)))

(assert (=> b!1222920 (= res!812546 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!556492 () ListLongMap!18063)

(assert (=> b!1222920 (= lt!556492 (getCurrentListMapNoExtraKeys!5469 lt!556498 lt!556497 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556496 () V!46569)

(assert (=> b!1222920 (= lt!556497 (array!78948 (store (arr!38101 _values!996) i!673 (ValueCellFull!14831 lt!556496)) (size!38637 _values!996)))))

(declare-fun dynLambda!3345 (Int (_ BitVec 64)) V!46569)

(assert (=> b!1222920 (= lt!556496 (dynLambda!3345 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556504 () ListLongMap!18063)

(assert (=> b!1222920 (= lt!556504 (getCurrentListMapNoExtraKeys!5469 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222921 () Bool)

(declare-fun Unit!40514 () Unit!40511)

(assert (=> b!1222921 (= e!694525 Unit!40514)))

(declare-fun lt!556495 () Unit!40511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78945 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40511)

(assert (=> b!1222921 (= lt!556495 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222921 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556502 () Unit!40511)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78945 (_ BitVec 32) (_ BitVec 32)) Unit!40511)

(assert (=> b!1222921 (= lt!556502 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26895 0))(
  ( (Nil!26892) (Cons!26891 (h!28100 (_ BitVec 64)) (t!40252 List!26895)) )
))
(declare-fun arrayNoDuplicates!0 (array!78945 (_ BitVec 32) List!26895) Bool)

(assert (=> b!1222921 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26892)))

(declare-fun lt!556491 () Unit!40511)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78945 (_ BitVec 64) (_ BitVec 32) List!26895) Unit!40511)

(assert (=> b!1222921 (= lt!556491 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26892))))

(assert (=> b!1222921 false))

(declare-fun b!1222922 () Bool)

(declare-fun res!812556 () Bool)

(assert (=> b!1222922 (=> (not res!812556) (not e!694516))))

(assert (=> b!1222922 (= res!812556 (= (select (arr!38100 _keys!1208) i!673) k!934))))

(declare-fun b!1222923 () Bool)

(declare-fun e!694521 () Bool)

(declare-fun e!694522 () Bool)

(declare-fun mapRes!48517 () Bool)

(assert (=> b!1222923 (= e!694521 (and e!694522 mapRes!48517))))

(declare-fun condMapEmpty!48517 () Bool)

(declare-fun mapDefault!48517 () ValueCell!14831)

