; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101650 () Bool)

(assert start!101650)

(declare-fun b_free!26371 () Bool)

(declare-fun b_next!26371 () Bool)

(assert (=> start!101650 (= b_free!26371 (not b_next!26371))))

(declare-fun tp!92156 () Bool)

(declare-fun b_and!43985 () Bool)

(assert (=> start!101650 (= tp!92156 b_and!43985)))

(declare-fun b!1222728 () Bool)

(declare-fun e!694418 () Bool)

(declare-fun e!694412 () Bool)

(assert (=> b!1222728 (= e!694418 (not e!694412))))

(declare-fun res!812409 () Bool)

(assert (=> b!1222728 (=> res!812409 e!694412)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222728 (= res!812409 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78933 0))(
  ( (array!78934 (arr!38094 (Array (_ BitVec 32) (_ BitVec 64))) (size!38630 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78933)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222728 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40500 0))(
  ( (Unit!40501) )
))
(declare-fun lt!556374 () Unit!40500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78933 (_ BitVec 64) (_ BitVec 32)) Unit!40500)

(assert (=> b!1222728 (= lt!556374 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222729 () Bool)

(declare-fun res!812418 () Bool)

(declare-fun e!694416 () Bool)

(assert (=> b!1222729 (=> (not res!812418) (not e!694416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222729 (= res!812418 (validKeyInArray!0 k!934))))

(declare-fun res!812413 () Bool)

(assert (=> start!101650 (=> (not res!812413) (not e!694416))))

(assert (=> start!101650 (= res!812413 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38630 _keys!1208))))))

(assert (=> start!101650 e!694416))

(declare-fun tp_is_empty!31075 () Bool)

(assert (=> start!101650 tp_is_empty!31075))

(declare-fun array_inv!28986 (array!78933) Bool)

(assert (=> start!101650 (array_inv!28986 _keys!1208)))

(assert (=> start!101650 true))

(assert (=> start!101650 tp!92156))

(declare-datatypes ((V!46561 0))(
  ( (V!46562 (val!15594 Int)) )
))
(declare-datatypes ((ValueCell!14828 0))(
  ( (ValueCellFull!14828 (v!18255 V!46561)) (EmptyCell!14828) )
))
(declare-datatypes ((array!78935 0))(
  ( (array!78936 (arr!38095 (Array (_ BitVec 32) ValueCell!14828)) (size!38631 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78935)

(declare-fun e!694417 () Bool)

(declare-fun array_inv!28987 (array!78935) Bool)

(assert (=> start!101650 (and (array_inv!28987 _values!996) e!694417)))

(declare-fun b!1222730 () Bool)

(declare-fun e!694414 () Bool)

(declare-fun e!694415 () Bool)

(assert (=> b!1222730 (= e!694414 e!694415)))

(declare-fun res!812422 () Bool)

(assert (=> b!1222730 (=> res!812422 e!694415)))

(assert (=> b!1222730 (= res!812422 (not (= (select (arr!38094 _keys!1208) from!1455) k!934)))))

(declare-fun b!1222731 () Bool)

(assert (=> b!1222731 (= e!694416 e!694418)))

(declare-fun res!812412 () Bool)

(assert (=> b!1222731 (=> (not res!812412) (not e!694418))))

(declare-fun lt!556375 () array!78933)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78933 (_ BitVec 32)) Bool)

(assert (=> b!1222731 (= res!812412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556375 mask!1564))))

(assert (=> b!1222731 (= lt!556375 (array!78934 (store (arr!38094 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38630 _keys!1208)))))

(declare-fun b!1222732 () Bool)

(declare-fun res!812423 () Bool)

(assert (=> b!1222732 (=> (not res!812423) (not e!694416))))

(assert (=> b!1222732 (= res!812423 (= (select (arr!38094 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!48508 () Bool)

(declare-fun mapRes!48508 () Bool)

(declare-fun tp!92155 () Bool)

(declare-fun e!694419 () Bool)

(assert (=> mapNonEmpty!48508 (= mapRes!48508 (and tp!92155 e!694419))))

(declare-fun mapKey!48508 () (_ BitVec 32))

(declare-fun mapValue!48508 () ValueCell!14828)

(declare-fun mapRest!48508 () (Array (_ BitVec 32) ValueCell!14828))

(assert (=> mapNonEmpty!48508 (= (arr!38095 _values!996) (store mapRest!48508 mapKey!48508 mapValue!48508))))

(declare-fun mapIsEmpty!48508 () Bool)

(assert (=> mapIsEmpty!48508 mapRes!48508))

(declare-fun b!1222733 () Bool)

(declare-fun e!694413 () Unit!40500)

(declare-fun Unit!40502 () Unit!40500)

(assert (=> b!1222733 (= e!694413 Unit!40502)))

(declare-fun b!1222734 () Bool)

(declare-fun e!694409 () Bool)

(assert (=> b!1222734 (= e!694412 e!694409)))

(declare-fun res!812414 () Bool)

(assert (=> b!1222734 (=> res!812414 e!694409)))

(assert (=> b!1222734 (= res!812414 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20088 0))(
  ( (tuple2!20089 (_1!10055 (_ BitVec 64)) (_2!10055 V!46561)) )
))
(declare-datatypes ((List!26888 0))(
  ( (Nil!26885) (Cons!26884 (h!28093 tuple2!20088) (t!40239 List!26888)) )
))
(declare-datatypes ((ListLongMap!18057 0))(
  ( (ListLongMap!18058 (toList!9044 List!26888)) )
))
(declare-fun lt!556369 () ListLongMap!18057)

(declare-fun zeroValue!944 () V!46561)

(declare-fun lt!556371 () array!78935)

(declare-fun minValue!944 () V!46561)

(declare-fun getCurrentListMapNoExtraKeys!5466 (array!78933 array!78935 (_ BitVec 32) (_ BitVec 32) V!46561 V!46561 (_ BitVec 32) Int) ListLongMap!18057)

(assert (=> b!1222734 (= lt!556369 (getCurrentListMapNoExtraKeys!5466 lt!556375 lt!556371 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556367 () V!46561)

(assert (=> b!1222734 (= lt!556371 (array!78936 (store (arr!38095 _values!996) i!673 (ValueCellFull!14828 lt!556367)) (size!38631 _values!996)))))

(declare-fun dynLambda!3342 (Int (_ BitVec 64)) V!46561)

(assert (=> b!1222734 (= lt!556367 (dynLambda!3342 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556368 () ListLongMap!18057)

(assert (=> b!1222734 (= lt!556368 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1222735 () Bool)

(declare-fun res!812417 () Bool)

(assert (=> b!1222735 (=> (not res!812417) (not e!694416))))

(assert (=> b!1222735 (= res!812417 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38630 _keys!1208))))))

(declare-fun b!1222736 () Bool)

(assert (=> b!1222736 (= e!694419 tp_is_empty!31075)))

(declare-fun b!1222737 () Bool)

(declare-fun e!694408 () Bool)

(assert (=> b!1222737 (= e!694408 tp_is_empty!31075)))

(declare-fun b!1222738 () Bool)

(declare-fun e!694410 () Bool)

(assert (=> b!1222738 (= e!694410 (bvslt from!1455 (size!38630 _keys!1208)))))

(assert (=> b!1222738 (not (= (select (arr!38094 _keys!1208) from!1455) k!934))))

(declare-fun lt!556378 () Unit!40500)

(assert (=> b!1222738 (= lt!556378 e!694413)))

(declare-fun c!120338 () Bool)

(assert (=> b!1222738 (= c!120338 (= (select (arr!38094 _keys!1208) from!1455) k!934))))

(assert (=> b!1222738 e!694414))

(declare-fun res!812415 () Bool)

(assert (=> b!1222738 (=> (not res!812415) (not e!694414))))

(declare-fun lt!556373 () ListLongMap!18057)

(declare-fun +!4104 (ListLongMap!18057 tuple2!20088) ListLongMap!18057)

(declare-fun get!19449 (ValueCell!14828 V!46561) V!46561)

(assert (=> b!1222738 (= res!812415 (= lt!556369 (+!4104 lt!556373 (tuple2!20089 (select (arr!38094 _keys!1208) from!1455) (get!19449 (select (arr!38095 _values!996) from!1455) lt!556367)))))))

(declare-fun b!1222739 () Bool)

(assert (=> b!1222739 (= e!694409 e!694410)))

(declare-fun res!812410 () Bool)

(assert (=> b!1222739 (=> res!812410 e!694410)))

(assert (=> b!1222739 (= res!812410 (not (validKeyInArray!0 (select (arr!38094 _keys!1208) from!1455))))))

(declare-fun lt!556372 () ListLongMap!18057)

(assert (=> b!1222739 (= lt!556372 lt!556373)))

(declare-fun lt!556366 () ListLongMap!18057)

(declare-fun -!1947 (ListLongMap!18057 (_ BitVec 64)) ListLongMap!18057)

(assert (=> b!1222739 (= lt!556373 (-!1947 lt!556366 k!934))))

(assert (=> b!1222739 (= lt!556372 (getCurrentListMapNoExtraKeys!5466 lt!556375 lt!556371 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222739 (= lt!556366 (getCurrentListMapNoExtraKeys!5466 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556376 () Unit!40500)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1154 (array!78933 array!78935 (_ BitVec 32) (_ BitVec 32) V!46561 V!46561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40500)

(assert (=> b!1222739 (= lt!556376 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1154 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222740 () Bool)

(declare-fun res!812411 () Bool)

(assert (=> b!1222740 (=> (not res!812411) (not e!694416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222740 (= res!812411 (validMask!0 mask!1564))))

(declare-fun b!1222741 () Bool)

(assert (=> b!1222741 (= e!694415 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1222742 () Bool)

(declare-fun res!812416 () Bool)

(assert (=> b!1222742 (=> (not res!812416) (not e!694416))))

(assert (=> b!1222742 (= res!812416 (and (= (size!38631 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38630 _keys!1208) (size!38631 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222743 () Bool)

(declare-fun res!812420 () Bool)

(assert (=> b!1222743 (=> (not res!812420) (not e!694418))))

(declare-datatypes ((List!26889 0))(
  ( (Nil!26886) (Cons!26885 (h!28094 (_ BitVec 64)) (t!40240 List!26889)) )
))
(declare-fun arrayNoDuplicates!0 (array!78933 (_ BitVec 32) List!26889) Bool)

(assert (=> b!1222743 (= res!812420 (arrayNoDuplicates!0 lt!556375 #b00000000000000000000000000000000 Nil!26886))))

(declare-fun b!1222744 () Bool)

(declare-fun Unit!40503 () Unit!40500)

(assert (=> b!1222744 (= e!694413 Unit!40503)))

(declare-fun lt!556365 () Unit!40500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78933 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40500)

(assert (=> b!1222744 (= lt!556365 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222744 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556370 () Unit!40500)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78933 (_ BitVec 32) (_ BitVec 32)) Unit!40500)

(assert (=> b!1222744 (= lt!556370 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1222744 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26886)))

(declare-fun lt!556377 () Unit!40500)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78933 (_ BitVec 64) (_ BitVec 32) List!26889) Unit!40500)

(assert (=> b!1222744 (= lt!556377 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26886))))

(assert (=> b!1222744 false))

(declare-fun b!1222745 () Bool)

(declare-fun res!812419 () Bool)

(assert (=> b!1222745 (=> (not res!812419) (not e!694416))))

(assert (=> b!1222745 (= res!812419 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26886))))

(declare-fun b!1222746 () Bool)

(declare-fun res!812421 () Bool)

(assert (=> b!1222746 (=> (not res!812421) (not e!694416))))

(assert (=> b!1222746 (= res!812421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222747 () Bool)

(assert (=> b!1222747 (= e!694417 (and e!694408 mapRes!48508))))

(declare-fun condMapEmpty!48508 () Bool)

(declare-fun mapDefault!48508 () ValueCell!14828)

